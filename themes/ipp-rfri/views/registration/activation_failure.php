<?php
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class'=>'GContent'));  ?>

<h2> <? echo Gong::t('Activation did not work'); ?> </h2>

<? if($error == -1) echo Gong::t('The user is already activated'); ?>
<? if($error == -2) echo Gong::t('Wrong activation Key'); ?>
<? if($error == -3) echo Gong::t('Profile found, but no associated user. Possible database inconsistency. Please contact the System administrator with this error message, thank you'); ?>
<?php echo CHtml::closeTag('div'); ?>