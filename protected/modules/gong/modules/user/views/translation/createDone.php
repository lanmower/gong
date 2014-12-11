<?php
$summary = CHtml::errorSummary ( $model );
if (! empty ( $summary ))
	G::setFlash ( 'alert-info', $summary );
$this->redirect ( $this->createUrl ( 'list' ) );
?>
