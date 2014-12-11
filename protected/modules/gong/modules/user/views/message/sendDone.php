<?php
G::setFlash ( 'alert-info', 'Message Sent' );
$this->redirect ( $this->createUrl ( 'sent' ) );
?>
