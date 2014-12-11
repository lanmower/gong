<div class="form">
	<p class="note">
<?php echo G::t('app','Fields with');?> <span class="required">*</span> <?php echo G::t('app','are required');?>.
</p>

<?php

$form = $this->beginWidget ( 'CActiveForm', array (
		'id' => 'membership-form',
		'enableAjaxValidation' => true 
) );
echo $form->errorSummary ( $model );
?>
	<div class="row">
<?php echo $form->labelEx($model,'type'); ?>
<?php


echo CHtml::activeRadioButtonList ( $model, 'type', CHtml::listData ( GRole::model ()->findAll ( 'price != 0' ), 'id', 'title' ) );
?>
<?php echo $form->error($model,'type'); ?>
</div>

<?php
echo CHtml::Button ( G::t ( 'app', 'Cancel' ), array (
		'submit' => array (
				'membership/index' 
		) 
) );
echo CHtml::submitButton ( G::t ( 'Buy membership' ) );
$this->endWidget ();
?>
</div>
<!-- form -->
