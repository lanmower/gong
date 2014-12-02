<?php
class GLink extends GTag {
	public $url = '#';
	public function init() {
		$this->tag = 'a';
		$this->htmlOptions ['href'] = $this->url;
		parent::init ();
	}
}
?>
