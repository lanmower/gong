
<h2> <? echo G::t('Registration'); ?> </h2>

<? $this->breadcrumbs = array(G::t('Registration')); ?>

<div class="form">
<? $activeform = $this->beginWidget('CActiveForm', array(
			'id'=>'registration-form',
			'enableAjaxValidation'=>true,
			'enableClientValidation'=>true,
			'focus'=>array($form,'username'),
			));
?>

<? echo G::requiredFieldNote(); ?>
<? echo CHtml::errorSummary(array($form, $profile)); ?>

<div class="row"> <?
echo $activeform->labelEx($form,'username');
echo $activeform->textField($form,'username');
?> </div>

<div class="row"> <?
echo $activeform->labelEx($profile,'email');
echo $activeform->textField($profile,'email');
?> </div>  

<div class="row"> <?
echo $activeform->labelEx($profile,'firstname');
echo $activeform->textField($profile,'firstname');
?> </div>  

<div class="row"> <?
echo $activeform->labelEx($profile,'lastname');
echo $activeform->textField($profile,'lastname');
?> </div>  

<div class="row">
<? echo $activeform->labelEx($form,'password'); ?>
<? echo $activeform->passwordField($form,'password'); ?>
</div>

<div class="row">
<? echo $activeform->labelEx($form,'verifyPassword'); ?>
<? echo $activeform->passwordField($form,'verifyPassword'); ?>
</div>

<? if(extension_loaded('gd')): ?>
	<div class="row">
		<? echo CHtml::activeLabelEx($form,'verifyCode'); ?>
		<div>
		<? $this->widget('CCaptcha'); ?>
		<? echo CHtml::activeTextField($form,'verifyCode'); ?>
		</div>
		<p class="hint">
		<? echo G::t('Please enter the letters as they are shown in the image above.'); ?>
		<br/><? echo G::t('Letters are not case-sensitive.'); ?></p>
	</div>
	<? endif; ?>
	
	<div class="row submit">
		<? echo CHtml::submitButton(G::t('Registration')); ?>
	</div>

<? $this->endWidget(); ?>
</div><!-- form -->
