<?php
class GModelReorder extends CAction {
	public function run() {
		$className = $this->controller->modelClassname;
		$model = null;
		if (isset ( $_POST ['items'] ) && is_array ( $_POST ['items'] )) {
			$weight = 0;
			foreach ( $_POST ['items'] as $pk ) {
				$model = $className::model ()->findByPk ( PseudoCrypt::unhash ( $pk ) );
				$model->weight = $weight;
				$model->save ();
				$weight ++;
			}
		}
		
		$this->controller->render ( 'reorderDone', array (
				'model' => $model 
		) );
	}
}

?>
