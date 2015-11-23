<?php
Yii::import ( 'application.models.*' );
Yii::import ( 'application.components.*' );
Yii::import ( 'application.vendors.*' );
Yii::import ( 'application.widgets.*' );
Yii::import ( 'gong.components.*' );
Yii::import ( 'gong.components.behaviors.*' );
Yii::import ( 'gong.widgets.*' );
Yii::import ( 'gong.modules.site.models.*' );
Yii::import ( 'gong.modules.form.models.*' );
Yii::import ( 'gong.modules.form.widgets.*' );
Yii::import ( 'gong.modules.post.widgets.*' );
Yii::import ( 'gong.modules.user.widgets.*' );
Yii::import ( 'gong.modules.site.widgets.*' );
class ProcessScoresCommand extends CConsoleCommand {
	public function actionIndex() {
		if(isset(Yii::app()->params['max'])) ScoreTools::processScores (Yii::app()->params['max']);
		else ScoreTools::processScores ();
	}
}

?>
