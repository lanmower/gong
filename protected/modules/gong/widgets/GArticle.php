<?php
class GArticle extends GTag {
	public $withContent = false;
	
	public function init() {
		
		parent::init ();
		echo G::renderFlash();
		if($this->withContent) $this->widget('GContent');
	}
}
?>
