<?
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class'=>'GContent'));
$this->pageTitle = Gong::t("change password");
echo '<h2>'. Gong::t('change password') .'</h2>';

$this->breadcrumbs = array(
	Gong::t("Change password"));

if(isset($expired) && $expired)
	$this->renderPartial('password_expired');
?>

<div class="form">
<? echo CHtml::beginForm(); ?>
	<? echo Gong::requiredFieldNote(); ?>
	<? echo CHtml::errorSummary($form); ?>

	<? if(!Yii::app()->user->isGuest) {
		echo '<div class="row">';
		echo CHtml::activeLabelEx($form,'currentPassword'); 
		echo CHtml::activePasswordField($form,'currentPassword'); 
		echo '</div>';
	} ?>

<? $this->renderPartial(
		'GongModule.modules.user.views.user.passwordfields', array(
			'form'=>$form)); ?>

	<div class="row submit">
	<? echo CHtml::submitButton(Gong::t("Save")); ?>
	</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->
<?php echo CHtml::closeTag('div'); ?>
