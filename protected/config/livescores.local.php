<?php

return array(
    'name' => 'Live scores',
    'theme' => 'livescores',
    'components' => array(
        'mail' => array(
            'transportOptions' => array(
                'host' => 'ipp-smallprojects.co.za',
                'username' => 'lanmower@ipp-smallprojects.co.za',
                'password' => 'almagest',
                'port' => '465',
                'encryption' => 'tls',
            ),
        ),
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=flagship_livescores',
            'username' => 'flagship_scores',
            'password' => 'almagest',
            'tablePrefix' => 'livescores_',
        ),
    ),
    'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
        'modules' => array(
        'bootstrap' => array(
            'class' => 'bootstrap.BootStrapModule'
        ),
        'gong' => array(
            'registrationEmail' => 'recovery@livescores.projects.cloudns.org',
            'recoveryEmail' => 'recovery@livescores.projects.cloudns.org',
            'modules' => array(
                'form' => array(),
                'site' => array(),
                'user' => array(),
                'post' => array()
            )
        ),
    ),
);
Yii::import('application.modules.livescores.widgets.*');
?>
