<?php

return array(
    'name' => 'Music2Media',
    'theme' => 'm2m',
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
            'connectionString' => 'mysql:host=localhost;dbname=peter_m2m',
            'username' => 'peter_m2m',
            'password' => 'piegl123',
            'tablePrefix' => 'm2m_',
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
            'registrationEmail' => 'recovery@m2m.projects.cloudns.org',
            'recoveryEmail' => 'recovery@m2m.projects.cloudns.org',
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
