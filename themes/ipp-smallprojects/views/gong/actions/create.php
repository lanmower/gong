<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->breadcrumbs=array(
	Gong::t('Actions')=>array('index'),
	Gong::t('Create'),
);

?>

<h1> <? echo Gong::t('Create Action'); ?></h1>

<? echo $this->renderPartial('_form', array('model'=>$model)); 
echo CHtml::closeTag('div');
?>
