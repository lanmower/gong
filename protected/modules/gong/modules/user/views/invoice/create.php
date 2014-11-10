<?php
echo CHtml::tag('h2', array(), 'Create Invoice');
echo 'User has '.$model->sizeHr.' outstanding data.';

echo CHtml::form();
echo CHtml::label('Price &nbsp;', 'rate');
echo CHtml::textField('rate');
echo '&nbsp; R/MB';
echo CHtml::submitButton();
echo CHtml::endForm();
?>
