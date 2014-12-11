<?php
$data = new CActiveDataProvider ( $this->modelClassname );
$data->setPagination ( false );
$type = 'All Invoices';
if (isset ( $_GET ['paid'] )) {
	$type = $_GET ['paid'] ? 'Paid ' : 'Unpaid invoices';
	$data->getCriteria ()->compare ( 'paid', $_GET ['paid'] );
}
if (isset ( $_GET ['sent'] )) {
	$type = $_GET ['sent'] ? 'Sent ' : 'Unsent invoices';
	$data->getCriteria ()->compare ( 'sent', $_GET ['sent'] );
}
$this->menu = array (
		array (
				'label' => 'List Accounts',
				'url' => $this->createUrl ( 'account/list' ) 
		),
		array (
				'label' => 'Paid',
				'url' => $this->createUrl ( 'list', array (
						'paid' => 1 
				) ) 
		),
		array (
				'label' => 'Not paid',
				'url' => $this->createUrl ( 'list', array (
						'paid' => 0 
				) ) 
		),
		array (
				'label' => 'Sent',
				'url' => $this->createUrl ( 'list', array (
						'sent' => 1 
				) ) 
		),
		array (
				'label' => 'Not sent',
				'url' => $this->createUrl ( 'list', array (
						'sent' => 0 
				) ) 
		) 
);

echo CHtml::tag ( 'h2', array (), $type );
$this->widget ( "GTable", array (
		'columns' => array (
				array (
						"id" => "id",
						"name" => "id",
						"field" => "id",
						"display" => false 
				),
				array (
						"id" => "hash",
						"width" => 100,
						"name" => "User id",
						"field" => "user.hash" 
				),
				array (
						"id" => "username",
						"width" => 150,
						"name" => "User Name",
						"field" => "user.username" 
				),
				array (
						"id" => "firstname",
						"width" => 150,
						"name" => "First Name",
						"field" => "user.profile.firstname" 
				),
				array (
						"id" => "lastname",
						"width" => 150,
						"name" => "Last Name",
						"field" => "user.profile.lastname" 
				),
				array (
						"id" => "data",
						"width" => 140,
						"name" => "Data",
						"field" => "sizeHr" 
				),
				array (
						"id" => "rate",
						"width" => 100,
						"name" => "Rate",
						"field" => "rate" 
				),
				array (
						"id" => "total",
						"width" => 100,
						"name" => "Total",
						"field" => "total" 
				),
				array (
						"id" => "send",
						"width" => 75,
						"name" => "Send",
						"field" => "sentHtml",
						'formatter' => 'Raw' 
				),
				array (
						"id" => "paid",
						"width" => 75,
						"name" => "Paid",
						"field" => "paidHtml",
						'formatter' => 'Raw' 
				),
				array (
						"id" => "actions",
						"name" => "Actions",
						"field" => "id",
						'formatter' => 'Actions' 
				) 
		),
		'data' => $data->getData (),
		'controllerUrl' => $this->createUrl ( '/gong/user/invoice' ) 
) );
?>
