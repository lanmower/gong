<?php
$summary = CHtml::errorSummary($model);
if(!empty($summary)) G::setFlash('alert-danger',$summary);
$this->redirect($this->createUrl('list'));
?>
