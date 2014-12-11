<?php
echo CHtml::activeLabel ( $model, 'subject' );
echo CHtml::activeTextField ( $model, 'subject' );
echo CHtml::activeLabel ( $model, 'message' );
echo CHtml::activeTextArea ( $model, 'message' );
echo CHtml::hiddenField ( 'returnUrl', Yii::app ()->request->requestUri );
?>