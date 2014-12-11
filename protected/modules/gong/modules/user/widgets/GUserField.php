<?php
class GUserField extends GTag {
	public $label = "User id: ";
	public $field = "hash";
	public $edit = true;
	public function init() {
		if (empty ( $this->label ))
			$this->label = $this->field;
		parent::init ();
		echo $this->label;
		if ($this->edit)
			echo $this->widget ( 'GInlineEditable', array (
					'pk' => Yii::app ()->user->id,
					'url' => '/gong/user/profile/ajaxUpdate',
					'name' => "$this->field",
					'value' => CHtml::value ( Yii::app ()->user->data, $this->field ) 
			), true );
		else
			echo CHtml::tag ( 'span', array (), CHtml::value ( Yii::app ()->user->data, $this->field ) );
	}
}

?>
