<?php
class GFlash extends GTag {
	public function init() {
		echo G::renderFlash ();
		parent::init ();
	}
}
?>
