<?php
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
$this->pageTitle=Yii::app()->name . ' - Contact Us';
$this->breadcrumbs=array(
	'Contact',
);
?>
<div class="GContent">
     
<h2 class="underline">IPP Enquiries</h2>

<?php if(Yii::app()->user->hasFlash('contact')): ?>

<div class="flash-success">
	<?php echo Yii::app()->user->getFlash('contact'); ?>
</div>

<?php else: ?>

<p>To access Bidder documentation registration is required, <a href="/gong/registration/registration"> click here</a> to register.</p>
      <hr>

<?php $form=$this->beginWidget('CActiveForm',array('htmlOptions' => array('class'=>'inline-form'))); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'Name: '); ?>
		<?php echo $form->textField($model,'name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Your Email:'); ?>
		<?php echo $form->textField($model,'email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Subject: '); ?>
		<?php echo $form->textField($model,'subject',array('size'=>60,'maxlength'=>128)); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Message: '); ?>
		<?php echo $form->textArea($model,'body',array('rows'=>6, 'cols'=>62)); ?>
	</div>
	<?php if(extension_loaded('gd')): ?>
	<div class="row">
		<?php echo $form->labelEx($model,'verifyCode'); ?>
		<?php $this->widget('CCaptcha'); ?>
                <div class="capatcha">
		<?php echo $form->textField($model,'verifyCode',array('size'=>39,'class'=>'contactCaptacha')); ?>
		<div class="hint">Please enter the letters as they are shown in the image above.
		<br/>Letters are not case-sensitive.</div>
                </div>
	<?php endif; ?>
        </div>

	<div class="row buttons">
            <label></label>
            <?php echo CHtml::submitButton('Submit',array('class'=>'btn', 'style'=> 'width:150px')); ?>
	</div>

<?php $this->endWidget(); ?>


<?php endif; ?>
</div>