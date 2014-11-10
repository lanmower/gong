<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->breadcrumbs=array(
	Gong::t('Actions')=>array('index'),
	$model->title,
);

?>

<h1>Action: <? echo $model->title; ?></h1>

<? $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'comment',
		'subject',
	),
)); 

echo CHtml::closeTag('div');
?>
