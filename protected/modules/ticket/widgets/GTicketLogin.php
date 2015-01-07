<?php
class GTicketLogin extends GTag {
 	public function run() {
 		
 		if(Yii::app()->user->isGuest()) {
 			if(isset($_GET('ticket'))) {
 				$ticket = GSubmission::forForm('Ticket')->findByPk(PseudoCrypt::unhash($_GET('ticket')));
 				if(isset($ticket)) {
 					$identity = new GUserIdentity ( 'ticket', '123!ticket!321' );
 					$identity->authenticate ();
 				}
 			}

 			echo CHtml::passwordField ( "ticket" );
 		
 		}
	}
	
}
?>
