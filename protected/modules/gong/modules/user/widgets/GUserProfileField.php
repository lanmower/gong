<?php

class GUserProfileField extends GTag {
    public $label = "User id: ";
    public $field = "hash";
    public $edit = true;
    public function init() {
        if(empty($this->label)) $this->label = $this->field;
        $this->text .= BsHtml::labelBs($this->label);
        if($this->edit) $this->text .= $this->widget('GInlineEditable', array('pk'=>Yii::app()->user->data->profile->id, 'url'=>'/gong/user/profile/ajaxUpdate', 'name'=>"$this->field", 'value'=>CHtml::value(Yii::app()->user->data->profile, $this->field)), true);
        else $this->text .= CHtml::tag('span', array(), CHtml::value(Yii::app()->user->data, $this->field));
        parent::init();
    }

}

?>
