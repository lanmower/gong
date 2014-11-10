<?php

return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'IPP Small Projects',
    // preloading 'log' component
    'preload' => array('log', 'bootstrap', 'gong'),    
// autoloading model and component classes
    'import' => array(
        'application.vendors.phpexcel.PHPExcel',
        'application.models.*',
        'application.components.*',
        'application.vendors.*',
        'application.widgets.*',
        'gong.components.*',
        'gong.modules.widget.components.*',
        'gong.widgets.*',
        'ext.yiibooster.widgets.*',
        'zii.widgets.jui.*',
        'zii.widgets.*',
    ),
    'theme' => 'ipp-smallprojects',
    'language' => 'en',
    // application components
    'components' => array(
        'user' => array(
            'class' => 'GWebUser',
            'allowAutoLogin' => true,
            'loginUrl' => array('/gong/user/auth'),
        ),
        'clientScript' => array(
            'class' => 'gong.modules.haw.components.HawClientScript',
        ),
        'bootstrap' => array(
            'class' => 'ext.yiibooster.components.Bootstrap',
            'responsiveCss' => true,
        ),
        'cache' => array('class' => 'system.caching.CDummyCache'),
        'urlManager' => array(
            'class' => 'GUrlManager',
            'urlFormat' => 'path',
            'showScriptName' => false,
            'rules' => array(
                'page/<id:\w+>' => 'gong/page/view',
                'form/<name:\w+>' => 'gong/form/user',
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
                '', 'site/page/view/ipp_home',
            ),
        ),
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=wwwippsm_ipp',
            'emulatePrepare' => true,
            'username' => 'root',
            'password' => 'almagest',
            'charset' => 'utf8',
            'tablePrefix' => 'ipp_smallprojects_',
            'enableProfiling' => true,
            'enableParamLogging' => true
        ),
        'errorHandler' => array(
            'errorAction' => 'site/error',
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, trace',
                ),
            ),
        ),
        'mail' => array(
            'class' => 'ext.yii-mail.YiiMail',
            'transportType' => 'smtp',
            'transportOptions' => array(
                'host' => 'ipp-smallprojects.co.za',
                'username' => 'lanmower@ipp-smallprojects.co.za',
                'password' => 'almagest',
            'port' => '465',
            'encryption'=>'tls',
            ),
            'logging' => true,
            'dryRun' => false
        ),
        'session' => array(
            'class' => 'CDbHttpSession',
            'timeout' => 32400,
            'connectionID' => 'db',
        ),
    ),
    // application-level parameters that can be accessed
// using Yii::app()->params['paramName']
    'params' => array(
// this is used in contact page
        'adminEmail' => 'alistairnel@gmail.com',
    ),
    'modules' => array(
        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => 'almagest',
            'generatorPaths' => array(
                'gong.ext.yiibooster.gii'
            ),
        ),
        'gong' => array(
            'registrationEmail' => 'register@ipp-smallprojects.co.za',
            'recoveryEmail' => 'recovery@ipp-smallprojects.co.za',
            'modules' => array(
                'page' => array(),
                'form' => array(),
                'blog' => array(),
                'widget' => array(),
                'haw' => array(),
                'user' => array(
                )
            )
        ),
    ),
);
?>