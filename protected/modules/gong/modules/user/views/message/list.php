<?php
echo CHtml::tag('h2', array(), $title);
echo CHtml::link(CHtml::tag('h3', array(), 'Send Message'), $this->createUrl('send'));
$this->renderPartial('_menu');
if(!empty($model)) {
$this->widget("GTable", array(
    'columns' => array(
        array("id" => "id", "name" => "id", "field" => "id", "display"=>false),
        array("id" => "subject", "width" => 200, "name" => "Subject", "field" => "subject", 'editor' => $edit?'textarea':null),
        array('id' => "message", "width" => 600, "name" => "Message", "field" => "message", 'editor' => $edit?'textarea':null),
        array("id" => "actions", "name" => "Actions", "field" => "id", 'formatter' => 'Actions'),
    ),
    'data' => $model,
    'controllerUrl'=>$this->createUrl('/gong/user/message'),
        )
);
} else {
    echo "No messages found.";
}
?>