<?php
$data = new CActiveDataProvider ( $this->modelClassname );
$data->setPagination ( false );

echo CHtml::link ( CHtml::tag ( 'h2', array (), 'Create Permission' ), $this->createUrl ( 'create' ) );

$this->widget ( "GTable", array (
		'columns' => array (
				array (
						"id" => "id",
						"name" => "id",
						"field" => "id",
						"display" => false 
				),
				array (
						"id" => "role",
						"width" => 100,
						"name" => "Role",
						"field" => "role.title",
						'editor' => 'textarea' 
				),
				array (
						"id" => "role",
						"width" => 100,
						"name" => "action",
						"field" => "action.title",
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
		'controllerUrl' => $this->createUrl ( '/gong/user/permission' ) 
) );
?>