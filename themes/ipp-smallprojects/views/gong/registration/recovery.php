<?php
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class'=>'GContent')); 
$this->pageTitle = Gong::t('Password recovery');
$this->breadcrumbs=array(
	Gong::t('Login') => "/gong/auth/login",
	Gong::t('Restore'));

?>
<? if(Gong::hasFlash()) {
echo '<div class="success">';
echo Gong::getFlash(); 
echo '</div>';
} else {
echo '<h2>'.Gong::t('Password recovery').'</h2>';
?>

<div class="form">
<? echo CHtml::beginForm(); ?>

	<? echo CHtml::errorSummary($form); ?>
	
	<div class="row">
		<? echo CHtml::activeLabel($form,'login_or_email'); ?>
		<? echo CHtml::activeTextField($form,'login_or_email') ?>
		<p class="hint"><? echo Gong::t("Please enter your user name or email address."); ?></p>
	</div>
	
	<div class="row submit">
		<? echo CHtml::submitButton(Gong::t('Restore')); ?>
	</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->
<? } ?>
<?php echo CHtml::closeTag('div'); ?>