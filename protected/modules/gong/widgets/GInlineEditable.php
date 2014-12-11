<?php
class GInlineEditable extends GTag {
	public $type = 'text';
	public $pk = null;
	public $name = null;
	public $value = null;
	public $url = 'ajaxUpdate';
	public $wysiwyg = true;
	public $galleryUrl;
	private static $_firstEditor = true;
	private static $_firstRun = true;
	public function init() {
		if (! isset ( $this->name ))
			throw new CHttpException ( 500, "name not defined" );
		if (GInlineEditable::$_firstRun) {
			$jeditable = Yii::app ()->assetManager->publish ( 'protected/vendors/jeditable', false, - 1, YII_DEBUG );
			if (YII_DEBUG)
				$this->js [] = array (
						'url' => $jeditable . '/jquery.jeditable.js' 
				);
			else
				$this->js [] = array (
						'url' => $jeditable . '/jquery.jeditable.min.js' 
				);
			GInlineEditable::$_firstRun = false;
		}
		
		if ($this->type == 'editor') {
			if (GInlineEditable::$_firstEditor) {
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
				$this->js [] = array (
						'url' => G::assets () . '/js/jquery.editable.editor.js',
						CClientScript::POS_HEAD 
				);
			}
			GInlineEditable::$_firstEditor = false;
		}
		$pk = PseudoCrypt::hash ( $this->pk );
		$this->htmlOptions ['href'] = 'javascript:;';
		$this->htmlOptions ['data-type'] = $this->type;
		$this->htmlOptions ['data-url'] = $this->url;
		$this->htmlOptions ['data-value'] = $this->value;
		$this->htmlOptions ['data-name'] = $this->name;
		$this->htmlOptions ['data-pk'] = $pk;
		
		parent::init ();
		echo $this->value;
	}
}

?>
