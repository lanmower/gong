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
$template = GSiteTemplate::select( "template" );
$children = $template->children(array('condition'=> 'ajax = \'1\''));
Yii::app()->controller->content = $content;
$ret = array();
foreach ( $children as $element ) {
	$ret[] = '<div class="replace" target=".'. $element->className . '-' . $element->hash .'">'.GElementRenderer::renderElement ( $element ).'</div>';
}
echo implode("\n", $ret);
echo $content;
?>
</body>
</html>
