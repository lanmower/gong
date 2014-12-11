<?php
class GModelController extends GController {
	
	// public $layout = "gong.views.layouts.inspector";
	private $_modelClassname;
	public function setModelClassname($classname) {
		$this->_modelClassname = $classname;
	}
	public function getModelClassname() {
		if (isset ( $this->_modelClassname ))
			return $this->_modelClassname;
		return str_replace ( 'Controller', '', get_class ( $this ) );
		;
	}
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'create',
								'update',
								'delete',
								'list',
								'inlineUpdate',
								'view',
								'reorder' 
						),
						'expression' => array (
								get_class ( $this ),
								'canUpdate' 
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
	public function actions() {
		$actions = parent::actions ();
		$actions ['create'] = array (
				'class' => 'gong.components.actions.model.GModelCreate' 
		);
		$actions ['update'] = array (
				'class' => 'gong.components.actions.model.GModelUpdate' 
		);
		$actions ['delete'] = array (
				'class' => 'gong.components.actions.model.GModelDelete' 
		);
		$actions ['list'] = array (
				'class' => 'gong.components.actions.model.GModelList' 
		);
		$actions ['inlineUpdate'] = array (
				'class' => 'gong.components.actions.model.GModelInlineUpdate' 
		);
		$actions ['view'] = array (
				'class' => 'gong.components.actions.model.GModelView' 
		);
		$actions ['reorder'] = array (
				'class' => 'gong.components.actions.model.GModelReorder' 
		);
		return $actions;
	}
	public static function canUpdate() {
		$callerClass = get_called_class ();
		$tmpController = new $callerClass ( 'tmp' );
		return Yii::app ()->user->can ( $tmpController->modelClassname . 'Update' );
	}
	public static function canView() {
		$callerClass = get_called_class ();
		$tmpController = new $callerClass ( 'tmp' );
		return Yii::app ()->user->can ( $tmpController::model ()->modelClassname . 'View' );
	}
	public function loadModel($id) {
		$className = $this->modelClassname;
		$model = $className::model ()->findByPk ( PseudoCrypt::unhash ( $id ) );
		$this->setVar ( 'model', $model );
		if ($model == null)
			throw new CHttpException ( 404, 'The requested item was not found.' );
		return $model;
	}
}

?>
