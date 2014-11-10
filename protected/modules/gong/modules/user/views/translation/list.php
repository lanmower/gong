<?php
$data = new CActiveDataProvider($this->modelClassname);
$data->setPagination(false);

CHtml::tag('h2', array(), 'Roles');

/*echo CHtml::link(CHtml::tag('h3', array(), 'Create Translation'), $this->createUrl('create'));*/

$this->widget("GTable", array(
    'columns' => array(
        array("id" => "id", "name" => "id", "field" => "id", "display"=>false),
        array("id" => "message", "width" => 200, "name" => "Text", "field" => "message", 'editor' => 'textarea'),
        array('id' => "translation", "width" => 500, "name" => "Translation", "field" => "translation", 'editor' => 'textarea'),
        array("id" => "actions", "name" => "Actions", "field" => "id", 'formatter' => 'Actions'),
    ),
    'data' => $data->getData(),
    'controllerUrl'=>$this->createUrl('/gong/user/translation'),
    'delete'=>false
        )
);
?>