<?php
$this->breadcrumbs=array(
	'Custom Urls'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List CustomUrl','url'=>array('index')),
	array('label'=>'Create CustomUrl','url'=>array('create')),
	array('label'=>'View CustomUrl','url'=>array('view','id'=>$model->id)),
	array('label'=>'Manage CustomUrl','url'=>array('admin')),
);
?>

<h1>Update CustomUrl <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>