<?php
class GTag extends GBaseWidget {
	public $htmlOptions = array ();
	public $tag = 'div';
	public $id;
	public $text;
	public static $editorUrl = "/gong/site/tag/index/";
	public function addClass($class, $target = null) {
		if ($target == null)
			G::addClassToString ( $this->htmlOptions ['class'], $class );
		G::addClassToString ( $target, $class );
	}
	public function init() {
		$this->editContent = null;
		$this->addClass ( get_class ( $this ) );
		echo CHtml::openTag ( $this->tag, $this->htmlOptions );
		parent::init ();
		if (isset ( $this->text )) {
			echo $this->text;
		}
	}
	public function run() {
		parent::run ();
		echo CHtml::closeTag ( $this->tag );
	}
}

?>
