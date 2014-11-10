<div class="form">
<p class="note">
<? echo G::t('app','Fields with');?> <span class="required">*</span> <? echo G::t('app','are required');?>.
</p>

<? $form=$this->beginWidget('CActiveForm', array(
'id'=>'membership-form',
	'enableAjaxValidation'=>true,
	)); 
	echo $form->errorSummary($model);
?>
	<div class="row">
<? echo $form->labelEx($model,'type'); ?>
<? echo CHtml::activeRadioButtonList($model, 'type', CHtml::listData(
GRole::model()->findAll('price != 0'), 'id', 'title')); ?>
<? echo $form->error($model,'type'); ?>
</div>

<?
echo CHtml::Button(G::t('app', 'Cancel'), array(
			'submit' => array('membership/index'))); 
echo CHtml::submitButton(G::t('Buy membership')); 
$this->endWidget(); ?>
</div> <!-- form -->
