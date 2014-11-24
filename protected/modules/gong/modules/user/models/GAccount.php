<?php

/**
 * This is the model base class for the table "account".
 *
 */
class GAccount extends GActiveRecord {
    public function behaviors() {
        return array(
            'Timestamp' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => 'created',
                'updateAttribute' => 'modified',
            ),
        );
    }
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function tableName()
	{
		return "{{account}}";
	}

	public function rules()
	{
		return array(
			array('id, size, userId', 'numerical', 'integerOnly'=>true),
		);
	}
        
        public function getSizeHr() {
            $hr = round($this->size / (1024*1024), 2);
            return "{$hr}MB";
        }
        
        public function getInvoiceLink() {
            return CHtml::link(BsHtml::icon(BSHtml::GLYPHICON_INBOX), '/gong/user/invoice/createInvoice/accountId/'.$this->hash);
        }

	public function relations()
	{
		return array(
			'user' => array(self::BELONGS_TO, 'GUser', 'userId'),
		);
	}

}
