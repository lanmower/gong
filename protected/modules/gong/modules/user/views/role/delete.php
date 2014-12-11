<?php
G::setFlash ( 'alert-info', 'Role deleted' );
$this->redirect ( $this->createUrl ( 'list' ) );
?>
