<div class="form">

<? echo CHtml::beginForm(); ?>

<? echo Gong::requiredFieldNote(); ?>

<? echo CHtml::errorSummary($model); ?>

<div class="row">
<? echo CHtml::activeLabelEx($model,'title'); ?>
<? echo CHtml::activeTextField($model,'title',array('size'=>20,'maxlength'=>20)); ?>
<? echo CHtml::error($model,'title'); ?>
</div>

<div class="row">
<? echo CHtml::activeLabelEx($model,'description'); ?>
<? echo CHtml::activeTextArea($model,'description',array('rows'=>6, 'cols'=>50)); ?>
<? echo CHtml::error($model,'description'); ?>
</div>	


<? if(Gong::hasModule('membership')) { ?>
<div class="row">
<? echo CHtml::activeLabelEx($model,'membership_priority'); ?>
<? echo CHtml::activeTextField($model, 'membership_priority'); ?>
<div class="hint">
<?= Gong::t('Leave empty or set to 0 to disable membership for this role.'); ?>
<?= Gong::t('Set to >0 to enable membership for this role and set a priority.'); ?>
<?= Gong::t('Higher is usually more worthy. This is used to determine downgrade possibilities.'); ?>
</div>
</div>
<div class="row">
<? echo CHtml::activeLabelEx($model,'price'); ?>
<? echo CHtml::activeTextField($model, 'price'); ?>
<? echo CHtml::Error($model, 'price'); ?>
</div>
<div class="hint"> 
<? echo Gong::t('How expensive is a membership? Set to 0 to disable membership for this role'); ?>
</div>

<div class="row">
<? echo CHtml::activeLabelEx($model,'duration'); ?>
<? echo CHtml::activeTextField($model, 'duration'); ?>
<? echo CHtml::Error($model, 'duration'); ?>
</div>
<div class="hint"> 
<? echo Gong::t('How many days will the membership be valid after payment?'); ?>

</div>
<div style="clear: both;"> </div>
<? } ?>

<div class="row">
<? echo CHtml::label(Gong::t('These users have been assigned to this role'), ''); ?> 

<? 
$this->widget('GongModule.components.Relation', array(
			'model' => $model,
			'relation' => 'users',
			'style' => 'dropdownlist',
			'fields' => 'username',
			'htmlOptions' => array(
				'checkAll' => Gong::t('Choose All'),
				'template' => '<div style="float:left;margin-right:5px;">{input}</div>{label}'),
			'showAddButton' => false
			));  
?>
</div>

<div class="row buttons">
<? echo CHtml::submitButton($model->isNewRecord 
		? Gong::t('Create role') 
		: Gong::t('Save role')); ?>
</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->

