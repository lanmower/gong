<?php
class GPrivacysettingController extends GController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'update' 
						),
						'users' => array (
								'@' 
						) 
				),
				array (
						'deny',
						'users' => array (
								'*' 
						) 
				) 
		);
	}
	public function actionUpdate() {
		$model = GPrivacySetting::model ()->findByPk ( Yii::app ()->user->id );
		
		if (isset ( $_POST ['GPrivacysetting'] )) {
			$model->attributes = $_POST ['GPrivacysetting'];
			
			$profile_privacy = 0;
			foreach ( $_POST as $key => $value ) {
				if ($value == 1 && substr ( $key, 0, 18 ) == 'privacy_for_field_') {
					$data = explode ( '_', $key );
					$data = ( int ) $data [3];
					$profile_privacy += $data;
				}
			}
			
			$model->public_profile_fields = $profile_privacy;
			$model->validate ();
			
			if (isset ( $_POST ['GProfile'] )) {
				$profile = $model->user->profile;
				$profile->attributes = $_POST ['GProfile'];
				$profile->validate ();
			}
			
			if (! $model->hasErrors ()) {
				$profile->save ();
				$model->save ();
				G::setFlash ( 'alert-info', 'Your privacy settings have been saved' );
				$this->redirect ( array (
						'//profile/profile/view',
						'id' => $model->userId 
				) );
			}
		}
		
		// If the user does not have a privacy setting entry yet, create an
		// empty one
		if (! $model) {
			$model = new GPrivacySetting ();
			$model->userId = Yii::app ()->user->id;
			$model->save ();
			$this->refresh ();
		}
		
		$this->render ( '/privacy/update', array (
				'model' => $model,
				'profile' => isset ( $model->user ) && isset ( $model->user->profile ) ? $model->user->profile : null 
		) );
	}
}
