<?php
class GMessageWidget extends GTag {
	public function init() {
		$this->addclass ( 'inline alert alert-info' );
		parent::init ();
	}
	public function run() {
		$unread = GMessage::model ()->unread ()->count ();
		$received = GMessage::model ()->received ()->count ();
		echo $unread;
		
		echo CHtml::openTag ( 'i', array (
				'class' => 'glyphicon glyphicon-envelope glyphicon-2x' 
		) ) . CHtml::closeTag ( 'i' );
		if ($unread) {
			echo CHtml::link ( $unread . ' Unread messages', '/gong/user/message/unread', array (
					'class' => 'btn btn-success' 
			) );
		}
		echo CHtml::openTag ( 'div', array (
				'class' => 'btn-group' 
		) );
		echo CHtml::link ( 'All', '/gong/user/message/all', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::link ( 'Received', '/gong/user/message/received', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::link ( 'Sent', '/gong/user/message/sent', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::closeTag ( 'div' );
		echo CHtml::link ( 'Send', '/gong/user/message/send', array (
				'class' => 'btn btn-default' 
		) );
		
		parent::run ();
	}
}

?>
