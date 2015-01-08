<?php
class GArticle extends GTag {
	public $withContent = false;
	
	public function init() {
		
		parent::init ();
		if($this->withContent) $this->widget('GContent');
	}
}
?>
