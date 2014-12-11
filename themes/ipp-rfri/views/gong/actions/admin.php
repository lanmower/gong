<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));

?>
<h1> <? echo Gong::t('Manage Actions'); ?></h1>

<? $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'action-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'title',
		'comment',
		'subject',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); 

echo CHtml::closeTag('div');
?>
