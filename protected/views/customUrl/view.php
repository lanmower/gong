<?php
$this->breadcrumbs=array(
	'Custom Urls'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List CustomUrl','url'=>array('index')),
	array('label'=>'Create CustomUrl','url'=>array('create')),
	array('label'=>'Update CustomUrl','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete CustomUrl','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage CustomUrl','url'=>array('admin')),
);
?>

<h1>View CustomUrl #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'path',
		'url',
	),
)); ?>
