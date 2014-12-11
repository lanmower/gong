<?php
$cs = Yii::app()->getClientScript();
$imgDirectory = 'http://'.$_SERVER['SERVER_NAME'].$cs->getCoreScriptUrl() . '/images/';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style=" height:100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>

    <body>
        
<?php
echo $content;
?>

    </body>
</html>
