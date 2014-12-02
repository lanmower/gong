<?php
class GRecordFlash extends GTag {
	public $key;
	public $value;
	public function init() {
		echo G::setFlash ( $this->key, $this->value );
		parent::init ();
	}
}
?>
