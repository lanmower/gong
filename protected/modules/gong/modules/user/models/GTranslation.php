<?php
class GTranslation extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function tableName() {
		return '{{translation}}';
	}
	public function forMessage($message) {
		$this->getDbCriteria ()->mergeWith ( array (
				'condition' => 'message = :message',
				'params' => array (
						':message' => $message 
				) 
		) );
		return $this;
	}
	public function rules() {
		return array (
				array (
						'message, translation',
						'required' 
				),
				array (
						'message',
						'length',
						'max' => '255' 
				) 
		);
	}
}
