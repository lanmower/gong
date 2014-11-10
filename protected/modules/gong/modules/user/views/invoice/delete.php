<?php
G::setFlash('alert-info', 'Invoice deleted');
$this->redirect($this->createUrl('list'));
?>
