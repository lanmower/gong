<?php
$this->widget("GTable", array(
    'columns' => array(
                array("id"=>"id", "name"=>"id", "field"=>"id", 'display'=>false),
                array("id"=>"username", "name"=>"User Name", "field"=>"user.username", "width"=>150),
                array("id"=>"firstname", "name"=>"First Name", "field"=>"user.profile.firstname", "width"=>200),
                array("id"=>"lastname", "name"=>"Last Name", "field"=>"user.profile.lastname", "width"=>200),
                array("id"=>"activate", "name"=>"Activate", "field"=>"activateLink", "width"=>60, "formatter"=>"Raw"),
    ),
    'data' => $model,
    'delete' => false,
    'controllerUrl'=>$this->createUrl('user/'),
        )
);

echo CHtml::closeTag('div');
?>
