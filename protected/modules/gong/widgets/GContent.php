<?php
class GContent extends GTag {
	public function run() {
		$this->widget('GFlash');
		echo Yii::app ()->controller->content;
		parent::run ();
	}
}

?>
