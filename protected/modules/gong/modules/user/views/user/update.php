<?php
if (empty ( $tabularIdx )) {
	$this->title = G::t ( 'Update user' ) . " " . $model->id;
	
	$this->breadcrumbs = array (
			G::t ( 'Users' ) => array (
					'index' 
			),
			$model->username => array (
					'view',
					'id' => $model->id 
			),
			G::t ( 'Update' ) 
	);
}
?>
