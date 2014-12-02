<?php
class GDeleteChildrenBehavior extends CActiveRecordBehavior {
	public $childAttributes = array ();
	public function beforeDelete($event) {
		foreach ( $this->childAttributes as $name ) {
			$attribute = $this->owner->{$name};
			if (isset ( $attribute )) {
				if (is_array ( $attribute )) {
					foreach ( $attribute as $child ) {
						$child->delete ();
					}
				} else if (isset ( $attribute )) {
					$attribute->delete ();
				}
			}
		}
	}
}