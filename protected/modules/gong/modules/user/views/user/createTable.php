<?php
$summary = CHtml::errorSummary($model);
if(!empty($summary)) G::setFlash('alert-info',$summary);
else G::setFlash('alert-info' ,'Table created.');
$this->redirect($this->createUrl('/gong/form/form/list'));
?>
