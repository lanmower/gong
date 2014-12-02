<?php
echo '<h1>' . G::t ( 'Create Action' ) . '</h1>';

$this->breadcrumbs = array (
		G::t ( 'Actions' ) => array (
				'list' 
		),
		G::t ( 'Create' ) 
);

?>

<?php
$model = new $this->modelClassname ();
$form = $this->beginWidget ( 'CActiveForm', array (
		'id' => 'actionCreate',
		'action' => $this->createUrl ( 'create' ) 
) );
echo $this->renderPartial ( '_form', array (
		'model' => $model 
) );
echo CHtml::submitButton ();
$this->endWidget ();
?>
