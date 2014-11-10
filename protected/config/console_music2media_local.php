<?php

// This is the configuration for yiic console application.
// Any writable CConsoleApplication properties can be configured here.
return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'gong',
    'aliases' => array(
        'bootstrap' => realpath(__DIR__ . '/../extensions/yii-bootstrap-3-module'),
        'gong' => realpath(__DIR__ . '/../modules/gong'),
    ),
    'import' => array(
        'application.models.*',
        'application.components.*',
        'application.vendors.*',
        'application.widgets.*',
        'gong.components.*',
        'gong.components.behaviors.*',
        'gong.widgets.*',
        'gong.modules.site.models.*',
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
        'ext.AttachmentBehavior.AttachmentBehavior'
    ),
    'components' => array(
        'user' => array(
            'class' => 'GConsoleUser',
        ),
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=m2m',
            'emulatePrepare' => true,
            'username' => 'root',
            'password' => 'almagest',
            'charset' => 'utf8',
            'tablePrefix' => 'm2m_',
            'enableProfiling' => true,
            'enableParamLogging' => true
        ),
        'ftp' => array(
            'class' => 'gong.modules.haw.extensions.ftp.EFtp',
         )
    )
);

