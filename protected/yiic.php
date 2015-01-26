<?php
$yiic=dirname(__FILE__).'/../../yii/framework/yiic.php';
$config=dirname(__FILE__).'/config/console_'.$__appId.'.php';
if ( !is_file($config) ) {
    die("Error: cannot load config for this app");
}

require_once($yiic);
