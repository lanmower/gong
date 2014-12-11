<?php
Yii::import ( 'application.extensions.yii-mail.*' );
class Mailer extends CComponent {
	static function mail($from, $to, $body, $subject) {
		$message = new YiiMailMessage ();
		$message->setBody ( $body, 'text/html' );
		$message->subject = $subject;
		$message->addTo ( $to );
		$message->from = $from;
		return Yii::app ()->mail->send ( $message );
	}
}

?>