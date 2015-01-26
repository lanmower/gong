<?php
class GTicketLogin extends GTag {
 	public function run() {
 		
 		if(Yii::app()->user->isGuest) {
 			
 			if(isset($_POST['ticket'])) $id = $_POST['ticket'];
 			if(isset($_GET['ticket'])) $id = $_GET['ticket'];
 			if(isset($id)) {
 				$ticket = GSubmission::forForm('Ticket')->findByPk(PseudoCrypt::unhash($_POST['ticket']));
 				if(isset($ticket)) {
					Yii::import ( 'gong.modules.user.components.GUserIdentity' );
					Yii::import ( 'gong.modules.user.models.GEncrypt' );
					$identity = new GUserIdentity ( 'ticket', '123!ticket!321' );
					$duration = 3600 * 24; // 24 hours
					if($identity->authenticate ()) {
						G::setFlash('alert-info', 'Logged in using ticket');
						Yii::app ()->user->login ( $identity, $duration );
						$this->controller->redirect('/index.php');
					}
					else G::setFlash('alert-error', 'Ticket login not working');
 				} else {
 					G::setFlash('alert-info', 'Ticket not found');
 				}
 				
 			}
			echo CHtml::tag('span', array(), 'Ticket code:');
 			echo CHtml::beginForm('');
 			echo CHtml::textField ( "ticket" );
 			echo CHtml::endForm();
 		}
 		parent::run();
	}
	
}
?>
