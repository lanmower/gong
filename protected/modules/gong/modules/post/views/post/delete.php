<?php
Yii::app ()->clientScript->registerScript ( 'postDelete', "$('.GPostView-$model->hash').remove();" );
?>
