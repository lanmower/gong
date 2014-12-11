<?php
G::setFlash ( 'alert-info', 'Action deleted' );
$this->redirect ( $this->createUrl ( 'list' ) );
?>
