<?php
class RelationController extends GController {
	public function accessRules() {
		return array(array (
				'allow',
				'actions' => array (
						'import' 
				),
				'users' => array (
						'*' 
				) 
		));
	}
	
	public function actionTest() {
		//CVarDumper::dump(GSubmission::forForm('fdsa'), 3, true);
		$test = GSubmission::forForm('fdsa')->find();
		$test = $test->test;
		CVarDumper::dump($test->name, 3, true);
	}
}

?>
