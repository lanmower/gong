<?php
$firstTime = time();
$this->render ( 'postViewHeader', array (
		'model' => $model,
		'id' => $id,
		'edit' => $edit,
		'published' => $published 
) );
echo 'Header:'+(time() - $firstTime);
$this->render ( 'postViewDetails', array (
		'model' => $model,
		'id' => $id,
		'edit' => $edit,
		'published' => $published 
) );
echo 'Details:'+(time() - $firstTime);
$this->render ( 'postViewButtons', array (
		'model' => $model,
		'id' => $id,
		'edit' => $edit,
		'published' => $published 
) );
echo 'Buttons:'+(time() - $firstTime);
$this->render ( 'postViewContent', array (
		'model' => $model,
		'id' => $id,
		'edit' => $edit,
		'published' => $published 
) );
echo 'Header:'+(time() - $firstTime);
?>
