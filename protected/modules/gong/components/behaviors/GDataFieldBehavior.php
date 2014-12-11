<?php
class GDataFieldBehavior extends CActiveRecordBehavior {
	public $attributes = array ();
	public function afterFind($event) {
		foreach ( $this->attributes as $attributeName ) {
			$attribute = $this->owner->getAttribute ( $attributeName );
			if ($attribute == null)
				$this->owner->setAttribute ( $attributeName, array () );
			else
				$this->owner->setAttribute ( $attributeName, CJSON::decode ( $attribute, true ) );
		}
		return parent::afterFind ( $event );
	}
	public function beforeSave($event) {
		foreach ( $this->attributes as $attributeName ) {
			if (is_array ( $this->owner->getAttribute ( $attributeName ) )) {
				$this->owner->setAttribute ( $attributeName, CJSON::encode ( $this->owner->getAttribute ( $attributeName ) ) );
			}
		}
		return parent::beforeSave ( $event );
	}
}
?>
