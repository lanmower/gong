<?php
class GEditor extends GTag {
	public $name = null;
	public $value = null;
	public $url = 'ajaxUpdate';
	public $galleryUrl;
	public function init() {
		if (! isset ( $this->name ))
			throw new CHttpException ( 500, "name not defined" );
		$wysihtml5 = Yii::app ()->assetManager->publish ( 'protected/vendors/wysihtml5', false, - 1, YII_DEBUG );
		$bootstrapwysihtml5 = Yii::app ()->assetManager->publish ( 'protected/vendors/bootstrap3-wysihtml5', false, - 1, YII_DEBUG );
		if (YII_DEBUG) {
			$this->js [] = array (
					'url' => $wysihtml5 . '/dist/wysihtml5-0.3.0.js' 
			);
			$this->js [] = array (
					'url' => $bootstrapwysihtml5 . '/dist/bootstrap3-wysihtml5.all.min.js' 
			);
			$this->css [] = array (
					'url' => $bootstrapwysihtml5 . '/dist/bootstrap3-wysihtml5.css' 
			);
		} else {
			$this->js [] = array (
					'url' => $wysihtml5 . '/dist/wysihtml5-0.3.0.min.js' 
			);
			$this->js [] = array (
					'url' => $bootstrapwysihtml5 . '/dist/bootstrap3-wysihtml5.all.min.js' 
			);
			$this->css [] = array (
					'url' => $bootstrapwysihtml5 . '/dist/bootstrap3-wysihtml5.min.css' 
			);
		}
		$this->js [] = array (
				'url' => $wysihtml5 . '/parser_rules/advanced.js' 
		);
		
		$this->script = "$('#$this->id-textarea').wysihtml5();";
		parent::init ();
	}
	public function run() {
		echo '<div id="' . $this->id . '-textarea">' . $this->value . '</div>';
		
		parent::run ();
	}
}

?>
