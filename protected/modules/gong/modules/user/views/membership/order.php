<? 
$this->breadcrumbs = array(G::t('Membership'));?>

<? $this->title = G::t('Membership'); ?>
	
	<div class="form">
		<? $form=$this->beginWidget('CActiveForm', array(
		'id'=>'membership-has-company-form',
			'enableAjaxValidation'=>true,
			)); 
			echo $form->errorSummary($model);
		?>

		<div class="row">
		
			<? echo CHtml::activeRadioButtonList($model, 'roleId', 
			CHtml::listData(GRole::model()->findAll('price != 0'), 'id', 'description'),
			array('template' => '<div style="float:left;margin-right:5px;">{input}</div>{label}'));
			?>
			<div class="clear"></div>
		</div>
		<br />
		<div class="row">
			<? echo $form->labelEx($model,'payment_id'); ?> <br />
			<? echo CHtml::activeRadioButtonList($model, 'payment_id', 
			CHtml::listData(GPayment::model()->findAll(), 'id', 'title'),
			array('template' => '<div style="float:left;margin-right:5px;">{input}</div>{label}'));
			?>
			<div class="clear"></div>
		</div>
		<? echo $form->error($model,'roleId'); ?>

	<?
		echo CHtml::submitButton(G::t('Order membership'));
		
	?>
	</div> <!-- form -->
	
	<div style="padding:20px 60px 60px;">
		<div class="more-info" id="more-information"></div>
		<div id="detail-information" style="display:none;">
			<div class="membership-header"></div>
			<div class="clear"></div>
			<div class="membership-details"></div>
			<div class="membership-content"></div>
		</div>
	</div>
	<?
    Yii::app()->clientScript->registerScript('toggle', "
		$('#detail-information').hide();	  
		$('#more-information').click(function() {
	   	$('#detail-information').fadeToggle('slow');
	   });
    ");
    ?>
	<? $this->endWidget(); ?>
