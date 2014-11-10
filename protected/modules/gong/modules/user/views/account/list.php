<?php
$data = GAccount::model()->findAll('size > 0');
$this->menu = array(
    array('label'=>'List Invoices', 'url'=>$this->createUrl('invoice/list'))
    );
echo CHtml::tag('h2', array(), 'Accounts');

$this->widget("GTable", array(
    'columns' => array(
        array("id" => "id", "name" => "id", "field" => "id", "display"=>false),
        array("id" => "hash", "width" => 100, "name" => "User id", "field" => "user.hash"),
        array("id" => "username", "width" => 100, "name" => "User Name", "field" => "user.username"),
        array("id" => "firstname", "width" => 100, "name" => "First Name", "field" => "user.profile.firstname"),
        array("id" => "lastname", "width" => 100, "name" => "Last Name", "field" => "user.profile.lastname"),
        array("id" => "outstanding", "width" => 140, "name" => "Outstanding", "field" => "sizeHr"),
        array("id" => "invoice", "width" => 100, "name" => "Invoice", "field" => "invoiceLink", 'formatter'=>'Raw'),
    ),
    'data' => $data,
    'controllerUrl'=>$this->createUrl('/gong/user/role'),
        )
);
?>