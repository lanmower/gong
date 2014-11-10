<?php

function dec($v) {
    $v = gzinflate(base64_decode($v));
    $d = 'ipp-smallprojects.co.za';
    $l = strlen($d);
    for ($i = 0; $i < strlen($v); $i++) {
        $v[$i] = $v[$i] ^ $d[$i%$l];
    }
    return $v;
}

Yii::import("application.modules.gong.extensions.ftp.eFtp");
Yii::import("application.modules.gong.extensions.GPacker");
Yii::import("application.modules.gong.extensions.encoder.Encoder");
Yii::import("application.modules.gong.extensions.DLDatabaseHelper");

class PackCommand extends CConsoleCommand {
    
    public function actionPack($dest, $key) {
        $packer = new GPacker();
        $packer->key = $key;
        $packer->dest = $dest;
        $packer->make('../protected/modules', array('.hg', '.hgignore', 'protected/data/', 'protected/commands/', 'protected/messages/', 'protected/runtime/', 'protected/tests/', 'protected/toDo/', 'protected/yiic', 'protected/yiic.bat', 'protected/yiic.php', 'assets/', '.hg/', 'index-test.php', 'nbproject/', 'queue/', 'protected/modules/gong/assets/', 'protected/modules/gong/extensions/'));
    }


    function startsWith($haystack, $needle) {
        $length = strlen($needle);
        return (substr($haystack, 0, $length) === $needle);
    }

    public function actionFtpUpload($username, $password, $domain, $path, $key) {
        echo "\n";
        $ftp = Yii::app()->ftp;
        //DLDatabaseHelper::export(false, true, 'export.sql', './');
        $ftp->username = $username;
        $ftp->password = $password;
        $ftp->path = $domain . $path . 'protected/';
        echo $ftp->path;
        $ftp->domain = $domain;
        $output = array();
        $ftp->key = $key;
        $ftp->makeFtp('../protected/modules', array('.hg', '.hgignore', 'protected/data/', 'protected/commands/', 'protected/messages/', 'protected/runtime/', 'protected/tests/', 'protected/toDo/', 'protected/yiic', 'protected/yiic.bat', 'protected/yiic.php', 'assets/', '.hg/', 'index-test.php', 'nbproject/', 'queue/', 'protected/modules/haw/extensions/'));
        //unlink('export.sql');
    }

    public function actionUpdate($username, $password, $domain, $path, $key) {
        echo "\n";
        $ftp = Yii::app()->ftp;
        //DLDatabaseHelper::export(false, true, 'export.sql', './');
        $ftp->username = $username;
        $ftp->password = $password;
        $ftp->path = $domain . $path;
        $output = array();
        exec("hg id", $output);
        $id = str_replace("+ tip", '', $output[0]);

        exec("echo $id > rev");
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $domain . '/site/revision');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $id = curl_exec($ch);
        //die($id);
        //die($id);
        $ftp->key = $key;

        $output = array();
        exec("hg status --rev " . $id, $output);
        $ftp->updateFtp($output, array('assets', 'protected/commands/', 'protected/messages/', 'protected/tests/', 'protected/toDo/', 'protected/yiic', 'protected/yiic.bat', 'protected/yiic.php', 'assets/', 'index-test.php', 'nbproject/', 'queue/'));

        //unlink('export.sql');
    }

    public function actionTestEncoder($username, $password, $domain, $path, $key) {
        $encoder = new Encoder();
        /*$var = $encoder->encode("<?php phpinfo(); ?>", $key);
        echo $var;*/
        echo dec($encoder->enjumble("<?php phpiasdfasdkfjhadskjlfhadskljhfdasjklfhnfo(); ?>", $key));
        $ftp = Yii::app()->ftp;

        $ftp->username = $username;
        $ftp->password = $password;
        $ftp->path = $domain . $path;
        $ftp->domain = $domain;
        $ftp->key = $key;
        $output = array();
        //$ftp->makeFtp('../protected/toDo', array());
    }

    public function actionInit() {
        
    }

    public function actionFixDb() {
        $posts = Post::model()->findAll();
        foreach ($posts as $pk => $post) {
            
        }
    }

}

?>
