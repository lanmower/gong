<?
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
?>

<h1> <? echo Gong::t('Create Role'); ?></h1>

<?php
$this->breadcrumbs=array(
	Gong::t('Roles')=>array('index'),
	Gong::t('Create'));

?>

<? echo $this->renderPartial('_form', array('model'=>$model)); ?>
<?php echo CHtml::closeTag('div'); ?>
