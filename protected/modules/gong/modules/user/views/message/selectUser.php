<?php
if (! empty ( $friends )) {
	echo CHtml::label ( 'Friends:', 'Friends' );
	$this->widget ( "GTable", array (
			'columns' => array (
					array (
							"id" => "id",
							"name" => "id",
							"field" => "friend.id",
							'display' => false 
					),
					array (
							"id" => "hash",
							"name" => "User id",
							"field" => "friend.hash",
							"width" => 80 
					),
					array (
							"id" => "firstname",
							"name" => "First Name",
							"field" => "friend.profile.firstname",
							"width" => 150 
					),
					array (
							"id" => "lastname",
							"name" => "Last Name",
							"field" => "friend.profile.lastname",
							"width" => 150 
					),
					array (
							"id" => "company",
							"name" => "Company",
							"field" => "friend.profile.company",
							"width" => 200 
					),
					array (
							"id" => "message",
							"name" => "Message",
							"field" => "friend.messageLink",
							"width" => 100,
							'formatter' => 'Raw' 
					) 
			),
			'data' => $friends,
			'delete' => false,
			'controllerUrl' => $this->createUrl ( 'user/' ) . '/' 
	) );
}

if (! empty ( $all )) {
	echo CHtml::label ( 'Users:', 'all' );
	$this->widget ( "GTable", array (
			'columns' => array (
					array (
							"id" => "id",
							"name" => "id",
							"field" => "id",
							'display' => false 
					),
					array (
							"id" => "hash",
							"name" => "User id",
							"field" => "hash",
							"width" => 80 
					),
					array (
							"id" => "firstname",
							"name" => "First Name",
							"field" => "profile.firstname",
							"width" => 150 
					),
					array (
							"id" => "lastname",
							"name" => "Last Name",
							"field" => "profile.lastname",
							"width" => 150 
					),
					array (
							"id" => "company",
							"name" => "Company",
							"field" => "profile.company",
							"width" => 200 
					),
					array (
							"id" => "message",
							"name" => "Message",
							"field" => "messageLink",
							"width" => 100,
							'formatter' => 'Raw' 
					) 
			),
			'data' => $all,
			'delete' => false,
			'controllerUrl' => $this->createUrl ( 'user/' ) . '/' 
	)
	 );
} else {
	if (! empty ( $reporters )) {
		echo CHtml::label ( 'Reporters:', 'reporters' );
		$this->widget ( "GTable", array (
				'columns' => array (
						array (
								"id" => "id",
								"name" => "id",
								"field" => "id",
								'display' => false 
						),
						array (
								"id" => "hash",
								"name" => "User id",
								"field" => "hash",
								"width" => 80 
						),
						array (
								"id" => "firstname",
								"name" => "First Name",
								"field" => "profile.firstname",
								"width" => 150 
						),
						array (
								"id" => "lastname",
								"name" => "Last Name",
								"field" => "profile.lastname",
								"width" => 150 
						),
						array (
								"id" => "company",
								"name" => "Company",
								"field" => "profile.company",
								"width" => 200 
						),
						array (
								"id" => "message",
								"name" => "Message",
								"field" => "messageLink",
								"width" => 100,
								'formatter' => 'Raw' 
						) 
				),
				'data' => $reporters,
				'delete' => false,
				'controllerUrl' => $this->createUrl ( 'user/' ) . '/' 
		)
		 );
	}
}
?>
