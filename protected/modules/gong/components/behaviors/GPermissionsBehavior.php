<?php
class GPermissionsBehavior extends CActiveRecordBehavior {
	private function can($action) {
		return Yii::app ()->user->can ( $action ) || ($action == "P" && Yii::app ()->user->id == $this->owner->userId);
	}
	public function beforeDelete($event) {
		if ($this->can ( $this->owner->edit ))
			parent::beforeDelete ( $event );
			// else throw new CHttpException(403, 'You are not authorized to delete this item.');
		return false;
	}
	public function afterFind($event) {
		if ($this->can ( $this->owner->view ))
			parent::afterFind ( $event );
			// else throw new CHttpException(403, 'You are not authorized to load this item.');
		return false;
	}
	public function beforeSave($event) {
		if ($this->can ( $this->owner->edit ))
			parent::beforeSave ( $event );
			// else throw new CHttpException(403, 'You are not authorized to save this item.');
		return false;
	}
}