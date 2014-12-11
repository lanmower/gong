<?php
class GFolder extends GTag {
	public $hideContent = true;
	public $model;
	public $title;
	public function init() {
		parent::init ();
		echo CHtml::tag ( 'div', array (
				'class' => $this->hideContent ? 'folderHeader sliderClosed' : 'folderHeader' 
		), $this->title );
		echo CHtml::openTag ( 'div', array (
				'class' => 'folderBody',
				'style' => $this->hideContent ? 'display:none;' : '' 
		) );
	}
	public function run() {
		parent::run ();
		echo CHtml::closeTag ( 'div' );
	}
}

?>
