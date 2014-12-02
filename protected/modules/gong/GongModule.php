<?php
Yii::setPathOfAlias ( 'GongModule', dirname ( __FILE__ ) );
class GongModule extends CWebModule {
	public $debug = false;
	
	// configuration related control vars
	public $enableLogging = true;
	public $enableOnlineStatus = true;
	
	// After how much seconds without an action does a user gets indicated as
	// offline? Note that, of course, clicking the Logout button will indicate
	// him as offline instantly anyway.
	public $offlineIndicationTime = 300; // 5 Minutes
	                                     
	// set to false to enable case insensitive users.
	public $caseSensitiveUsers = true;
	public $password_expiration_time = 30; // days
	                                       
	// set to swift to active emailing by swiftMailer or
	                                       // PHPMailer to use PHPMailer as emailing lib.
	public $mailer = 'gong';
	public $salt = '';
	// valid callback function for password hashing ie. sha1
	public $hashFunc = 'md5';
	
	// valid callback function that executes after user login
	public $afterLogin = false;
	
	// Set this to true to really remove users instead of setting the status
	// to -2 (GUser::REMOVED)
	public $trulyDelete = false;
	public $gongBaseRoute = '/gong/user';
	
	// set avoidSql to true if you intent do use yii-user-management on a non
	// mysql database. All places where a SQL query would be used for performance
	// reason are overwritten with a ActiveRecord implementation. This should
	// make it more compatible with other rdbms.
	public $avoidSql = false;
	public static $dateFormat = "m-d-Y"; // "d.m.Y H:i:s"
	public $dateTimeFormat = 'm-d-Y G:i:s'; // "d.m.Y H:i:s"
	                                        
	// LoginType :
	                                        // If you want to activate many types of login just sum up the values below and assign them to 'loginType' in
	                                        // the user module configuration.
	const LOGIN_BY_USERNAME = 1;
	const LOGIN_BY_EMAIL = 2;
	// Allow login only by username by default.
	public $loginType = 3;
	public $passwordRequirements = array (
			'minLen' => 6,
			'maxLen' => 128,
			'minLowerCase' => 0,
			'minUpperCase' => 0,
			'minDigits' => 0,
			'maxRepetition' => 3 
	);
	public $usernameRequirements = array (
			'minLen' => 3,
			'maxLen' => 30,
			'match' => '/^[A-Za-z0-9_]+$/u',
			'dontMatchMessage' => 'Incorrect symbol\'s. (A-z0-9)' 
	);
	public $validEmailPattern = '/^[A-Za-z0-9@.\s,]+$/u';
	public $registrationEmail = 'register@website.com';
	public $recoveryEmail = 'restore@website.com';
	public function registerScripts() {
		$cs = Yii::app ()->clientScript;
		$am = Yii::app ()->assetManager;
		$cs->registerScriptFile ( $am->publish ( 'protected/vendors/hashchange', false, - 1, YII_DEBUG ) . '/jquery-hashchange-1.3.js', CClientScript::POS_END );
		$cs->registerScriptFile ( $am->publish ( 'protected/vendors/form', false, - 1, YII_DEBUG ) . '/jquery-form-3.18.js', CClientScript::POS_END );
		$cs->registerScriptFile ( G::assets () . '/js/GClasses.js', CClientScript::POS_END );
		$cs->registerScriptFile ( G::assets () . '/js/GEvents.js', CClientScript::POS_END );
		$cs->registerScriptFile ( G::assets () . '/js/GLoader.js', CClientScript::POS_END );
		$cs->registerCssFile ( G::assets () . '/css/style.css' );
	}
	public function init() {
		$this->setImport ( array (
				'GongModule.controllers.*',
				'GongModule.components.*',
				'GongModule.models.*' 
		) );
	}
}

?>