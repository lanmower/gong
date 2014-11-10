<?php

return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'IPP  RFRI',
    // preloading 'log' component
    'preload' => array('log', 'bootstrap', 'gong'),    
// autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.components.*',
        'application.vendors.*',
        'application.widgets.*',
        'gong.components.*',
        'gong.models.*',
        'application.modules.widget.models.*',
        'application.widgets.*',
        'application.modules.widget.components.GDrawWidget',
        'zii.widgets.*',
        'zii.widgets.jui.*',
        'ext.yiibooster.widgets.*',
    ),
    'theme' => 'ipp-rfri',
    'language' => 'en',
    // application components
    'components' => array(
        'user' => array(
            'class' => 'GWebUser',
            'allowAutoLogin' => true,
            'loginUrl' => array('/gong/user/auth'),
        ),
        'clientScript' => array(
            'class' => 'application.modules.haw.components.HawClientScript',
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
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                'page/<id:\w+>' => 'page/view',
                'form/<name:\w+>' => 'page/form/form',
                'form/<formName:\w+>/<pageName:\w+>' => 'page/form/page',
                'form/<formName:\w+>/<pageName:\w+>/<id:\d+>' => 'page/form/page',
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
            'tablePrefix' => 'ipp_rfri_',
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
                'host' => 'mail.businessgateway.co.za',
                'username' => 'register@ipp-rfri.co.za',
                'password' => 'Renew1@$',
            'port' => '465',
            'encryption'=>'tls',
            ),
            'logging' => true,
            'dryRun' => false
        ),
        'request' => array(
            'class' => 'GHttpRequest',
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
        'adminEmail' => 'webmaster@tightline.co.za',
    ),
    'modules' => array(
        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => 'almagest',
            'generatorPaths' => array(
                'ext.yiibooster.gii'
            ),
        ),
        'gong' => array(
            'registrationEmail' => 'register@ipp-rfri.co.za',
            'recoveryEmail' => 'recovery@ipp-rfri.co.za',
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