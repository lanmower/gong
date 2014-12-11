<?
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->title = Gong::t('Update role');
?>

<h1><? echo Gong::t('Update {role} Role', array(
			'{role}' => $model->title)); ?></h1>

<?
$this->breadcrumbs=array(
	Gong::t('Roles')=>array('index'),
	Gong::t('Update'));

?>

<? echo $this->renderPartial('_form', array('model'=>$model)); ?>
<?php echo CHtml::closeTag('div'); ?>