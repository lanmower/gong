<?php
class GFriendshipController extends GModelController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'create',
								'list',
								'listAll',
								'update',
								'inlineUpdate',  /* 'dataUpdate', */ 'view' 
						),
						'expression' => array (
								'GFriendshipController',
								'canUpdate' 
						) 
				),
				array (
						'allow',
						'actions' => array (
								'delete',
								'invite',
								'approve',
								'listPending',
								'listApproved' 
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
	public function loadModel($id) {
		$className = $this->modelClassname;
		$model = $className::model ()->findByPk ( PseudoCrypt::unhash ( $id ), 'inviterId = :uid or friendId = :uid', array (
				':uid' => Yii::app ()->user->id 
		) );
		if ($model == null)
			throw new CHttpException ( 404, 'The requested item was not found.' );
		return $model;
	}
	public function actionApprove($id = null) {
		if (isset ( $id )) {
			$friendship = $this->loadModel ( $id );
			if (isset ( $friendship )) {
				$friendship->status = 2;
				if ($friendship->save ( true, array (
						'status' 
				) )) {
					G::setFlash ( 'alert-info', 'Friendship Approved' );
				} else {
					G::setFlash ( 'alert-danger', CHtml::errorSummary ( $friendship ) );
				}
				$this->redirect ( '/index.php' );
			}
		}
		$model = Yii::app ()->user->data->getPendingInvitations ();
		$this->render ( 'listPending', array (
				'friendships' => $model 
		) );
	}
	public function actionListApproved($id = null) {
		$model = Yii::app ()->user->data->getApprovedFriendships ();
		$this->render ( 'listApproved', array (
				'friendships' => $model 
		) );
	}
	public function actionInvite($friendId = null) {
		if ($friendId != null) {
			$friendUnhashedId = PseudoCrypt::unhash ( $friendId );
			$friend = GUser::model ()->findByPk ( $friendUnhashedId );
			if (isset ( $friend )) {
				$model = new GFriendship ();
				$model->inviterId = Yii::app ()->user->id;
				$model->friendId = $friend->id;
				$model->status = 1;
				if (isset ( $_GET ['message'] ))
					$model->message = $_GET ['message'];
				if ($model->save ())
					G::setFlash ( 'alert-info', 'Link requested.' );
			} else {
				$model = new GFriendship ();
				$model->friendId = $friendId;
				$model->addError ( 'friendId', "Cannot send invitation, user not found." );
			}
		}
		if (! isset ( $model ))
			$model = new GFriendship ();
		$all = null;
		$reporters = null;
		
		if (Yii::app ()->user->can ( 'Producer' ))
			$reporters = GUser::model ()->withRole ( 'Reporter' )->withoutFriends ( Yii::app ()->user->id )->findAll ();
		GUser::model ()->resetScope ();
		if (Yii::app ()->user->can ( 'InviteAll' ))
			$all = GUser::model ()->withoutFriends ( Yii::app ()->user->id )->findAll ();
		$this->render ( 'invite', array (
				'model' => $model,
				'all' => $all,
				'reporters' => $reporters 
		) );
	}
}
?>
