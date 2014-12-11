<?php
$menu = array ();
$menu [] = array (
		'label' => 'All',
		'url' => $this->createUrl ( '/gong/user/user/list' ) 
);
$menu [] = array (
		'label' => 'Activated',
		'url' => $this->createUrl ( '/gong/user/user/list', array (
				'status' => 1 
		) ) 
);
$menu [] = array (
		'label' => 'Deactivated',
		'url' => $this->createUrl ( '/gong/user/user/list', array (
				'status' => - 2 
		) ) 
);
$menu [] = array (
		'label' => 'Approved',
		'url' => $this->createUrl ( '/gong/user/user/list', array (
				'approved' => 1 
		) ) 
);
$menu [] = array (
		'label' => 'Unapproved',
		'url' => $this->createUrl ( '/gong/user/user/list', array (
				'approved' => 0 
		) ) 
);
$this->menu = $menu;
$type = 'All users:';
if (isset ( $_GET ['status'] )) {
	if ($_GET ['status'] == 1)
		$type = 'Active users:';
	if ($_GET ['status'] == - 2)
		$type = 'Deactivated users';
}
if (isset ( $_GET ['approved'] )) {
	if ($_GET ['approved'] == 1)
		$type = 'Approved users:';
	if ($_GET ['approved'] == 0)
		$type = 'Unapproved users';
}

echo CHtml::openTag ( 'div', $htmlOptions = array (
		'class' => 'UserList' 
) );
echo CHtml::tag ( 'h2', array (), $type );
$this->widget ( "GGridView", array (
		'columns' => array (
				array (
						"id" => "hash",
						"header" => "User id",
						"name" => "hash" 
				),
				array (
						"id" => "username",
						"header" => "User Name",
						"name" => "username" 
				),
				array (
						"id" => "company",
						"header" => "Company Name",
						"name" => "profile.company" 
				),
				array (
						"id" => "firstname",
						"header" => "First Name",
						"name" => "profile.firstname" 
				),
				array (
						"id" => "lastname",
						"header" => "Last Name",
						"name" => "profile.lastname" 
				),
				
				// array("id"=>"status", "header"=>"Active", "name"=>"statusHtml", 'type' => 'raw'),
				array (
						"id" => "approved",
						"header" => "Appproved",
						"name" => "approvedHtml",
						'type' => 'raw' 
				) 
		)
		// array("id"=>"published", "header"=>"Published", "name"=>"publishedHtml", 'type' => 'raw'),
		// array('header'=>'actions','class'=>'GButtonColumn', 'template'=>'{updateChild}')
		,
		'dataProvider' => $dataProvider 
) );

echo CHtml::closeTag ( 'div' );
?>
