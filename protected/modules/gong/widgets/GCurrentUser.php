<?php
class GCurrentUser extends GTag {
	public $label = 'Logged in as:';
	public $name;
	public function init() {
		$this->addClass ( 'loggedUser' );
		$this->append ( 'label', $this->text );
		$this->text .= CHtml::link ( Yii::app ()->user->name );
	}
}

?>
