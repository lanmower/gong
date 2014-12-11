<?php
class GWidgetEdit extends CWidget {
	public $model;
	public function run() {
		if (Yii::app ()->user->can ( $this->model->edit ) || Yii::app ()->user->can ( 'widget_update' )) {
			$data = GWidgetView::initData ( $this->model );
			$model = $this->model;
			echo CHtml::openTag ( 'div', array (
					'class' => 'widgetEdit',
					'id' => "widgetEdit-" . $model->hash 
			) );
			$this->render ( "commonBefore", array (
					'model' => $model 
			) );
			if (file_exists ( dirname ( __FILE__ ) . "/views/edit/$model->className.php" )) {
				$this->render ( "edit/$model->className", array (
						'model' => $model 
				) );
			}
			$this->render ( "commonAfter", array (
					'model' => $model,
					'data' => $data 
			) );
			echo CHtml::closeTag ( 'div' );
		}
	}
}

?>
