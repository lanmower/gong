<?php
class GMenu extends GTag {
	public $items;
	public $controllerMenu = false;
	private $properties;
	public $encodeLabel = true;
	public $activeCssClass = 'active';
	public function init() {
		parent::init ();
		$properties = array ();
		$properties ['htmlOptions'] = array ();
		
		$properties ['items'] = $this->items;
		if (! isset ( $properties ['items'] )) {
			$properties ['items'] = array ();
		}
		
		foreach ( $properties ['items'] as $key => $item ) {
			if (isset ( $item ['page'] )) {
				$item ['url'] = '/page/' . $item ['page'];
			}
			if (isset ( $item ['visible'] )) {
				$item ['visible'] = Yii::app ()->user->can ( $item ['visible'] );
			}
			if (isset ( $item ['type'] ) && $item ['type'] == 'login') {
				if (Yii::app ()->user->isGuest) {
					$item ['label'] = $item ['signInLabel'];
					$item ['url'] = '/gong/user/auth/login';
				} else {
					$item ['label'] = $item ['signOutLabel'];
					$item ['url'] = '/gong/user/auth/logout';
				}
			}
		}
		$properties ['id'] = 'GMenu-' . $this->id;
		$properties ['encodeLabel'] = $this->encodeLabel;
		$properties ['activeCssClass'] = $this->activeCssClass;
		$this->properties = $properties;
	}
	public function run() {
		echo $this->widget ( 'CMenu', $this->properties, true );
		parent::run ();
	}
}
?>