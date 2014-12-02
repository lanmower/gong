<?php
Yii::setPathOfAlias ( 'UserModule', dirname ( __FILE__ ) );
class UserModule extends CWebModule {
	public $controllerMap = array (
			'auth' => array (
					'class' => 'UserModule.controllers.GAuthController' 
			),
			'fields' => array (
					'class' => 'UserModule.controllers.GFieldsController' 
			),
			'membership' => array (
					'class' => 'UserModule.controllers.GMembershipController' 
			),
			'invoice' => array (
					'class' => 'UserModule.controllers.GInvoiceController' 
			),
			'account' => array (
					'class' => 'UserModule.controllers.GAccountController' 
			),
			'user' => array (
					'class' => 'UserModule.controllers.GUserController' 
			),
        /*'verify' => array('class' => 'UserModule.controllers.GVerifyController'),*/
        'registration' => array (
					'class' => 'UserModule.controllers.GRegistrationController' 
			),
			'profile' => array (
					'class' => 'UserModule.controllers.GProfileController' 
			),
			'role' => array (
					'class' => 'UserModule.controllers.GRoleController' 
			),
			'action' => array (
					'class' => 'UserModule.controllers.GActionController' 
			),
			'permission' => array (
					'class' => 'UserModule.controllers.GPermissionController' 
			),
			'friendship' => array (
					'class' => 'UserModule.controllers.GFriendshipController' 
			),
			'message' => array (
					'class' => 'UserModule.controllers.GMessageController' 
			),
			'translation' => array (
					'class' => 'UserModule.controllers.GTranslationController' 
			) 
	);
	public function init() {
		$this->setImport ( array (
				'UserModule.controllers.*',
				'UserModule.components.*',
				'UserModule.models.*' 
		) );
	}
	public function beforeControllerAction($controller, $action) {
		// Do not enable Debug mode when in Production Mode
		if (! defined ( 'YII_DEBUG' ))
			$this->debug = false;
		
		return parent::beforeControllerAction ( $controller, $action );
	}
}

?>