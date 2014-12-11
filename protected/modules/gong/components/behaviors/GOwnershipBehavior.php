<?php
class GOwnershipBehavior extends CActiveRecordBehavior {
	public $attributes = array ();
	public function beforeSave($event) {
		foreach ( $this->attributes as $attribute ) {
			if (! $event->sender->getAttribute ( $attribute ))
				$event->sender->setAttribute ( $attribute, Yii::app ()->user->id );
		}
	}
}