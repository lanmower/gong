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
//Yii::import ( 'gong.models.*' );
Yii::app()->controller->content = $content;
echo GElementRenderer::render ( GSiteTemplate::select ( "ajax" ) );
//echo $content;
?>
</body>
</html>
