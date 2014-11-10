<?php

$data = array();
if (!empty($friendships)) {
    echo CHtml::tag('p', array(), 'The following users are linked to yours');
    $this->widget("GTable", array(
        'columns' => array(
            array("id" => "id", "name" => "id", "field" => "id", "display" => false),
            array("id" => "hash", "width" => 100, "name" => "User id", "field" => "inviter.hash"),
            array("id" => "company", "width" => 200, "name" => "Company", "field" => "inviter.profile.company"),
            array("id" => "actions", "width" => 75, "name" => "Actions", "field" => "id", 'formatter' => 'Actions'),
        ),
        'data' => $friendships,
        'view' => null,
        'controllerUrl' => $this->createUrl('/gong/user/friendship') . '/',
        
    ));
} else {
    echo CHtml::tag('p', array(), 'There are no users linked to yours.');
}
?>
