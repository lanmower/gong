<?php
G::setFlash ( 'alert-info', 'Message deleted' );
$this->redirect ( $this->createUrl ( 'received' ) );
?>
