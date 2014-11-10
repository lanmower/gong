<?php

return array(
    'name' => 'Live scores',
    'theme' => 'wgi',
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
            'connectionString' => 'mysql:host=localhost;dbname=livescores',
            'username' => 'root',
            'password' => 'almagest',
            'tablePrefix' => 'wgi_',
        ),
    ),
    'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
        'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
    'modules' => array(
        'bootstrap' => array(
            'class' => 'bootstrap.BootStrapModule'
        ),
        'gong' => array(
            'registrationEmail' => 'recovery@livescores.cloudns.org',
            'recoveryEmail' => 'recovery@livescores.cloudns.org',
            'modules' => array(
                'form' => array(),
                'site' => array(),
                'user' => array(),
                'post' => array()
            )
        ),
    ),
);
?>
