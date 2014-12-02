<?php
$menu = array (
		array (
				'label' => 'All messages',
				'url' => $this->createUrl ( '/gong/user/message/all' ) 
		),
		array (
				'label' => 'Unread messages',
				'url' => $this->createUrl ( '/gong/user/message/unread' ) 
		),
		array (
				'label' => 'Received messages',
				'url' => $this->createUrl ( '/gong/user/message/received' ) 
		),
		array (
				'label' => 'Sent messages',
				'url' => $this->createUrl ( '/gong/user/message/sent' ) 
		) 
);
$this->menu = $menu;
?>
