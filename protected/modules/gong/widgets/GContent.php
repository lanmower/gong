<?php
class GContent extends GTag {
	public function run() {
		echo G::renderFlash();
		echo Yii::app ()->controller->content;
		parent::run ();
	}
}

?>
