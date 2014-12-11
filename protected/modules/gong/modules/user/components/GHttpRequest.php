<?php
class GHttpRequest extends CHttpRequest {
	/*
	 * public function redirect($url, $terminate = true, $statusCode = 302) {
	 * if(strpos($url,'/')===0)
	 * $url=$this->getHostInfo().$url;
	 * if (!$this->getIsAjaxRequest())
	 * header('Location: '.$url, true, $statusCode);
	 * else {
	 * echo "redirect:to:".$url;
	 * Yii::app()->end();
	 * }
	 *
	 * if($terminate)
	 * Yii::app()->end();
	 *
	 * parent::redirect($url, $terminate, $statusCode);
	 * }
	 */
}

?>
