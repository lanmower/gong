<?php
class GBaseWidget extends CWidget {
	public $prefixContent = "";
	public $suffixContent = "";
	public $editContent;
	public $model;
	public $script;
	public $core = array ();
	public $js = array ();
	public $css = array ();
	public static $noid = 1;
	private static $_autoHash = 0;
	private $_hash;
	protected function registerScripts() {
		$cs = Yii::app ()->clientscript;
		foreach ( $this->js as $script ) {
			$cs->registerScriptFile ( $script ['url'], isset ( $script ['pos'] ) ? $script ['post'] : CClientScript::POS_BEGIN );
		}
		foreach ( $this->css as $script ) {
			$cs->registerCssFile ( $script ['url'] );
		}
		foreach ( $this->core as $core ) {
			$cs->registerCoreScript ( $core ['name'] );
		}
		if (isset ( $this->script )) {
			$id = isset ( $this->model ) ? $this->model->hash : GBaseWidget::$noid ++;
			Yii::app ()->clientScript->registerScript ( 'GBaseWidget-' . $id, $this->script, CClientScript::POS_READY );
		}
	}
	public function p($text) {
		$text = $this->$text;
		if ($text)
			echo $text;
	}
	public function append($name, &$to) {
		$text = $this->$name;
		if (! empty ( $text )) {
			$to = "{$to}{$text}";
		}
	}
	public function init() {
		$this->registerScripts ();
		$this->p ( 'prefixContent' );
		$this->p ( 'editContent' );
	}
	public function run() {
		$this->p ( 'suffixContent' );
	}
	public function getHash() {
		if (isset ( $this->_hash ))
			return $this->_hash;
		else {
			if (isset ( $this->model ))
				return $this->_hash = $this->model->hash;
			else
				return $this->_hash = 'i-' . PseudoCrypt::hash ( ++ self::$_autoHash );
		}
	}
}

?>