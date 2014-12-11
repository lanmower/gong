<?php
class GMessageController extends GModelController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'create',
								'delete',
								'list',
								'listAll',
								'update',
								'inlineUpdate',  /* 'dataUpdate', */ 'view' 
						),
						'expression' => array (
								'GMessageController',
								'canUpdate' 
						) 
				),
				array (
						'allow',
						'actions' => array (
								'send',
								'delete',
								'view',
								'all',
								'received',
								'unread',
								'sent',
								'selectUser',
								'inlineUpdate' 
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
	public function actionSelectUser() {
		$reporters = null;
		if (Yii::app ()->user->can ( 'Producer' )) {
			$reporters = GUser::model ()->hasMembership ( 'Reporter' );
		}
		$friends = Yii::app ()->user->data->approvedFriendships;
		$this->render ( 'selectUser', array (
				'reporters' => $reporters,
				'friends' => $friends 
		) );
	}
	public function actionSend($id = null) {
		if (isset ( $id )) {
			$className = $this->modelClassname;
			$model = new $className ();
			$toUser = GUser::model ()->findByPk ( PseudoCrypt::unhash ( $id ) );
			if (isset ( $_POST [$className] )) {
				$model->attributes = $_POST [$className];
				$model->toUserId = $toUser->id;
				$model->fromUserId = Yii::app ()->user->id;
				if ($model->save ()) {
					$this->render ( 'sendDone', array (
							'model' => $model 
					) );
					Yii::app ()->end ();
				} else
					echo CVarDumper::dump ( $model->getErrors (), 10, true );
			}
			$this->render ( 'send', array (
					'model' => $model 
			) );
		} else {
			$friends = Yii::app ()->user->data->getApprovedFriendships ();
			if (Yii::app ()->user->can ( 'Producer' ))
				$reporters = GUser::model ()->withRole ( 'Reporter' )->findAll ();
			else
				$reporters = array ();
			GUser::model ()->resetScope ();
			if (Yii::app ()->user->can ( 'MessageAll' ))
				$all = GUser::model ()->findAll ();
			else
				$all = array ();
			$this->render ( 'selectUser', array (
					'friends' => $friends,
					'reporters' => $reporters,
					'all' => $all 
			) );
		}
	}
	public function actionAll() {
		$model = GMessage::model ()->all ()->findAll ();
		$this->render ( 'list', array (
				'model' => $model,
				'title' => 'All Messages',
				'edit' => false 
		) );
	}
	public function actionReceived() {
		$this->render ( 'list', array (
				'model' => GMessage::model ()->received ()->findAll (),
				'title' => 'Received Messages',
				'edit' => false 
		) );
	}
	public function actionUnread() {
		$messages = GMessage::model ()->unread ()->findAll ();
		$this->render ( 'list', array (
				'model' => $messages,
				'title' => 'Unread Messages',
				'edit' => false 
		) );
	}
	public function actionSent() {
		$this->render ( 'list', array (
				'model' => GMessage::model ()->sent ()->findAll (),
				'title' => 'Sent Messages',
				'edit' => true 
		) );
	}
	public function actionView($id) {
		$model = GMessage::model ()->all ()->findByPk ( PseudoCrypt::unhash ( $id ) );
		$model->read = true;
		$model->save ();
		$this->render ( 'view', array (
				'model' => $model,
				'edit' => $model->fromUserId == Yii::app ()->user->id 
		) );
	}
	public function actionInlineUpdate() {
		if (isset ( $_POST ['pk'] )) {
			try {
				$profile = GMessage::model ()->sent ()->findByPk ( PseudoCrypt::unhash ( $_POST ['pk'] ) );
				$profile->setAttribute ( $_POST ['name'], $_POST ['value'] );
				
				if (! $profile->save ())
					echo $this->_sendResponse ( 500, strip_tags ( CHtml::errorSummary ( $profile ) ) );
				else {
					echo preg_replace ( '/"([a-zA-Z]+[a-zA-Z0-9_]*)":/', '$1:', CJSON::encode ( array (
							'success' => true,
							'newValue' => CHtml::value ( $profile, $_POST ['name'] ) 
					) ) );
				}
			} catch ( CException $e ) {
				$this->_sendResponse ( 500, $e, 'text/html' );
			}
		}
	}
}
?>
