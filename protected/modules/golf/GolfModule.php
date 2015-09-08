<?php
Yii::setPathOfAlias ( 'golf', dirname ( __FILE__ ) );
class GolfModule extends CWebModule {
	public $controllerMap = array (
			'golf' => array (
					'class' => 'golf.controllers.ScoreController'
			)
	); //
	public function init() {
		$this->setImport ( array (
				'golf.controllers.*',
				'golf.models.*'
		) );
	}
}
