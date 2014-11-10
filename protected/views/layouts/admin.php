<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="language" content="en"/>
        <title><?php echo Yii::app()->name; ?></title>
        <?php
        Yii::app()->getModule('haw')->registerCss();
        Yii::app()->getModule('haw')->registerScripts();
        Yii::app()->getModule('post')->registerCss();
        Yii::app()->getModule('post')->registerScripts();
        ?>
    </head>

    <body>
        <?php
            echo $content;
        ?>
    </body>
</html>