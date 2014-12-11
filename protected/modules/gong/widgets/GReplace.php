<?php
class GReplace extends GTag {
	public $target = '';
	public function init() {
		$this->htmlOptions ['target'] = $this->target;
		$this->addClass('replace');
		parent::init ();
	}
}
?>
