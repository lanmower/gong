<?php
Yii::import ( 'gong.modules.form.models.*' );
Yii::import ( 'gong.modules.form.widgets.*' );
Yii::import ( 'gong.models.*' );
class GSiteController extends GController {
	/**
	 * Displays the contact page
	 */
	public function actionContact() {
		$model = new ContactForm ();
		$dbForm = GForm::model ()->find ( 'name = "contact"' );
		if (isset ( $_POST ['ContactForm'] )) {
			$model->attributes = $_POST ['ContactForm'];
			if ($model->validate ()) {
				if (empty ( $model->subject ))
					$model->subject = Yii::app ()->name . ' contact form submission.';
				Mailer::mail ( $model->email, Yii::app ()->params ['adminEmail'], $model->body, $model->subject );
				$model->body = "Dear $model->name<br>
                        The " . Yii::app ()->name . " office acknowledges receipt of your query and will respond as soon as possible.<br>
                        Thank you and kind regards<br>
                        " . Yii::app ()->name . " office<br>";
				Mailer::mail ( Yii::app ()->params ['adminEmail'], $model->email, $model->body, $model->subject );
				Yii::app ()->user->setFlash ( 'contact', 'Thank you for contacting us. We will respond to you as soon as possible.' );
			}
		}
		$this->render ( 'contact', array (
				'model' => $model 
		) );
	}
	public function actionRevision() {
		$file = fopen ( "protected/rev", "r" );
		echo fread ( $file, 64 );
	}
	public function actionError() {
		$error = Yii::app ()->errorHandler->error;
		if ($error) {
			$this->render ( 'error', $error );
		}
	}
	public function actionLanding() {
		$this->render ( 'landing' );
	}
}
?>