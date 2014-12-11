<?php
$data = array ();
if (! empty ( $friendships )) {
	echo CHtml::tag ( 'p', array (), 'The following users are pending your link approval.' );
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
							"field" => "inviter.hash" 
					),
					array (
							"id" => "company",
							"width" => 200,
							"name" => "Company",
							"field" => "inviter.profile.company" 
					),
					array (
							"id" => "approval",
							"width" => 75,
							"name" => "Approve",
							"field" => "approvalLink",
							'formatter' => 'Raw' 
					),
					array (
							"id" => "actions",
							"width" => 75,
							"name" => "Actions",
							"field" => "id",
							'formatter' => 'Actions' 
					) 
			),
        /* 'actions'=>array('<a class="prompt" href="'.$this->createUrl('/gong/user/user').'/invite/id/{ID}"><i class=\'glyphicon glyphicon-thumbs-up\'></i></a>'), */
        'data' => $friendships,
			'view' => null,
			'controllerUrl' => $this->createUrl ( '/gong/user/friendship' ) . '/' 
	)
	 );
} else {
	echo CHtml::tag ( 'p', array (), 'There are no requested links pending approval.' );
}
?>
