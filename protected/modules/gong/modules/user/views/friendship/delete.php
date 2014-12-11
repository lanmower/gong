<?php
G::setFlash ( 'alert-info', 'Friendship deleted' );
$this->redirect ( $this->createUrl ( '/index.php' ) );
?>
