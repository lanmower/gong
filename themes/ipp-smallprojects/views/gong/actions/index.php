<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->breadcrumbs=array(
	'Actions',
);

$this->menu=array(
	array('label'=>'Create Action', 'url'=>array('create')),
	array('label'=>'Manage Action', 'url'=>array('admin')),
);
?>

<h1>Actions</h1>

<? $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); 
echo CHtml::closeTag('div');
?>
