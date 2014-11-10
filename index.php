<?php
ini_set('display_errors',1);
error_reporting(E_ALL|E_STRICT);
define('WP_MEMORY_LIMIT', '64M');
date_default_timezone_set("Africa/Johannesburg");
function e_d()
{
    $d = $_SERVER['SERVER_NAME'];
    if(preg_match("/(?P<domain>[a-z0-9][a-z0-9\-]{1,63}\.[a-z\.]{2,6})$/i", $d, $m))
    {
        return $m['domain'];
    } else {
        return $d;
    }
}

function dec($v) {
    $v = gzinflate(base64_decode($v));
    $d = e_d();
    $l = strlen($d);
    for ($i = 0; $i < strlen($v); $i++) {
        $v[$i] = $v[$i] ^ $d[$i%$l];
    }
    return $v;
}


function substrws($text, $len = 180) {
    if ((strlen($text) > $len)) {
        $whitespaceposition = strpos($text, " ", $len) - 1;
        if ($whitespaceposition > 0)
            $text = substr($text, 0, ($whitespaceposition + 1));
        if (preg_match_all("|<([a-zA-Z]+)>|", $text, $aBuffer)) {
            if (!empty($aBuffer[1])) {
                preg_match_all("|</([a-zA-Z]+)>|", $text, $aBuffer2);
                if (count($aBuffer[1]) != count($aBuffer2[1])) {
                    foreach ($aBuffer[1] as $index => $tag) {
                        if (empty($aBuffer2[1][$index]) || $aBuffer2[1][$index] != $tag)
                            $text .= '</' . $tag . '>';
                    }
                }
            }
        }
    }

    return $text;
}

function deleteFile($filename) {
    if (file_exists($filename) && is_writeable($filename) && is_file($filename)) {
        return unlink($filename);
    }
    return false;
}

function fullescape($in) {
    $out = '';
    for ($i = 0; $i < strlen($in); $i++) {
        $hex = dechex(ord($in[$i]));
        if ($hex == '')
            $out = $out . urlencode($in[$i]);
        else
            $out = $out . '%' . ((strlen($hex) == 1) ? ('0' . strtoupper($hex)) : (strtoupper($hex)));
    }
    $out = str_replace('+', '%20', $out);
    $out = str_replace('_', '%5F', $out);
    $out = str_replace('.', '%2E', $out);
    $out = str_replace('-', '%2D', $out);
    return $out;
}

ini_set('display_errors',1);
error_reporting(E_ALL|E_STRICT);
$yii=dirname(__FILE__).'/../yii/framework/yii.php';

$config=dirname(__FILE__).'/protected/config/common.php';

defined('YII_DEBUG') or define('YII_DEBUG',true);
defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3);


require_once($yii);
$app = Yii::createWebApplication($config);
$app->run();
?>

