<?php
$data = new CActiveDataProvider ( $this->modelClassname );
$data->setPagination ( false );

CHtml::tag ( 'h2', array (), 'Actions' );
echo CHtml::link ( CHtml::tag ( 'h3', array (), 'Create Action' ), $this->createUrl ( 'create' ) );
$this->widget ( "GTable", array (
		'columns' => array (
				array (
						"id" => "id",
						"name" => "id",
						"field" => "id",
						"display" => false 
				),
				array (
						"id" => "title",
						"width" => 100,
						"name" => "Title",
						"field" => "title",
						'editor' => 'textarea' 
				),
				array (
						'id' => "description",
						"width" => 100,
						"name" => "Description",
						"field" => "description",
						'editor' => 'textarea' 
				),
				array (
						'id' => "price",
						"width" => 100,
						"name" => "Price",
						"field" => "price",
						'editor' => 'textarea' 
				),
				array (
						'id' => "duration",
						"width" => 100,
						"name" => "Duration",
						"field" => "duration",
						'editor' => 'textarea' 
				),
				array (
						"id" => "actions",
						"name" => "Actions",
						"field" => "id",
						'formatter' => 'Actions' 
				) 
		),
		'data' => $data->getData (),
		'controllerUrl' => $this->createUrl ( '/gong/user/action' ) 
) );
?>