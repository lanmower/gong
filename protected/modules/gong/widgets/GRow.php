<?php
class GRow extends GTag {
	public function init() {
		$this->htmlOptions ["class"] = isset ( $this->htmlOptions ["class"] ) ? "row " . $this->htmlOptions ["class"] : "row";
		parent::init ();
	}
}

?>
