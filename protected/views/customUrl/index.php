<?php
$this->breadcrumbs=array(
	'Custom Urls',
);

$this->menu=array(
	array('label'=>'Create CustomUrl','url'=>array('create')),
	array('label'=>'Manage CustomUrl','url'=>array('admin')),
);
?>

<h1>Custom Urls</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
