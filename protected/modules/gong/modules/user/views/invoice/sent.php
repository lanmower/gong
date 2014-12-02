<?php
G::setFlash ( 'alert-info', "Sent invoice from: " . Yii::app ()->user->data->profile->email . " to " . $model->user->profile->email );
$this->redirect ( $this->createUrl ( 'view', array (
		'id' => $model->hash 
) ) );
?>
