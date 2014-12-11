<?php
class GProfileController extends GController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'admin',
								'visits' 
						),
						'expression' => 'Yii::app()->user->isAdmin()' 
				),
				array (
						'allow',
						'actions' => array (
								'view',
								'update',
								'edit',
								'ajaxUpdate',
								'index' 
						),
						'users' => array (
								'@' 
						) 
				),
				array (
						'deny', // deny all users
						'users' => array (
								'*' 
						) 
				) 
		);
	}
	public $_model;
	public function actionUpdate($id = null) {
		if (! $id)
			$id = Yii::app ()->user->id;
		
		$user = $this->loadModel ( $id );
		$profile = $user->profile;
		
		if (isset ( $_POST ['GProfile'] )) {
			$profile->attributes = @$_POST ['GProfile'];
			
			$profile->userId = $user->id;
			
			$profile->validate ();
			if (! $profile->hasErrors ()) {
				if ($profile->save ()) {
					G::setFlash ( 'alert-info', 'Your changes have been saved' );
				}
			} else {
				G::setFlash ( 'alert-info', 'Your changes have not been saved' );
			}
		}
		$this->render ( 'update', array (
				'model' => $profile 
		) );
	}
	public function actionVisits() {
		$this->render ( 'visits', array (
				'model' => new GProfileVisit () 
		) );
	}
	public function loadModel($id = null) {
		if (! $id)
			$id = Yii::app ()->user->id;
		
		if (is_numeric ( $id ))
			return $this->_model = GUser::model ()->findByPk ( $id );
		else if (is_string ( $id ))
			return $this->_model = GUser::model ()->find ( "username = '{$id}'" );
	}
	public function actionView($id = null) {
		// If no profile id is provided, take myself
		if (! $id)
			$id = Yii::app ()->user->id;
		
		$view = '/profile/view';
		
		$this->loadModel ( $id );
		$this->updateVisitor ( Yii::app ()->user->id, $id );
		
		if (Yii::app ()->request->isAjaxRequest)
			$this->renderPartial ( $view, array (
					'model' => $this->_model 
			), false, true );
		else
			$this->render ( $view, array (
					'model' => $this->_model 
			), false, true );
	}
	public function updateVisitor($visitor_id, $visited_id) {
		// If the user does not want to log his profile visits, cancel here
		if (isset ( Yii::app ()->user->data->privacy ) && ! Yii::app ()->user->data->privacy->log_profile_visits)
			return false;
			
			// Visiting my own profile doesn't count as visit
		if ($visitor_id == $visited_id)
			return true;
		
		$visit = GProfileVisit::model ()->find ( 'visitor_id = :visitor_id and visited_id = :visited_id', array (
				':visitor_id' => $visitor_id,
				':visited_id' => $visited_id 
		) );
		if ($visit) {
			$visit->save ();
		} else {
			$visit = new GProfileVisit ();
			$visit->visitor_id = $visitor_id;
			$visit->visited_id = $visited_id;
			$visit->save ();
		}
	}
	public function actionIndex() {
		if (Yii::app ()->user->isAdmin ())
			$this->actionAdmin ();
		else
			$this->redirect ( 'view' );
	}
	public function actionAjaxUpdate() {
		try {
			$profile = new GProfile ();
			
			$profile = $this->loadModel ( PseudoCrypt::unhash ( $_POST ['id'] ) )->profile;
			$profile->setAttribute ( $_POST ['name'], $_POST ['value'] );
			
			if (! $profile->save ( true, array (
					$_POST ['name'] 
			) ))
				echo $this->_sendResponse ( 500, '<div class="liveDialog">' . CHtml::errorSummary ( $profile ) . '</div>' );
			else {
				$profile->setAttribute ( $_POST ['name'], $_POST ['value'] );
				/* echo preg_replace('/"([a-zA-Z]+[a-zA-Z0-9_]*)":/', '$1:', CJSON::encode(array('success' => true, 'newValue' => CHtml::value($profile, $_POST['name'])))); */
				echo CHtml::value ( $profile, $_POST ['name'] );
			}
		} catch ( CException $e ) {
			$this->_sendResponse ( 500, $e, 'text/html' );
		}
	}
	public function actionAdmin() {
		$model = new GProfile ();
		
		$dataProvider = new CActiveDataProvider ( 'GProfile', array (
				'pagination' => array (
						'pageSize' => 10 
				),
				'sort' => array (
						'defaultOrder' => 'id' 
				) 
		) );
		
		$this->render ( 'admin', array (
				'dataProvider' => $dataProvider,
				'model' => $model 
		) );
	}
}

?>
