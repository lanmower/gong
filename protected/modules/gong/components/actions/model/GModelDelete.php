<?php
class GModelDelete extends CAction {
	public function run($id) {
		$model = $this->controller->loadModel ( $id );
		$model->delete ();
		$this->controller->render ( 'delete', array (
				'model' => $model 
		) );
	}
}
?>
