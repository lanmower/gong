<?php

$config = include_once ($_SERVER['HTTP_HOST'] . '.php');
$config = array_merge_recursive($config, array(
    'aliases' => array(
        'bootstrap' => realpath(__DIR__ . '/../extensions/yii-bootstrap-3-module'),
        'gong' => realpath(__DIR__ . '/../modules/gong'),
    ),
    'language' => 'en',
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'preload' => array('log'),
    'defaultController' => 'site/index',
    'import' => array(
        'application.models.*',
        'application.components.*',
        'application.vendors.*',
        'application.widgets.*',
        'gong.components.*',
        'gong.components.behaviors.*',
        'gong.widgets.*',
        'gong.modules.site.models.*',
        'gong.modules.form.models.*',
        'gong.modules.form.widgets.*',
        'gong.modules.post.widgets.*',
        'gong.modules.user.widgets.*',
        'gong.modules.site.widgets.*',
        'zii.widgets.grid.CGridView',
        'bootstrap.widgets.*',
        'bootstrap.behaviors.*',
        'bootstrap.helpers.*',
        'zii.widgets.jui.*',
        'zii.widgets.*',
        'bootstrap.helpers.*',
        'ext.AttachmentBehavior.AttachmentBehavior',
        'application.modules.livescores.widgets.*'
    ),
    'components' => array(
        'par' => array(
            'class' => 'application.extensions.dbparam.XDbParam',
            //'connectionID' => 'db',//id of the connection component, just the same as with CDbCache
            //  'preload' => 'test,test2', //comma-separated string or array of params to be loaded anyway. Other params are loaded only when requested.
            'autoLoad' => true, //loads all attributes when initializing
        //  'caseSensitive' => true, //setting to true makes all parameters case sensitive
        ),
        'user' => array(
            'class' => 'GWebUser',
            'allowAutoLogin' => true,
            'loginUrl' => array('/gong/user/auth'),
        ),
        'clientScript' => array(
            'class' => 'gong.components.GClientScript',
        ),
        'BsHtml' => array(
            'class' => 'bootstrap.helpers.BsHtml'
        ),
        'cache' => array('class' => 'system.caching.CDummyCache'),
        'urlManager' => array(
            'class' => 'CUrlManager',
            'urlFormat' => 'path',
            'showScriptName' => false,
            'rules' => array(
                'page/<name:\w+>' => 'gong/site/page/index',
                'form/<name:\w+>' => 'gong/form/user',
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ),
        ),
        'db' => array(
            'emulatePrepare' => true,
            'charset' => 'utf8',
            'enableProfiling' => true,
            'enableParamLogging' => true
        ),
        'errorHandler' => array(
            'errorAction' => 'site/error',
        ),
        'log' => YII_DEBUG ? array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, trace',
                ),
                array(
                    'class' => 'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
                    'ipFilters' => array('127.0.0.1'),
                )
            ),
                ) : array('class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, trace',
                ),
            )
                ),
        'session' => array(
            'class' => 'CDbHttpSession',
            'timeout' => 1 * 60 * 60,
            'connectionID' => 'db',
        ),
        'mail' => array(
            'class' => 'ext.yii-mail.YiiMail',
            'transportType' => 'smtp',
            'logging' => true,
            'dryRun' => false
        ),
    ),
    'modules' => array(
        'gii' => array(
            'generatorPaths' => array(
                'bootstrap.gii'
            ),
            'class' => 'system.gii.GiiModule',
            'password' => 'almagest',
            'ipFilters' => array(
                '127.0.0.1',
                '::1'
            )
        ),
        'bootstrap' => array(
            'class' => 'bootstrap.BootStrapModule'
        ),
        'gong' => array(
            'registrationEmail' => 'register@music2media.net',
            'recoveryEmail' => 'recovery@music2media.net',
            'modules' => array(
                'form' => array(),
                'site' => array(),
                'user' => array(),
                'post' => array()
            )
        ),
    ),
        ));
return $config;
?>
