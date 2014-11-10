<?php
echo CHtml::beginForm(Yii::app()->request->requestUri, 'post', array('class'=>'jsonform-'.$model->hash));
echo CHtml::tag('div', array('class'=>'jsonEditor jsonEditor-'.$model->hash, 'data-json'=>$model->json));
echo CHtml::link('Submit fields', 'javascript:', array('class'=>'Submit', 'onclick'=>'$(this).next().attr(\'value\',JSON.stringify($.jsoneditor.get())); $(this).parent().submit();'));
echo CHtml::hiddenField(get_class($model).'[fields]');
echo CHtml::endForm();
?>

