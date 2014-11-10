<?php

return array(
    'name' => 'IPP Renewables',
    'theme' => 'm2m',
    'theme' => 'ipp-renewables',
    'components' => array(
        'mail' => array(
            'class' => 'ext.yii-mail.YiiMail',
            'transportType' => 'smtp',
            'transportOptions' => array(
                'host' => 'ipp-renewables.co.za',
                'username' => 'query@ipp-renewables.co.za',
                'password' => 'Renew@1',
                'port' => '465',
                'encryption' => 'tls',
            ),
            'logging' => true,
            'dryRun' => false
        ),
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=wwwippsm_ipp',
            'username' => 'root',
            'password' => 'almagest',
            'tablePrefix' => 'ipp_renewables_',
        ),
        'session' => array(
            'class' => 'CDbHttpSession',
            'timeout' => 32400,
            'connectionID' => 'db',
        ),
    ),
    'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
);
?>
