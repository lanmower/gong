<?php
echo CHtml::tag ( 'div', array (), 'First Name:&nbsp' . CHtml::value ( $model, 'profile.firstname' ) );
echo CHtml::tag ( 'div', array (), 'Last Name:&nbsp' . CHtml::value ( $model, 'profile.lastname' ) );
?>
