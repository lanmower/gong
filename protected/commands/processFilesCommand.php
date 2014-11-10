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
Yii::import("application.modules.gong.components.*");
Yii::import("application.modules.gong.components.behaviors.*");
Yii::import("application.modules.gong.modules.file.controllers.GFileController");
class ProcessFilesCommand extends CConsoleCommand {
    

    public function actionRun() {
        GFileController::process();
    }
    
   


}

?>
