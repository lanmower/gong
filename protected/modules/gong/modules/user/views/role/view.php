<?php
echo '<h1>' . G::t ( 'Role' ) . '</h1>';

$this->breadcrumbs = array (
		G::t ( 'Roles' ) => array (
				'index' 
		),
		G::t ( 'View' ),
		$model->title 
);

echo CHtml::tag ( 'span', array (), 'Description:' );
echo CHtml::tag ( 'span', array (), $model->description );
echo '<br/>';
echo G::t ( 'Membership price' ) . ': ' . $model->price . '<br />';
echo G::t ( 'Membership duration' ) . ': ' . $model->duration . '<br />';

?>
