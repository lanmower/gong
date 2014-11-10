<?php
echo CHtml::activeLabel($model, 'message');
echo CHtml::activeTextField($model, 'message');
echo CHtml::activeLabel($model, 'translation');
echo CHtml::activeTextArea($model, 'translation');
echo CHtml::hiddenField('returnUrl', Yii::app()->request->requestUri);
?>