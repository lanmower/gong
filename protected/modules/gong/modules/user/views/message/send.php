<?php
echo '<h1>' . G::t ( 'Create Message' ) . '</h1>';

$this->breadcrumbs = array (
		G::t ( 'Roles' ) => array (
				'index' 
		),
		G::t ( 'Create' ) 
);

?>

<?php
$model = new $this->modelClassname ();
$form = $this->beginWidget ( 'CActiveForm', array (
		'id' => 'messageSend' 
) );
echo $this->renderPartial ( '_form', array (
		'model' => $model 
) );
echo CHtml::tag ( 'br' );
echo CHtml::submitButton ();
$this->endWidget ();
?>
