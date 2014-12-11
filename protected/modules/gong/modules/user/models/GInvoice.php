<?php

/**
 * This is the model base class for the table "account".
 *
 */
class GInvoice extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function getGridColumns() {
		return array (
				array (
						'name' => 'user.profile.company' 
				),
				array (
						'name' => 'user.profile.email' 
				),
            /*array('name' => 'view'),*/
            array (
						'value' => '$data->sizeHr' 
				),
				array (
						'name' => 'Total' 
				),
				array (
						'value' => '$data->sentHtml',
						'type' => 'raw',
						'name' => 'Send' 
				),
				array (
						'value' => '$data->paidHtml',
						'type' => 'raw',
						'name' => 'Paid' 
				),
				array (
						'header' => 'actions',
						'class' => 'GButtonColumn',
						'template' => '{delete}' 
				) 
		);
	}
	public function behaviors() {
		return array (
				'Timestamp' => array (
						'class' => 'zii.behaviors.CTimestampBehavior',
						'createAttribute' => 'created' 
				) 
		);
	}
	public function tableName() {
		return "{{invoice}}";
	}
	public function getSentHtml() {
		$send = Yii::app ()->getController ()->createUrl ( '/gong/user/invoice/send/id/' . $this->hash );
		return ($this->sent ? "<a href='$send'><i class='glyphicon glyphicon-check'></i></a>" : "<a href='$send'><i class='glyphicon glyphicon-unchecked'></i></a>");
	}
	public function getPaidHtml() {
		$paid = Yii::app ()->getController ()->createUrl ( '/gong/user/invoice/setPaid/id/' . $this->hash . '/paid/0' );
		$unpaid = Yii::app ()->getController ()->createUrl ( '/gong/user/invoice/setPaid/id/' . $this->hash . '/paid/1' );
		return ($this->paid ? "<a href='$paid'><i class='glyphicon glyphicon-check'></i></a>" : "<a href='$unpaid'><i class='glyphicon glyphicon-unchecked'></i></a>");
	}
	public function rules() {
		return array (
				array (
						'id, size, userId, paid, sent',
						'numerical',
						'integerOnly' => true 
				) 
		);
	}
	public function getSizeHr() {
		$hr = round ( $this->size / (1024 * 1024), 2 );
		return "{$hr}MB";
	}
	public function getTotal() {
		$size = round ( $this->size / (1024 * 1024), 2 );
		$total = $this->rate * $size;
		return "{$total} ZAR";
	}
	public function getInvoiceLink() {
		return CHtml::link ( BsHtml::icon ( BSHtml::GLYPHICON_INBOX ), '/gong/user/account/viewInvoice/id/' . $this->hash );
	}
	public function relations() {
		return array (
				'user' => array (
						self::BELONGS_TO,
						'GUser',
						'userId' 
				) 
		);
	}
}
