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
            'connectionString' => 'mysql:host=localhost;dbname=m2m',
            'username' => 'root',
            'password' => 'almagest',
            'tablePrefix' => 'm2m_',
        ),
    ),
    'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
);
?>
