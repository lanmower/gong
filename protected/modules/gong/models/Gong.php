<?php
class Gong {
	private static $_assetsUrl = null;
	public static function assets() {
		if (! isset ( Gong::$_assetsUrl ))
			Gong::$_assetsUrl = Yii::app ()->assetManager->publish ( 'protected/modules/gong/assets', false, - 1, YII_DEBUG );
		return Gong::$_assetsUrl;
	}
	public static function hint($message) {
		return '<div class="hint">' . G::t ( $message ) . '</div>';
	}
	
	/* set a flash message to display after the request is done */
	public static function setFlash($key, $value) {
		Yii::app ()->user->setFlash ( $key, "<div class='$key info alert'>$value</div>" );
	}
	public static function hasFlash() {
		return isset ( $_SESSION ['gong_message'] );
	}
	public static function getVar($key) {
		return Yii::app ()->controller->getVar ( $key );
	}
	public static function getPrefix() {
		return 'G';
	}
	public static function getPath() {
		return 'gong/';
	}
	static function splitCamelCase($input) {
		return join ( ' ', preg_split ( '/(^[^A-Z]+|[A-Z][^A-Z]+)/', $input, - 1, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE ) );
	}
	
	/*
	 * A wrapper for the Yii::log function. If no category is given, we
	 * use the GongController as a fallback value.
	 * In addition to that, the message is being translated by G::t()
	 */
	public static function log($message, $level = 'info', $category = 'GongModule') {
		if (G::module ()->enableLogging)
			return Yii::log ( G::t ( $message ), $level, $category );
	}
	public static function renderFlash() {
		foreach ( Yii::app ()->user->flashes as $key => $message ) {
			echo $message;
			Yii::app ()->clientScript->registerScript ( 'fade', "
					setTimeout(function() { $('.info').fadeOut('slow'); },5000);	
					" );
		}
	}
	public static function p($string, $params = array()) {
		return '<p>' . G::t ( $string, $params ) . '</p>';
	}
	
	/**
	 * Fetch the translation string from db and cache when necessary
	 */
	public static function t($string, $args = null, $category = 'gong', $language = 'en') {
		$sqlString = $string;
		$sql = "SELECT translation FROM {{translation}} WHERE `message` = \"$sqlString\" AND `category` = \"$category\" AND `language` = \"$language\" LIMIT 1";
		// $dependency = new CDbCacheDependency('SELECT MAX(update_time) FROM tbl_post');
		$row = Yii::app ()->db->cache ( 3600 )->createCommand ( $sql )->query ();
		$data = $row->read ();
		// CVarDumper::dump($string);
		// die(CVarDumper::dump($data));
		
		if ($data != false) {
			if (isset ( $data ['translation'] ))
				return sprintf ( $data ['translation'], $args );
		}
		return sprintf ( $string, $args );
	}
	public static function module($module = 'user') {
		return Yii::app ()->getModule ( 'gong' );
	}
	
	/**
	 * Parses url for predefined symbols and returns real routes
	 * Following symbols are allowed:
	 * - {gong} - points to base path of Gong
	 * - {users} - points to user controller
	 * - {messsages} - points to base messages module
	 * - {roles} - points to base roles module
	 * - {profiles} - points to base profile module
	 *
	 * @param string $url        	
	 * @since 0.6
	 * @return string
	 */
	public static function route($url) {
		$gongBaseRoute = G::module ()->gongBaseRoute;
		$tr = array ();
		$tr ['{gong}'] = $gongBaseRoute;
		$tr ['{messages}'] = $gongBaseRoute . '/messages';
		$tr ['{roles}'] = $gongBaseRoute . '/role';
		$tr ['{profiles}'] = $gongBaseRoute . '/profiles';
		$tr ['{user}'] = $gongBaseRoute . '/user';
		if (is_array ( $url )) {
			$ret = array ();
			foreach ( $url as $k => $entry )
				$ret [$k] = strtr ( $entry, $tr );
			return $ret;
		} else
			return strtr ( $url, $tr );
	}
	
	/**
	 * Adds a class to a html class string
	 *
	 * @param type $string
	 *        	the class string to add to
	 * @param type $class
	 *        	the class to add to the string
	 * @return string the modified class string
	 */
	public static function addClassToString(&$string, $class) {
		if (! isset ( $string ))
			$string = $class;
		else
			$string .= ' ' . $class;
		return $string;
	}
	
	/**
	 * Produces note: "Field with * are required"
	 *
	 * @since 0.6
	 * @return string
	 */
	public static function requiredFieldNote() {
		return CHtml::tag ( 'p', array (
				'class' => 'note' 
		), G::t ( 'Fields with <span class="required">*</span> are required.' ), true );
	}
}

?>
