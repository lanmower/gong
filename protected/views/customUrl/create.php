<?php
$this->breadcrumbs=array(
	'Custom Urls'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List CustomUrl','url'=>array('index')),
	array('label'=>'Manage CustomUrl','url'=>array('admin')),
);
?>

<h1>Create CustomUrl</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>