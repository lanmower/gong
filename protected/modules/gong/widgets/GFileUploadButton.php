<?php
class GFileUploadButton extends GTag {
	public $url;
	public function init() {
		$fileupload = Yii::app ()->assetManager->publish ( 'protected/vendors/file-upload', false, - 1, YII_DEBUG );
		$this->js [] = array (
				'url' => $fileupload . '/js/vendor/jquery.ui.widget.js' 
		);
		$this->js [] = array (
				'url' => $fileupload . '/js/jquery.iframe-transport.js' 
		);
		$this->js [] = array (
				'url' => $fileupload . '/js/jquery.fileupload.js' 
		);
		$this->tag = 'button';
		$this->htmlOptions ['onclick'] = "$('#uploadinput').fileupload('option',{'url': '$this->url'}); $('#uploadinput').click();";
		$this->addClass ( 'glyphicon glyphicon-upload uploadBtn btn btn-primary' );
		$this->text = '<span>&nbsp;Upload</span>';
		parent::init ();
	}
}

?>
