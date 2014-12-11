<?php
Yii::import ( 'gong.modules.form.models.GForm' );
Yii::import ( 'gong.modules.form.models.GFormPage' );
Yii::import ( 'gong.modules.form.models.GFormField' );
Yii::import ( 'gong.modules.form.widgets.*' );
class GUserController extends GModelController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'index',
								'view' 
						),
						'users' => array (
								'*' 
						) 
				),
				array (
						'allow',
						'actions' => array (
								'profile',
								'logout',
								'changepassword',
								'passwordexpired',
								'delete',
								'browse',
								'publish' 
						),
						'users' => array (
								'@' 
						) 
				),
				array (
						'allow',
						'actions' => array (
								'list',
								'fieldUpdate' 
						),
						'expression' => array (
								'GUserController',
								'canUpdate' 
						) 
				),
				array (
						'deny', // deny all other users
						'users' => array (
								'*' 
						) 
				) 
		);
	}
	public function actionCreateTable() {
		$connection = Yii::app ()->db;
		$model = GForm::model ()->find ( '`name` = "registration"' );
		$tableName = $model->dataTable;
		$sql = "CREATE TABLE `$tableName` (";
		$sql .= "`id` int(11) NOT NULL AUTO_INCREMENT";
		$sql .= ", `created` date NOT NULL";
		$sql .= ", `modified` date NOT NULL";
		$sql .= $model->sql;
		$sql .= ', PRIMARY KEY (`id`));';
		try {
			$command = $connection->createCommand ( "DROP TABLE `$tableName`;" );
			$command->execute ();
			$command = $connection->createCommand ( $sql );
			$command->execute ();
		} catch ( CException $e ) {
			$model->addError ( 'id', $e->getMessage () );
		}
		$this->render ( "createTable", array (
				'model' => $model 
		) );
	}
	public function actionFieldUpdate($attribute, $value, $id = null) {
		if ($id == null)
			$id = Yii::app ()->user->hash;
		$model = new GUser ();
		$model = $this->loadModel ( $id );
		$model->setAttribute ( $attribute, $value );
		$model->saveAttributes ( array (
				$attribute 
		) );
		$this->render ( 'fieldUpdateDone', array (
				'model' => $model 
		) );
	}
	public static function getSearchFlags() {
		$vars = array ();
		if (isset ( $_GET ['approved'] ))
			$vars ['approved'] = $_GET ['approved'];
		if (isset ( $_GET ['status'] ))
			$vars ['status'] = $_GET ['status'];
		return $vars;
	}
	public function actionGenerateData() {
		if (isset ( $_POST ['user_amount'] )) {
			for($i = 0; $i < $_POST ['user_amount']; $i ++) {
				$user = new GUser ();
				$user->username = sprintf ( 'Demo_%d_%d', rand ( 1, 50000 ), $i );
				$user->roles = array (
						$_POST ['role'] 
				);
				$user->salt = GEncrypt::generateSalt ();
				$user->password = GEncrypt::encrypt ( $_POST ['password'], $user->salt );
				$user->createtime = time ();
				$user->status = $_POST ['status'];
				
				if ($user->save ()) {
					$profile = new GProfile ();
					$profile->userId = $user->id;
					$profile->timestamp = time ();
					$profile->firstname = $user->username;
					$profile->lastname = $user->username;
					$profile->privacy = 'protected';
					$profile->email = 'e@mail.de';
					$profile->save ();
				}
			}
		}
		$this->render ( 'generate_data' );
	}
	public function actionPasswordExpired() {
		$this->actionChangePassword ( $expired = true );
	}
	public function beforeAction($event) {
		if (! Yii::app ()->user instanceof GWebUser)
			throw new CException ( G::t ( 'Please make sure that Yii uses the GWebUser component instead of CWebUser in your config/main.php components section. Please see the installation instructions.' ) );
		return parent::beforeAction ( $event );
	}
	
	/**
	 * Change password
	 */
	public function actionChangePassword($expired = false) {
		$uid = Yii::app ()->user->id;
		if (isset ( $_GET ['id'] ))
			$uid = $_GET ['id'];
		
		$form = new GUserChangePassword ();
		$form->scenario = 'user_request';
		
		if (isset ( $_POST ['GUserChangePassword'] )) {
			$form->attributes = $_POST ['GUserChangePassword'];
			
			$form->validate ();
			
			if (! GEncrypt::validate_password ( $form->currentPassword, GUser::model ()->findByPk ( $uid )->password, GUser::model ()->findByPk ( $uid )->salt ))
				$form->addError ( 'currentPassword', G::t ( 'Your current password is not correct' ) );
			
			if (! $form->hasErrors ()) {
				if (GUser::model ()->findByPk ( $uid )->setPassword ( $form->password, GUser::model ()->findByPk ( $uid )->salt )) {
					G::setFlash ( 'alert-info', 'The new password has been saved' );
					G::log ( G::t ( 'User {username} has changed his password', array (
							'{username}' => Yii::app ()->user->name 
					) ) );
				} else {
					G::setFlash ( 'alert-info', 'There was an error saving the password' );
					G::log ( G::t ( 'User {username} tried to change his password, but an error occured', array (
							'{username}' => Yii::app ()->user->name 
					) ), 'error' );
				}
				
				$this->redirect ( G::module ()->returnUrl );
			}
		}
		
		if (Yii::app ()->request->isAjaxRequest)
			$this->renderPartial ( 'gong.modules.user.views.registration.changepassword', array (
					'form' => $form,
					'expired' => $expired 
			) );
		else
			$this->render ( 'gong.modules.user.views.registration.changepassword', array (
					'form' => $form,
					'expired' => $expired 
			) );
	}
	
	// Redirects the user to the specified profile
	// if no profile is specified, redirect to the own profile
	public function actionProfile($id = null) {
		$this->redirect ( array (
				'//profile/profile/view',
				'id' => $id ? $id : Yii::app ()->user->id 
		) );
	}
	public function actionUpdate($id) {
		$model = $this->loadModel ( $id );
		$passwordform = new GUserChangePassword ();
		
		if (isset ( $_POST ['GUser'] )) {
			if (! isset ( $model->salt ) || empty ( $model->salt ))
				$model->salt = GEncrypt::generateSalt ();
			
			$model->attributes = $_POST ['GUser'];
			// Assign the roles and belonging Users to the model
			$model->roles = Relation::retrieveValues ( $_POST );
			
			$profile = $model->profile;
			
			if (isset ( $_POST ['GProfile'] ))
				$profile->attributes = $_POST ['GProfile'];
				
				// Password change is requested ?
			if (isset ( $_POST ['GUserChangePassword'] ) && $_POST ['GUserChangePassword'] ['password'] != '') {
				$passwordform->attributes = $_POST ['GUserChangePassword'];
				if ($passwordform->validate ())
					$model->setPassword ( $_POST ['GUserChangePassword'] ['password'], $model->salt );
			}
			
			if (! $passwordform->hasErrors () && $model->save ()) {
				if (isset ( $profile ))
					$profile->save ();
				
				$this->redirect ( array (
						'//user/user/view',
						'id' => $model->id 
				) );
			}
		}
		
		$this->render ( 'update', array (
				'model' => $model,
				'passwordform' => $passwordform,
				'profile' => isset ( $profile ) ? $profile : false 
		) );
	}
	public function actionList($name = null, $id = null) {
		$criteria = new CDbCriteria ();
		$criteria->addCondition ( 't.`username` != "admin"' );
		if (isset ( $_GET ['status'] )) {
			$criteria->addCondition ( "t.`status` = " . $_GET ['status'] );
		}
		if (isset ( $_GET ['approved'] )) {
			$criteria->addCondition ( "t.`approved` = " . $_GET ['approved'] );
		}
		$dataProvider = new CActiveDataProvider ( 'GUser', array (
				'criteria' => $criteria,
				'sort' => array (
						'defaultOrder' => 'username ASC' 
				) 
		) );
		$this->render ( 'list', array (
				'dataProvider' => $dataProvider 
		) );
	}
	
	/**
	 * Deletes a user by setting the status to 'deleted'
	 */
	public function actionDelete($id = null) {
		if (! $id)
			$id = Yii::app ()->user->id;
		
		$user = $this->loadModel ( $id );
		
		if (Yii::app ()->user->isAdmin ()) {
			// This is necesary for handling human stupidity.
			if ($user && ($user->id == Yii::app ()->user->id)) {
				G::setFlash ( 'alert-info', 'You can not delete your own admin account' );
				$this->redirect ( array (
						'//gong/user/user/list' 
				) );
			}
			
			if ($user->delete ()) {
				G::setFlash ( 'alert-info', 'The User has been deleted' );
				$this->redirect ( '//gong/user/user/list' );
			}
		} else if (isset ( $_POST ['confirmPassword'] )) {
			if (GEncrypt::validate_password ( $_POST ['confirmPassword'], $user->password, $user->salt )) {
				if ($user->delete () && ($id == Yii::app ()->user->id))
					$this->redirect ( "/gong/user/auth/logout" );
				else
					G::setFlash ( 'alert-info', 'Error while deleting Account. Account was not deleted' );
			} else {
				G::setFlash ( 'alert-info', 'Wrong password confirmation! Account was not deleted' );
			}
			$this->redirect ( G::module ()->deleteUrl );
		}
		
		$this->render ( 'confirmDeletion', array (
				'model' => $user 
		) );
	}
}

?>
