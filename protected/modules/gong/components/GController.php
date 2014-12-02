<?php
Yii::import ( "gong.modules.user.models.GPrivacySetting" );
class GController extends CController {
	public $title;
	public $menu = array ();
	public $breadcrumbs = array ();
	protected $_model;
	protected $_vars = null;
	public $billboard;
	public $content;
	protected static function addRule(&$rules, $rule) {
		$end = array_pop ( $rules );
		$rules [] = $rule;
		$rules [] = $end;
	}
	protected function _sendResponse($status = 200, $body = '', $content_type = 'application/json') {
		// set the status
		$status_header = 'HTTP/1.1 ' . $status . ' ' . $this->_getStatusCodeMessage ( $status );
		header ( $status_header );
		// and the content type
		header ( 'Content-type: ' . $content_type );
		
		echo $body;
		
		Yii::app ()->end ();
	}
	public function setVar($key, $value) {
		if (! isset ( $this->_vars )) {
			$this->_vars = array ();
			$this->_vars ['user'] = Yii::app ()->user->data;
		}
		$this->_vars [$key] = $value;
	}
	public function getVar($key) {
		return CHtml::value ( $this->vars, $key );
	}
	public function getVars() {
		if (! isset ( $this->_vars )) {
			$this->_vars = array ();
			$this->_vars ['user'] = Yii::app ()->user->data;
		}
		return $this->_vars;
	}
	private function _getStatusCodeMessage($status) {
		// these could be stored in a .ini file and loaded
		// via parse_ini_file()... however, this will suffice
		// for an example
		$codes = Array (
				200 => 'OK',
				400 => 'Bad Request',
				401 => 'Unauthorized',
				402 => 'Payment Required',
				403 => 'Forbidden',
				404 => 'Not Found',
				500 => 'Internal Server Error',
				501 => 'Not Implemented' 
		);
		return (isset ( $codes [$status] )) ? $codes [$status] : '';
	}
	public function redirect($url, $terminate = true, $statusCode = 302) {
		if (! Yii::app ()->request->isAjaxRequest)
			return parent::redirect ( $url, $terminate, $statusCode );
		if (is_array ( $url )) {
			$route = isset ( $url [0] ) ? $url [0] : '';
			$url = $this->createUrl ( $route, array_splice ( $url, 1 ) );
		}
		Yii::app ()->session ['hashChange'] = $url;
		Yii::app ()->getRequest ()->redirect ( $url, $terminate, $statusCode );
	}
	public function renderText($view, $data = null, $return = false) {
		if (Yii::app ()->request->isAjaxRequest) {
			if ($this->layout != 'none')
				$this->layout = 'gong.views.layouts.ajax';
			else
				$this->layout = 'gong.views.layouts.none';
		}
		return parent::renderText ( $view, $data, $return );
	}
	public function render($view, $data = null, $return = false) {
		if (Yii::app ()->request->isAjaxRequest) {
			if ($this->layout != 'none')
				$this->layout = 'gong.views.layouts.ajax';
			else
				$this->layout = 'gong.views.layouts.none';
		}
		if (! $this->renderSiteView ( $view, $data, $return ))
			return parent::render ( $view, $data, $return );
	}
	public function renderSiteView($view, $data = null, $return = false) {
		$moduleName = isset ( $this->module ) ? $this->module->name : '';
		$siteView = GSiteView::select ( $moduleName, $this->id, $view );
		if ($siteView) {
			ob_start ();
			foreach ( $data as $key => $value ) {
				$this->setVar ( $key, $value );
			}
			$this->setVar ( 'controller', $this );
			echo $this->renderText ( GElementRenderer::render ( $siteView ) );
			if ($return)
				return ob_get_clean ();
			else
				echo ob_get_clean ();
			return true;
		}
		return false;
	}
	protected function performAjaxValidation($model, $form) {
		if (isset ( $_POST ['ajax'] ) && $_POST ['ajax'] == $form) {
			echo CActiveForm::validate ( $model );
			Yii::app ()->end ();
		}
	}
	public function beforeAction($action) {
		if (! Yii::app ()->user->isGuest)
			Yii::app ()->user->data->setLastAction ();
		
		return parent::beforeAction ( $action );
	}
	public function filters() {
		return array (
				'accessControl' 
		);
	}
}

?>
