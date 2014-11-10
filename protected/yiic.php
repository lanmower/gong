<?php
$yiic=dirname(__FILE__).'/../../yii/framework/yiic.php';
$config=dirname(__FILE__).'/config/console_'.$__appId.'.php';
if ( !is_file($config) ) {
    die("Error: There is no or wrong parametr appid. Please set parametr or correct. Example -appid={application_name}\n\t");
}

require_once($yiic);