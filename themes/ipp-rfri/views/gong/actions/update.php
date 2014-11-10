<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->breadcrumbs=array(
	'Actions'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Action', 'url'=>array('index')),
	array('label'=>'Create Action', 'url'=>array('create')),
	array('label'=>'View Action', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Action', 'url'=>array('admin')),
);
?>

<h1>Update Action: <? echo $model->title; ?></h1>

<? echo $this->renderPartial('_form', array('model'=>$model)); 
echo CHtml::closeTag('div');
?>
