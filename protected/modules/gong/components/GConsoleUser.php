<?php
Yii::import ( "gong.modules.user.models.GUser" );
class GConsoleUser {
	public $_data;
	public $_actions = array ();
	public $_roles;
	public function can($actions, $itemId = null) {
		return true;
	}
	public function getHash() {
		return $this->_data->hash;
	}
	
	/**
	 * Return admin status.
	 * 
	 * @return boolean
	 */
	public function isAdmin() {
		return true;
	}
	public function init() {
	}
}

?>
