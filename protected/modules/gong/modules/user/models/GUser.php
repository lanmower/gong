<?php
Yii::import ( "gong.modules.user.models.GRole" );
Yii::import ( "gong.modules.user.models.GMembership" );
Yii::import ( "gong.modules.user.models.GMessage" );
Yii::import ( "gong.modules.user.models.GPermission" );
Yii::import ( "gong.modules.user.models.GAction" );
Yii::import ( "gong.modules.user.models.GProfile" );
Yii::import ( "gong.modules.user.models.GProfileField" );
Yii::import ( "gong.modules.user.models.GFriendship" );
Yii::import ( "gong.modules.user.models.GAccount" );
Yii::import ( "gong.models.G" );
Yii::import ( "gong.models.Gong" );
class GUser extends GActiveRecord {
	const STATUS_INACTIVE = 0;
	const STATUS_ACTIVE = 1;
	const STATUS_BANNED = - 1;
	const STATUS_REMOVED = - 2;
	public $username;
	public $password;
	public $salt;
	public $activationKey;
	public $password_changed = false;
	private $_permissions;
	private $_memberships;
	private $_roles;
	private $_relations;
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function getApprovedHtml() {
		$disapprove = Yii::app ()->getController ()->createUrl ( '/gong/user/user/fieldUpdate/id/' . $this->hash . '/attribute/approved/value/0', GUserController::getSearchFlags () );
		$approve = Yii::app ()->getController ()->createUrl ( '/gong/user/user/fieldUpdate/id/' . $this->hash . '/attribute/approved/value/1', GUserController::getSearchFlags () );
		return ($this->approved ? "<a href='$disapprove'><i class='glyphicon glyphicon-check'></i></a>" : "<a href='$approve'><i class='glyphicon glyphicon-unchecked'></i></a>");
	}
	public function getVar($key) {
		return CHtml::value ( $this, $key );
	}
	public function getStatusHtml() {
		$unsubscribe = Yii::app ()->getController ()->createUrl ( '/gong/user/user/fieldUpdate/id/' . $this->hash . '/attribute/status/value/-2', GUserController::getSearchFlags () );
		$resubscribe = Yii::app ()->getController ()->createUrl ( '/gong/user/user/fieldUpdate/id/' . $this->hash . '/attribute/status/value/1', GUserController::getSearchFlags () );
		return ($this->status == 1) ? "<a href='$unsubscribe'><i class='glyphicon glyphicon-check'></i></a>" : "<a href='$resubscribe'><i class='glyphicon glyphicon-unchecked'></i></a>";
	}
	/**
	 * This function is used for password encryption.
	 * 
	 * @return hash string.
	 */
	public static function encrypt($string = "") {
		$salt = G::module ()->salt;
		$hashFunc = G::module ()->hashFunc;
		$string = sprintf ( "%s%s%s", $salt, $string, $salt );
		
		if (! function_exists ( $hashFunc ))
			throw new CException ( 'Function `' . $hashFunc . '` is not a valid callback for hashing algorithm.' );
		
		return $hashFunc ( $string );
	}
	public function getActiveRoles() {
		if (isset ( $this->_roles ))
			return $this->_roles;
		$roles = $this->roles;
		$roles = array_merge ( $roles, $this->getActiveMemberships () );
		return $this->_roles = $roles;
	}
	public function getPermissions() {
		if ($this->_permissions == null)
			return $this->_permissions = $this->makePermissions ();
		else
			return $this->_permissions;
	}
	private function makePermissions() {
		$roles = $this->getActiveRoles ();
		
		$permissions = array ();
		foreach ( $roles as $role ) {
			$permissionTable = GPermission::model ()->tableName ();
			$actionTable = GAction::model ()->tableName ();
			$sql = "select action.id, action.title from $permissionTable as permission left join $actionTable as action on action.id = permission.actionId where roleId = {$role->id}";
			foreach ( Yii::app ()->db->cache ( 500 )->createCommand ( $sql )->query ()->readAll () as $permission )
				$permissions [$permission ['id']] = $permission ['title'];
		}
		
		return $permissions;
	}
	public function addToAccount($amount) {
		$account = GAccount::model ()->find ( 'userId = :uid', array (
				':uid' => $this->id 
		) );
		if (! isset ( $account )) {
			$account = new GAccount ();
			$account->userId = $this->id;
		}
		$account->size += $amount;
		$account->save ();
	}
	public function delete() {
		if (G::module ()->trulyDelete)
			return parent::delete ();
		else {
			$this->status = self::STATUS_REMOVED;
			return $this->save ( false, array (
					'status' 
			) );
		}
	}
	public function afterDelete() {
		if ($this->profile !== null)
			$this->profile->delete ();
		
		G::log ( G::t ( 'User {username} (id: {id}) has been deleted', array (
				'{username}' => $this->username,
				'{id}' => $this->id 
		) ) );
		return parent::afterDelete ();
	}
	public function isOnline() {
		return $this->lastaction > time () - G::module ()->offlineIndicationTime;
	}
	
	// If Online status is enabled, we need to set the timestamp of the
	// last action when a user does something
	public function setLastAction() {
		if (! Yii::app ()->user->isGuest && ! $this->isNewRecord) {
			$this->lastaction = time ();
			return $this->save ( false, array (
					'lastaction' 
			) );
		}
	}
	public function getLogins() {
		$sql = "select count(*) from activities where userId = {$this->id} and action = 'login'";
		$result = Yii::app ()->db->createCommand ( $sql )->queryAll ();
		return $result [0] ['count(*)'];
	}
	public function logout() {
		if (G::module ()->enableOnlineStatus && ! Yii::app ()->user->isGuest) {
			$this->lastaction = 0;
			$this->save ( 'lastaction' );
		}
	}
	public function isActive() {
		return $this->status == GUser::STATUS_ACTIVE;
	}
	
	// This function tries to generate a as human-readable password as possible
	public static function generatePassword() {
		$consonants = array (
				"b",
				"c",
				"d",
				"f",
				"g",
				"h",
				"j",
				"k",
				"l",
				"m",
				"n",
				"p",
				"r",
				"s",
				"t",
				"v",
				"w",
				"x",
				"y",
				"z" 
		);
		$vocals = array (
				"a",
				"e",
				"i",
				"o",
				"u" 
		);
		
		$password = '';
		
		srand ( ( double ) microtime () * 1000000 );
		for($i = 1; $i <= 4; $i ++) {
			$password .= $consonants [rand ( 0, 19 )];
			$password .= $vocals [rand ( 0, 4 )];
		}
		$password .= rand ( 0, 9 );
		
		return $password;
	}
	public function getActiveMemberships() {
		if ($this->_memberships == null)
			return $this->_memberships = $this->makeActiveMemeberships ();
		else
			return $this->_memberships;
	}
	// Which memberships are bought by the user
	private function makeActiveMemeberships() {
		$roles = array ();
		
		if ($this->memberships)
			foreach ( $this->memberships as $membership ) {
				if ($membership->end_date > time ())
					$roles [] = $membership->role;
			}
		
		return $roles;
	}
	public function search() {
		$criteria = new CDbCriteria ();
		
		if ($this->profile) {
			$criteria->with = array (
					'profile' 
			);
			if ($this->profile)
				$criteria->compare ( 'profile.email', $this->profile->email, true );
			
			if (isset ( $this->email ))
				$criteria->addSearchCondition ( 'profile.email', $this->email, true );
		}
		
		// Show newest users first by default
		if (! isset ( $_GET ['GUser_sort'] ))
			$criteria->order = 't.createtime DESC';
		
		$criteria->together = false;
		$criteria->compare ( 't.id', $this->id, true );
		$criteria->compare ( 't.username', $this->username, true );
		$criteria->compare ( 't.status', $this->status );
		$criteria->compare ( 't.superuser', $this->superuser );
		$criteria->compare ( 't.createtime', $this->createtime, true );
		$criteria->compare ( 't.lastvisit', $this->lastvisit, true );
		
		return new CActiveDataProvider ( get_class ( $this ), array (
				'criteria' => $criteria,
				'pagination' => array (
						'pageSize' => 10 
				) 
		) );
	}
	public function beforeValidate() {
		if ($this->isNewRecord) {
			if (! $this->salt)
				$this->salt = GEncrypt::generateSalt ();
			$this->createtime = time ();
		}
		
		return true;
	}
	public function setPassword($password, $salt = null) {
		if ($password != '') {
			$this->password = GEncrypt::encrypt ( $password, $salt );
			$this->lastpasswordchange = time ();
			$this->password_changed = true;
			$this->salt = $salt;
			if (! $this->isNewRecord)
				return $this->save ();
			else
				return $this;
		}
	}
	public function afterSave() {
		// create a new privacy setting, if not already available
		$setting = GPrivacySetting::model ()->cache ( 500 )->findByPk ( $this->id );
		if (! $setting) {
			$setting = new GPrivacySetting ();
			$setting->userId = $this->id;
			$setting->save ();
		}
		
		if ($this->isNewRecord) {
			G::log ( G::t ( 'A user has been created: user: {user}', array (
					'{user}' => CJavaScript::jsonEncode ( $this->attributes ) 
			) ) );
		}
		return parent::afterSave ();
	}
	public function tableName() {
		return "{{user}}";
	}
	public function rules() {
		$passwordRequirements = G::module ()->passwordRequirements;
		$usernameRequirements = G::module ()->usernameRequirements;
		
		$passwordrule = array_merge ( array (
				'password',
				'GPasswordValidator' 
		), $passwordRequirements );
		
		$rules [] = $passwordrule;
		
		$rules [] = array (
				'username',
				'length',
				'max' => $usernameRequirements ['maxLen'],
				'min' => $usernameRequirements ['minLen'],
				'message' => G::t ( 'Username length needs to be between {minLen} and {maxlen} characters', array (
						'{minLen}' => $usernameRequirements ['minLen'],
						'{maxLen}' => $usernameRequirements ['maxLen'] 
				) ) 
		);
		
		$rules [] = array (
				'username',
				'unique',
				'message' => G::t ( "This user's name already exists." ) 
		);
		$rules [] = array (
				'username',
				'match',
				'pattern' => $usernameRequirements ['match'],
				'message' => G::t ( $usernameRequirements ['dontMatchMessage'] ) 
		);
		$rules [] = array (
				'status',
				'in',
				'range' => array (
						0,
						1,
						2,
						3,
						- 1,
						- 2 
				) 
		);
		$rules [] = array (
				'superuser',
				'in',
				'range' => array (
						0,
						1 
				) 
		);
		$rules [] = array (
				'username, createtime, lastvisit, lastpasswordchange, superuser, status',
				'required' 
		);
		$rules [] = array (
				'notifyType',
				'safe' 
		);
		$rules [] = array (
				'password',
				'required',
				'on' => array (
						'insert',
						'registration' 
				) 
		);
		$rules [] = array (
				'salt',
				'required',
				'on' => array (
						'insert',
						'registration' 
				) 
		);
		$rules [] = array (
				'createtime, lastvisit, lastaction, superuser, status',
				'numerical',
				'integerOnly' => true 
		);
		
		return $rules;
	}
	public function relations() {
		if ($this->_relations == null) {
			$relations = array ();
			
			$relations ['roles'] = array (
					self::MANY_MANY,
					'GRole',
					"{{user_role}}" . '(userId, roleId)' 
			);
			
			$relations ['messages'] = array (
					self::HAS_MANY,
					'GMessage',
					'toUserId',
					'order' => 'timestamp DESC' 
			);
			
			$relations ['unread_messages'] = array (
					self::HAS_MANY,
					'GMessage',
					'toUserId',
					'condition' => 'read = 0',
					'order' => 'timestamp DESC' 
			);
			
			$relations ['sent_messages'] = array (
					self::HAS_MANY,
					'GMessage',
					'fromUserId' 
			);
			
			$relations ['visits'] = array (
					self::HAS_MANY,
					'GProfileVisit',
					'visited_id' 
			);
			$relations ['visited'] = array (
					self::HAS_MANY,
					'GProfileVisit',
					'visitor_id' 
			);
			$relations ['profile'] = array (
					self::HAS_ONE,
					'GProfile',
					'userId' 
			);
			$relations ['privacy'] = array (
					self::HAS_ONE,
					'GPrivacySetting',
					'userId' 
			);
			
			$relations ['friendshipsRequested'] = array (
					self::HAS_MANY,
					'GFriendship',
					'inviterId',
					'on' => 'friendshipsRequested.status = 1',
					'together' => true 
			);
			$relations ['friendshipsAccepted'] = array (
					self::HAS_MANY,
					'GFriendship',
					'friendId',
					'on' => 'friendshipsAccepted.status = 2',
					'together' => true 
			);
			
			$relations ['friendsRequested'] = array (
					self::HAS_MANY,
					'GUser',
					array (
							'inviterId' => 'id' 
					),
					'through' => 'friendships',
					'condition' => 'friendsRequested.status = 2' 
			);
			$relations ['friendsAccepted'] = array (
					self::HAS_MANY,
					'GUser',
					array (
							'friendId' => 'id' 
					),
					'through' => 'friendships',
					'condition' => 'friendsAccepted.status = 2' 
			);
			
			$relations ['pendingFriendshipRequests'] = array (
					self::HAS_MANY,
					'GFriendship',
					'friendId',
					'condition' => 'pendingFriendshipRequests.status = 1' 
			);
			
			$relations ['memberships'] = array (
					self::HAS_MANY,
					'GMembership',
					'userId' 
			);
			
			$this->_relations = $relations;
		}
		return $this->_relations;
	}
	public function hasMembership($roleName) {
		$role = GRole::model ()->find ( 'title = :role', array (
				':role' => $roleName 
		) );
		$this->getDbCriteria ()->mergeWith ( array (
				'condition' => 'memberships.roleId = :roleId',
				'with' => array (
						'memberships' 
				),
				'params' => array (
						':roleId' => $role->id 
				) 
		) );
		return $this;
	}
	public function getMessageLink() {
		return CHtml::link ( CHtml::tag ( 'i', array (
				'class' => 'glyphicon glyphicon-envelope' 
		) ), '/gong/user/message/send/id/' . $this->hash );
	}
	public function getInviteLink() {
		return CHtml::link ( CHtml::tag ( 'i', array (
				'class' => 'glyphicon glyphicon-link' 
		) ), '/gong/user/friendship/invite/friendId/' . $this->hash );
	}
	public function isFriendOf($userId) {
		foreach ( $this->getFriendships () as $friendship ) {
			if ($friendship->inviterId == $this->id && $friendship->friendId == $userId || $friendship->friendId == $this->id && $friendship->inviterId == $userId)
				return true;
		}
		
		return false;
	}
	public function getFriendships() {
		return GFriendship::model ()->findAll ( 'inviterId = :uid or friendId = :uid', array (
				':uid' => $this->id 
		) );
	}
	public function getPendingInvitations() {
		return GFriendship::model ()->findAll ( 'friendId = :uid AND status = :status', array (
				':uid' => $this->id,
				':status' => GFriendship::STATUS_PENDING 
		) );
	}
	public function getPendingFriendships() {
		return GFriendship::model ()->findAll ( '(inviterId = :uid or friendId = :uid) AND status = :status', array (
				':uid' => $this->id,
				':status' => GFriendship::STATUS_PENDING 
		) );
	}
	public function getApprovedFriendships() {
		return GFriendship::model ()->findAll ( '(inviterId = :uid or friendId = :uid) AND status = :status', array (
				':uid' => $this->id,
				':status' => GFriendship::STATUS_APPROVED 
		) );
	}
	
	// Registers a user
	public function register($username = null, $password = null, $profile = null, $salt = null) {
		if (! ($profile instanceof GProfile))
			return false;
		
		if ($username !== null && $password !== null) {
			// Password equality is checked in Registration Form
			$this->username = $username;
			if (! $salt)
				$salt = GEncrypt::generateSalt ();
			
			$this->setPassword ( $password, $salt );
		}
		$this->activationKey = $this->generateActivationKey ( false/* , $password */);
		$this->createtime = time ();
		$this->superuser = 0;
		
		// Users stay banned until they confirm their email address.
		$this->status = GUser::STATUS_INACTIVE;
		
		if ($this->validate () && $profile->validate ()) {
			$this->save ();
			$profile->userId = $this->id;
			$profile->save ();
			$this->profile = $profile;
			
			G::log ( G::t ( 'User {username} registered. Generated activation Url is {activation_url} and has been sent to {email}', array (
					'{username}' => $this->username,
					'{email}' => $profile->email,
					'{activation_url}' => $this->getActivationUrl () 
			) ) );
			return $this;
		}
		
		return false;
	}
	public function getActivationUrl() {
		/**
		 * Quick check for a enabled Registration Module
		 */
		$activationUrl = '/registration/activation';
		if (isset ( $this->profile )) {
			$params ['key'] = $this->activationKey;
			$params ['email'] = $this->profile->email;
			
			return Yii::app ()->controller->createAbsoluteUrl ( $activationUrl, $params );
		}
	}
	public function isPasswordExpired() {
		$distance = G::module ( 'user' )->password_expiration_time * 60 * 60;
		return $this->lastpasswordchange - $distance > time ();
	}
	
	/**
	 * Activation of an user account.
	 * If everything is set properly, and the emails exists in the database,
	 * and is associated with a correct user, and this user has the status
	 * NOTACTIVE and the given activationKey is identical to the one in the
	 * database then generate a new Activation key to avoid double activation,
	 * set the status to ACTIVATED and save the data
	 * Error Codes:
	 * -1 : User is not inactive, it can not be activated
	 * -2 : Wrong activation key
	 * -3 : Profile found, but no user - database inconsistency?
	 */
	public static function activate($email, $key) {
		if ($profile = GProfile::model ()->find ( "email = :email", array (
				':email' => $email 
		) )) {
			if ($user = $profile->user) {
				// if ($user->status != self::STATUS_INACTIVE)
				// return -1;
				if ($user->activationKey == $key) {
					$user->activationKey = $user->generateActivationKey ( true );
					$user->status = self::STATUS_ACTIVE;
					if ($user->save ( false, array (
							'activationKey',
							'status' 
					) )) {
						G::log ( G::t ( 'User {username} has been activated', array (
								'{username}' => $user->username 
						) ) );
						GMessage::write ( $user, 1, G::t ( 'Your activation succeeded' ), strtr ( 'The activation of the account {username} succeeded. Please navigate to the login page to start using the site', array (
								'{username}' => $user->username,
								'{link_login}' => Yii::app ()->controller->createUrl ( '//user/user/login' ) 
						) ) );
						
						return $user;
					}
				} else
					return - 2;
			} else
				return - 3;
		}
		return false;
	}
	
	/**
	 *
	 * @param
	 *        	s boolean $activate Whether to generate activation key when user is
	 *        	registering first time (false)
	 *        	or when it is activating (true)
	 * @param
	 *        	s string $password password entered by user
	 * @param array $params,
	 *        	optional, to allow passing values outside class in inherited classes
	 *        	By default it uses password and microtime combination to generated activation key
	 *        	When user is activating, activation key becomes micortime()
	 * @return string
	 */
	public function generateActivationKey($activate = false) {
		if ($activate) {
			$this->activationKey = $activate;
			$this->save ( false, array (
					'activationKey' 
			) );
		} else
			$this->activationKey = GEncrypt::encrypt ( microtime () . $this->password, $this->salt );
		
		if (! $this->isNewRecord)
			$this->save ( false, array (
					'activationKey' 
			) );
		
		return $this->activationKey;
	}
	public function attributeLabels() {
		return array (
				'id' => G::t ( '#' ),
				'username' => G::t ( "Username" ),
				'password' => G::t ( "Password" ),
				'verifyPassword' => G::t ( "Retype password" ),
				'verifyCode' => G::t ( "Verification code" ),
				'activationKey' => G::t ( "Activation key" ),
				'createtime' => G::t ( "Registration date" ),
				'lastvisit' => G::t ( "Last visit" ),
				'lastaction' => G::t ( "Online status" ),
				'superuser' => G::t ( "Superuser" ),
				'status' => G::t ( "Status" ) 
		);
	}
	public function scopes() {
		return array (
				'active' => array (
						'condition' => 'status=' . self::STATUS_ACTIVE 
				),
				'inactive' => array (
						'condition' => 'status=' . self::STATUS_INACTIVE 
				),
				'banned' => array (
						'condition' => 'status=' . self::STATUS_BANNED 
				),
				'superuser' => array (
						'condition' => 'superuser = 1' 
				),
				'public' => array (
						'join' => 'LEFT JOIN privacysetting on t.id = privacysetting.userId',
						'condition' => 'appear_in_search = 1' 
				) 
		);
	}
	public function withRole($role) {
		$this->getDbCriteria ()->mergeWith ( array (
				'condition' => 'role.title = :role OR roles.title = :role',
				'with' => array (
						'memberships' => array (
								'with' => 'role' 
						),
						'roles' 
				),
				'params' => array (
						':role' => $role 
				) 
		) );
		return $this;
	}
	public function withoutFriends($id) {
		$this->getDbCriteria ()->mergeWith ( array (
				'condition' => 'friendship.id is NULL AND t.id != :uid',
				'join' => 'LEFT JOIN {{friendship}} friendship ON ((friendship.friendId = t.id AND friendship.inviterId = :uid) OR (friendship.friendId = :uid AND friendship.inviterId = t.id))',
				'params' => array (
						':uid' => $id 
				) 
		) );
		return $this;
	}
	public static function itemAlias($type, $code = NULL) {
		$_items = array (
				'UserStatus' => array (
						'0' => G::t ( 'Not active' ),
						'1' => G::t ( 'Active' ),
						'-1' => G::t ( 'Banned' ),
						'-2' => G::t ( 'Deleted' ) 
				),
				'AdminStatus' => array (
						'0' => G::t ( 'No' ),
						'1' => G::t ( 'Yes' ) 
				) 
		);
		if (isset ( $code ))
			return isset ( $_items [$type] [$code] ) ? $_items [$type] [$code] : false;
		else
			return isset ( $_items [$type] ) ? $_items [$type] : false;
	}
}

?>
