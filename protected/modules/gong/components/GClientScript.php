<?php
Yii::import ( 'ext.compressor.CompressorClientScript' );
class GClientScript extends CClientScript {
	private $_called;
	
	// public $coreScriptPosition=self::POS_BEGIN;
	public function renderBodyEnd(&$output) {
		$html = '';
		$fullPage = 0;
		$output = preg_replace ( '/(<\\/body\s*>)/is', '<###end###>$1', $output, 1, $fullPage );
		// not ajax
		if (! Yii::app ()->request->isAjaxRequest && ! isset ( $_POST ['isAjaxRequest'] ) && ! isset ( $_GET ['isAjaxRequest'] )) {
			if (isset ( $this->scriptFiles [self::POS_END] ))
				$this->called ( $this->scriptFiles [self::POS_END] );
			$html .= '<script>jQuery(function($) {
                        if(!$.alm) $.alm = {};
                        if(!$.alm.called) $.alm.called = [];
                        $.alm.called.push(' . implode ( ",", $this->_called ) . ');
                    });</script>';
			if ($fullPage)
				$output = str_replace ( '<###end###>', $html, $output );
			else
				$output = $output . $html;
			return parent::renderBodyEnd ( $output );
		}
		// ajax
		if (isset ( $this->scriptFiles [self::POS_END] )) {
			foreach ( $this->scriptFiles [self::POS_END] as $scriptFile )
				$html .= "<div class='loadscriptEnd' url='$scriptFile'></div>";
		}
		
		if (isset ( $this->scripts [self::POS_END] ))
			$html .= '<div class="callEnd">' . htmlentities ( implode ( '\n', $this->scripts [self::POS_END] ) ) . '</div>';
		
		if ($fullPage)
			$output = str_replace ( '<###end###>', $html, $output );
		else
			$output = $output . $html;
	}
	public function renderBodyBegin(&$output) {
		$html = '';
		if (! Yii::app ()->request->isAjaxRequest && ! isset ( $_POST ['isAjaxRequest'] ) && ! isset ( $_GET ['isAjaxRequest'] )) {
			if (isset ( $this->scriptFiles [self::POS_BEGIN] ))
				$this->called ( $this->scriptFiles [self::POS_BEGIN] );
			return parent::renderBodyBegin ( $output );
		}
		// ajax
		if (isset ( $this->scriptFiles [self::POS_BEGIN] )) {
			foreach ( $this->scriptFiles [self::POS_BEGIN] as $scriptFile )
				$html .= "<div class='loadscriptBegin' url='$scriptFile'></div>";
		}
		if (isset ( $this->scripts [self::POS_BEGIN] )) {
			$html .= '<div class="callBegin">' . htmlentities ( implode ( "\n", $this->scripts [self::POS_BEGIN] ) ) . '</div>';
		}
		if (isset ( $this->scripts [self::POS_LOAD] )) {
			$html .= "<div class='callLoad'>" . htmlentities ( implode ( "\n", $this->scripts [self::POS_LOAD] ) ) . "</div>";
		}
		if (isset ( $this->scripts [self::POS_READY] )) {
			$html .= "<div class='callReady'>" . htmlentities ( implode ( "\n", $this->scripts [self::POS_READY] ) ) . "</div>";
		}
		if (isset ( $this->cssFiles )) {
			foreach ( $this->cssFiles as $scriptFile => $media )
				$html .= "<div class='loadCSSHead' url='$scriptFile'></div>";
		}
		if ($html !== '') {
			$count = 0;
			$output = preg_replace ( '/(<body\b[^>]*>)/is', '$1<###begin###>', $output, 1, $count );
			if ($count)
				$output = str_replace ( '<###begin###>', $html, $output );
			else
				$output = $html . $output;
		}
	}
	private function called($scripts, $css = false) {
		if (isset ( $scripts )) {
			foreach ( $scripts as $url => $url2 ) {
				if ($css)
					$this->_called [] = "\"$url2\"";
				else
					$this->_called [] = "\"$url\"";
			}
		}
	}
	public function renderHead(&$output) {
		$html = '';
		if (! Yii::app ()->request->isAjaxRequest && ! isset ( $_POST ['isAjaxRequest'] ) && ! isset ( $_GET ['isAjaxRequest'] )) {
			$this->called ( $this->cssFiles );
			if (isset ( $this->scriptFiles [self::POS_HEAD] ))
				$this->called ( $this->scriptFiles [self::POS_HEAD] );
			
			return parent::renderHead ( $output );
		}
		// ajax
		if (isset ( $this->scriptFiles [self::POS_HEAD] )) {
			foreach ( $this->scriptFiles [self::POS_HEAD] as $scriptFile )
				$html .= "<div class='loadscriptHead' url='$scriptFile'></div>";
		}
		if (isset ( $this->scripts [self::POS_HEAD] ))
			$html .= '<div class="callBegin">' . implode ( "\n", $this->scripts [self::POS_HEAD] ) . '</div>';
		
		if ($html !== '') {
			$count = 0;
			$output = preg_replace ( '/(<body\b[^>]*>)/is', '$1<###begin###>', $output, 1, $count );
			if ($count)
				$output = str_replace ( '<###begin###>', $html, $output );
			else
				$output = $html . $output;
		}
	}
	function registerCssFile($url, $media = '') {
		if (file_exists ( "css/" . $url )) {
			parent::registerCssFile ( Yii::app ()->request->baseUrl . "/css/" . $url, $media );
			if (Yii::app ()->theme && file_exists ( Yii::app ()->theme->basePath . "/css/" . $url ))
				parent::registerCssFile ( Yii::app ()->theme->baseUrl . "/css/" . $url, $media );
		} else
			parent::registerCssFile ( $url, $media );
		return $this;
	}
}

?>