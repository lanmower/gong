<?php
class GMembershipController extends GModelController {
	public function actionOrder() {
		$model = new GMembership ();
		if (isset ( $_POST ['GMembership'] )) {
			$model->attributes = $_POST ['GMembership'];
			if (! GMembership::model ()->find ( 'userId = ' . Yii::app ()->user->id . ' AND roleId = ' . $model->roleId )) {
				if ($model->save ()) {
					$this->redirect ( array (
							'index' 
					) );
				}
			} else {
				$this->redirect ( array (
						'index' 
				) );
			}
		}
		
		$this->render ( 'order', array (
				'model' => $model 
		) );
	}
	public function actionExtend() {
		$membership = GMembership::model ()->findByPk ( $_POST ['roleId'] );
		if (! $membership)
			throw new CHttpException ( 404 );
		
		if ($membership->userId != Yii::app ()->user->id)
			throw new CHttpException ( 403 );
		
		$subscription = $_POST ['subscription'];
		$membership->subscribed = $subscription == 'cancel' ? - 1 : $subscription;
		$membership->save ( false, array (
				'subscribed' 
		) );
		G::setFlash ( 'alert-info', 'Your subscription setting has been saved' );
		$this->redirect ( G::module ()->membershipIndexRoute );
	}
}

?>
