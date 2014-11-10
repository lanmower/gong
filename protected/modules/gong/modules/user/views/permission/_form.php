<?php

$roles = array();
foreach(GRole::model()->findAll() as $key => $value) {
    $roles[$value->id] = $value->title;
}
echo CHtml::activeLabel($model, 'role');
echo CHtml::activeDropDownList($model, 'role', $roles);

$actions = array();
foreach(GAction::model()->findAll() as $key => $value) {
    $actions[$value->id] = $value->title;
}
echo CHtml::activeLabel($model, 'action');
echo CHtml::activeDropDownList($model, 'action', $actions);
echo CHtml::activeLabel($model, 'description');
echo CHtml::activeTextArea($model, 'description');
echo CHtml::hiddenField('returnUrl', Yii::app()->request->requestUri);
?>