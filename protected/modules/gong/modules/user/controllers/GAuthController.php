<?php
class GAuthController extends GController {
	public $defaultAction = 'login';
	public $loginForm = null;
	public function redirectUser($user) {
		$session = Yii::app ()->session;
		$session->open ();
		$session ['refresh'] = true;
		if ((isset ( Yii::app ()->user->data->profile ) && ! Yii::app ()->user->data->profile->validate ()) || ! isset ( Yii::app ()->user->data->profile ))
			$this->redirect ( '/page/profile' );
		
		$user->lastvisit = time ();
		$user->save ( true, array (
				'lastvisit' 
		) );
		
		// Yii::app()->user->setState('processing', GDrawWidget::refreshWidgetByName('template'));
		if (isset ( $_POST ) && isset ( $_POST ['returnUrl'] ))
			$this->redirect ( array (
					$_POST ['returnUrl'] 
			) );
		if (isset ( Yii::app ()->user->returnUrl ))
			$this->redirect ( Yii::app ()->user->returnUrl );
		
		if ($user->isPasswordExpired ())
			$this->redirect ( array (
					'passwordexpired' 
			) );
		
		if (G::module ()->returnUrl !== '')
			$this->redirect ( G::module ()->returnUrl );
		else
			$this->redirect ( Yii::app ()->user->returnUrl );
		$this->redirect ( G::module ()->firstVisitUrl );
	}
	
	public function loginByUsername() {
		if (G::module ()->caseSensitiveUsers)
			$user = GUser::model ()->find ( 'username = :username', array (
					':username' => $this->loginForm->username 
			) );
		else
			$user = GUser::model ()->find ( 'upper(username) = :username', array (
					':username' => strtoupper ( $this->loginForm->username ) 
			) );
		$profile = GProfile::model ()->find ( 'email = :email', array (
				'email' => $this->loginForm->username 
		) );
		
		if ($profile)
			$user = $profile->user;
		
		if ($user)
			return $this->authenticate ( $user );
		else {
			G::log ( G::t ( 'Non-existent user {username} tried to log in (Ip-Address: {ip})', array (
					'{ip}' => Yii::app ()->request->getUserHostAddress (),
					'{username}' => $this->loginForm->username 
			) ), 'error' );
			
			$this->loginForm->addError ( 'password', G::t ( 'Username or Password is incorrect' ) );
		}
		
		return false;
	}
	public function authenticate($user) {
		$identity = new GUserIdentity ( $user->username, $this->loginForm->password );
		$identity->authenticate ();
		switch ($identity->errorCode) {
			case GUserIdentity::ERROR_NONE :
				$duration = $this->loginForm->rememberMe ? 3600 * 24 * 30 : 0; // 30 days
				Yii::app ()->user->login ( $identity, $duration );
				return $user;
				break;
			case GUserIdentity::ERROR_EMAIL_INVALID :
				$this->loginForm->addError ( "password", G::t ( 'Username or Password is incorrect' ) );
				break;
			case GUserIdentity::ERROR_STATUS_INACTIVE :
				$this->loginForm->addError ( "status", G::t ( 'This account is not activated.' ) );
				break;
			case GUserIdentity::ERROR_STATUS_BANNED :
				$this->loginForm->addError ( "status", G::t ( 'This account is blocked.' ) );
				break;
			case GUserIdentity::ERROR_STATUS_REMOVED :
				$this->loginForm->addError ( 'status', G::t ( 'Your account has been deleted.' ) );
				break;
			case GUserIdentity::ERROR_PASSWORD_INVALID :
				G::log ( sprintf ( 'Password invalid for user {username} (Ip-Address: {ip})', array (
						'{ip}' => Yii::app ()->request->getUserHostAddress (),
						'{username}' => $this->loginForm->username 
				) ), 'error' );
				
				if (! $this->loginForm->hasErrors ())
					$this->loginForm->addError ( "password", G::t ( 'Username or Password is incorrect' ) );
				break;
				return false;
		}
	}
	public function actionLogout() {
		// let's delete the login_type cookie
		$cookie = Yii::app ()->request->cookies ['login_type'];
		if ($cookie) {
			$cookie->expire = time () - (3600 * 72);
			Yii::app ()->request->cookies ['login_type'] = $cookie;
		}
		$user = GUser::model ()->findByPk ( Yii::app ()->user->id );
		if ($user) {
			$username = $user->username;
			$user->logout ();
			G::log ( G::t ( 'User {username} logged off', array (
					'{username}' => $username 
			) ) );
			Yii::app ()->user->logout ();
		}
		$session = Yii::app ()->session;
		$session->open ();
		$session ['refresh'] = true;
		$this->redirect ( '/gong/user/auth/login' );
	}
	public function loginByEmail() {
		$profile = GProfile::model ()->find ( 'email = :email', array (
				':email' => $this->loginForm->username 
		) );
		if ($profile && $profile->user)
			return $this->authenticate ( $profile->user );
	}
	public function actionLogin() {
		// If the user is already logged in send them to the return Url
		if (! Yii::app ()->user->isGuest)
			$this->redirect ( Yii::app ()->user->returnUrl );
		
		$this->loginForm = new GUserLogin ( 'login' );
		
		/**
		 * Login process starts here.
		 * We will eventually get a bug here. If a user has already logged in
		 * both FB a Twitter and both login systems are activated, if he decides
		 * to use his Twitter account instead of his FB one the system will use
		 * the FB account info for login. Not critical. I still can sleep after
		 * knowing about this.
		 */
		$success = false;
		$login_type = null;
		if (isset ( $_POST ['GUserLogin'] )) {
			$this->loginForm->attributes = $_POST ['GUserLogin'];
			$t = G::module ()->loginType;
			
			// validate user input for the rest of login methods
			if ($this->loginForm->validate ()) {
				if ($t & GongModule::LOGIN_BY_USERNAME) {
					$success = $this->loginByUsername ();
					if ($success)
						$login_type = 'username';
				}
				/*
				 * if ($t & GongModule::LOGIN_BY_EMAIL && !$success) {
				 * $success = $this->loginByEmail();
				 * if ($success)
				 * $login_type = 'email';
				 * }
				 */
			}
			if ($success instanceof GUser) {
				// cookie with login type for later flow control in app
				if ($login_type) {
					$cookie = new CHttpCookie ( 'login_type', serialize ( $login_type ) );
					$cookie->expire = time () + (3600 * 24 * 30);
					Yii::app ()->request->cookies ['login_type'] = $cookie;
				}
				G::log ( G::t ( 'User {username} successfully logged in (Ip: {ip})', array (
						'{ip}' => Yii::app ()->request->getUserHostAddress (),
						'{username}' => $success->username 
				) ) );
				if (G::module ()->afterLogin !== false)
					call_user_func ( G::module ()->afterLogin );
				
				$this->redirectUser ( $success );
			} else
				$this->loginForm->addError ( 'username', G::t ( 'Login is not possible with the given credentials' ) );
		}
		
		$this->render ( 'login', array (
				'model' => $this->loginForm 
		) );
	}
}

?>
