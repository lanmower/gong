<?php
class GBlog extends GTag {
	public $listOptions = array ();
	public function init() {
		parent::init ();
		echo CHtml::openTag ( 'ul', $this->listOptions );
	}
	public function run() {
		foreach ( $this->model->children as $child ) {
			$child = GWidget::model ()->findByPk ( $child->id );
			$html = GDrawWidget::drawTemplate ( $child );
			$html = GHtmlStripper::truncate ( GHtmlStripper::removeTables ( $html ), 500 );
			echo $html;
			echo CHtml::link ( 'Read More', array (
					'/gong/page/view',
					'id' => $child->hash 
			) );
			echo CHtml::tag ( 'br' );
			echo CHtml::openTag ( 'span', array (
					'class' => 'blogDate' 
			) );
			echo CHtml::tag ( 'strong', array (), 'Created: ' ) . date ( "j-n-Y", strtotime ( $child->created ) );
			echo CHtml::tag ( 'strong', array (), ' / Modified: ' ) . date ( "j-n-Y", strtotime ( $child->created ) );
			echo CHtml::closeTag ( 'span' );
		}
		echo CHtml::closeTag ( 'ul', $this->listOptions );
		parent::run ();
	}
}

?>
