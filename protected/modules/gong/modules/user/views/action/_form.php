<?php
echo CHtml::activeLabel($model, 'title');
echo CHtml::activeTextField($model, 'title');
echo CHtml::activeLabel($model, 'description');
echo CHtml::activeTextField($model, 'description');
echo CHtml::activeLabel($model, 'price');
echo CHtml::activeTextField($model, 'price');
echo CHtml::activeLabel($model, 'duration');
echo CHtml::activeTextField($model, 'duration');
echo CHtml::hiddenField('returnUrl', Yii::app()->request->requestUri);
?>