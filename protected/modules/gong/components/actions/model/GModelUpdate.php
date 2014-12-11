<?php
class GModelUpdate extends CAction {
	public function run($id) {
		$model = $this->controller->loadModel ( $id );
		if (isset ( $_POST [$this->controller->modelClassname] )) {
			$model->attributes = $_POST [$this->controller->modelClassname];
			if ($model->save ())
				$this->controller->render ( 'updateDone', array (
						'model' => $model 
				) );
		} else {
			$this->controller->render ( 'update', array (
					'model' => $model 
			) );
		}
	}
}
?>
