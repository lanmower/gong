<?php
class GContent extends GTag {
	public function run() {
		echo Yii::app ()->controller->content;
		parent::run ();
	}
}

?>
