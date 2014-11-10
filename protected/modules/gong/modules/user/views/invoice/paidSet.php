<?php
G::setFlash('alert-info', "Invoice ".($model->paid?'paid':' set to unpaid').'.');
$this->redirect('/gong/user/invoice/list');
?>
