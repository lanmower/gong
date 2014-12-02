<?php
class GAccountController extends GModelController {
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'delete',
								'list' 
						),
						'expression' => array (
								'GAccountController',
								'canUpdate' 
						) 
				),
				array (
						'deny',
						'users' => array (
								'*' 
						) 
				) 
		);
	}
}

?>
