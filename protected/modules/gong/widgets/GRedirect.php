<?php
class GRedirect extends CWidget {
	public $model;
	public $url;
	public function run() {
		if (! isset ( $this->label ))
			$this->controller->redirect ( $this->controller->createUrl ( CHtml::normalizeUrl ( $this->url ) ) );
		parent::run ();
	}
}

?>