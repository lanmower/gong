<?php
Yii::setPathOfAlias ( 'pga', dirname ( __FILE__ ) );
class PgaModule extends CWebModule {
	public $controllerMap = array (
			'pga' => array (
					'class' => 'pga.controllers.ScoreController' 
			)
	); //
	public function init() {
		$this->setImport ( array (
				'pga.controllers.*',
				'pga.models.*' 
		) );
	}
}
