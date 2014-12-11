<?php
class GUserWidget extends GTag {
	public function init() {
		$this->addclass ( 'inline alert alert-info' );
		parent::init ();
	}
	public function run() {
		echo GUser::model ()->count () - 1;
		echo CHtml::openTag ( 'i', array (
				'class' => 'glyphicon glyphicon-user glyphicon-2x' 
		) ) . CHtml::closeTag ( 'i' );
		echo CHtml::openTag ( 'div', array (
				'class' => 'btn-group' 
		) );
		echo CHtml::link ( 'List users', '/gong/user/user/list', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::link ( 'Update Copy', '/gong/user/translation/list', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::link ( 'List accounts', '/gong/user/account/list', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::link ( 'List invoices', '/gong/user/invoice/list', array (
				'class' => 'btn btn-default' 
		) );
		echo CHtml::closeTag ( 'div' );
		parent::run ();
	}
}

?>
