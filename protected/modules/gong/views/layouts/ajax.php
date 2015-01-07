<html>
<body><?php
$session = Yii::app ()->session;
$hashChange = $session ['hashChange'];

if (isset ( $hashChange )) {
	echo CHtml::tag ( 'div', array (
			'class' => 'hashChange',
			'target' => $hashChange 
	) );
	unset ( Yii::app ()->session ['hashChange'] );
}
	
//load template
$template = GSiteTemplate::select( "template" );
//replace statements get rendered for all children marked for ajax
$children = $template->children(array('condition'=> 'ajax = \'1\''));
Yii::app()->controller->content = $content;
$ret = array();
foreach ( $children as $element ) {
	$ret[] = '<div class="replace" target=".'. $element->className . '-' . $element->hash .'">'.GElementRenderer::renderElement ( $element ).'</div>';
}
echo implode("\n", $ret);
//output result
echo $content;
?>
</body>
</html>
