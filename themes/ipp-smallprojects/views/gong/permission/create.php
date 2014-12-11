<? echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));
echo '<h1>' . Gong::t('Create Permission'). '</h1>';
?>
<div class="form">

<? $form=$this->beginWidget('CActiveForm', array(
	'id'=>'permission-create-form',
	'enableAjaxValidation'=>true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<? echo $form->errorSummary($model); ?>

	<div class="row">
	<label> <? echo Gong::t('Do you want to grant this permission to a user or a role'); ?> </label>
	<? echo $form->radioButtonList($model, 'type', array(
				'user' => Gong::t('User'),
				'role' => Gong::t('Role')),
			array('template' => '<div class="checkbox">{input}</div>{label}'
				)); ?>
			<? echo $form->error($model,'type'); ?>
	</div>

	<div id="assignment_user">
	<div class="row">
	<? echo $form->labelEx($model,'principal_id'); ?>
	<? $this->widget('Relation', array(
				'model' => $model,
				'relation' => 'principal',
				'fields' => 'username',
				));?>
		<? echo $form->error($model,'principal_id'); ?>

		<? echo $form->labelEx($model,'subordinate_id'); ?>
		<? $this->widget('Relation', array(
					'model' => $model,
					'allowEmpty' => true,
					'relation' => 'subordinate',
					'fields' => 'username',
					));?>

		<? echo $form->error($model,'subordinate_id'); ?>
		</div>
	<div class="row">
		<? echo $form->labelEx($model,'template'); ?>
		<? echo $form->dropDownList($model,'template', array(
					'0' => Gong::t('No'),
					'1' => Gong::t('Yes'),
					)); ?>
		<? echo $form->error($model,'template'); ?>
	</div>

		</div>

	<div id="assignment_role" style="display: none;">
	<div class="row">
	<? echo $form->labelEx($model,'principal_id'); ?>
	<? $this->widget('Relation', array(
				'model' => $model,
				'relation' => 'principal_role',
				'fields' => 'title',
				));?>
		<? echo $form->error($model,'principal_id'); ?>

		<? echo $form->labelEx($model,'subordinate_id'); ?>
		<? $this->widget('Relation', array(
					'model' => $model,
					'allowEmpty' => true,
					'relation' => 'subordinate_role',
					'fields' => 'title',
					));?>

		<? echo $form->error($model,'subordinate_id'); ?>
		</div>
		</div>



	<div class="row">
		<? echo $form->labelEx($model,'action'); ?>
		<? $this->widget('Relation', array(
					'model' => $model,
					'relation' => 'Action',
					'fields' => 'title',
					));?>
		<? echo $form->error($model,'action'); ?>
	</div>

	<div class="row">
		<? echo $form->labelEx($model,'comment'); ?>
		<? echo $form->textArea($model,'comment'); ?>
		<? echo $form->error($model,'comment'); ?>
	</div>



	<div class="row buttons">
		<? echo CHtml::submitButton('Submit'); ?>
	</div>

<? $this->endWidget(); ?>

</div><!-- form -->

<? echo CHtml::closeTag('div'); ?>

<? Yii::app()->clientScript->registerScript('type', "
$('#GongPermission_type_0').click(function() {
$('#assignment_role').hide();
$('#assignment_user').show();});

$('#GongPermission_type_1').click(function() {
$('#assignment_role').show();
$('#assignment_user').hide();});

");
