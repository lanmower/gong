<?php
class GChildBehavior extends CActiveRecordBehavior {
	public $attributes = array ();
	public function beforeSave($event) {
		if ($this->owner->isNewRecord) {
			foreach ( $this->attributes as $attributeName ) {
				$this->owner->setAttribute ( $attributeName, PseudoCrypt::unhash ( $this->owner->getAttribute ( $attributeName ) ) );
			}
		}
		return parent::beforeSave ( $event );
	}
}
?>
