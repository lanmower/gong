<?php

return array(
    'name' => 'Coastal Accounting video exchange',
    'theme' => 'video',
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
            'connectionString' => 'mysql:host=localhost;dbname=video',
            'username' => 'root',
            'password' => 'almagest',
            'tablePrefix' => 'video_',
        ),
    ),
    'params' => array(
        'adminEmail' => 'alistairnel@gmail.com',
    ),
);
?>
