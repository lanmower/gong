<?php
echo '<h2>' . G::t('View Message') . '</h2>';

$this->breadcrumbs = array(
    G::t('Messages') => array('index'),
    G::t('View'),
    $model->subject
);


$this->renderPartial('_menu');

echo CHtml::openTag('p');
echo CHtml::tag('div', array(), 'Subject:');
if($edit) $this->widget('GInlineEditable', array('pk'=>$model->id, 'url'=>'/gong/user/message/inlineUpdate', 'name'=>"subject", 'value'=>CHtml::value($model, 'subject')));
else echo CHtml::tag('div', array(), $model->subject);
echo CHtml::closeTag('p');
echo CHtml::tag('div', array(), 'Message:');
if($edit) $this->widget('GInlineEditable', array('pk'=>$model->id, 'url'=>'/gong/user/message/inlineUpdate', 'name'=>"message", 'value'=>CHtml::value($model, 'message')));
else echo CHtml::tag('div', array(), $model->message);


?>
