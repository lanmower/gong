<?
$startTime = microtime(true);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="language" content="en"/>
        <?php
        $js = Yii::app()->getModule('gong')->registerScripts();
        $time = Yii::app()->session->timeout + 1;
        echo '<meta http-equiv="refresh" content="'.$time.'"/>';
        echo '<meta name="viewport" content="width=device-width, initial-scale=1.0" />';
        $cs = Yii::app()->clientscript;
        

        $cs->registerCssFile($cs->getCoreScriptUrl() . '/jui/css/base/jquery-ui.css');
        $themePath = Yii::app()->assetManager->publish('themes/'.Yii::app()->theme->name, false, -1, YII_DEBUG);

        $cs->registerCoreScript('jquery');
        $cs->registerCoreScript('jquery.ui');

        if(YII_DEBUG) $cs->registerCssFile($themePath.'/bootstrap/css/bootstrap.css');
        else $cs->registerCssFile($themePath.'/bootstrap/css/bootstrap.min.css');
        if(YII_DEBUG) $cs->registerCssFile($themePath.'/bootstrap/css/bootstrap-theme.css');
        else $cs->registerCssFile($themePath.'/bootstrap/css/bootstrap-theme.min.css');

        if(YII_DEBUG) $cs->registerScriptFile($themePath . '/bootstrap/js/bootstrap.js');
        else $cs->registerScriptFile($themePath . '/bootstrap/js/bootstrap.min.js');

        /*$cs->registerCssFile($themePath.'/css/bootstrap.css');*/
        $cs->registerCssFile($themePath . '/css/style.css');

        $cs->registerScript('tooltip', "$('[data-toggle=\"tooltip\"]').tooltip();$('[data-toggle=\"popover\"]').tooltip()", CClientScript::POS_READY);
        
        
        $dirtyfields = Yii::app()->assetManager->publish('protected/vendors/dirtyfields', false, -1, YII_DEBUG);
        $cs->registerScriptFile($dirtyfields.'/jquery.dirtyFields.js', CClientScript::POS_END);
        
        if(isset(Yii::app()->params['cssExtra']))
        foreach(Yii::app()->params['cssExtra'] as $cssFile) {
            $cs->registerCssFile($cssFile);
        }
?>
        
        <title><?php echo Yii::app()->name; ?></title>        
    </head>

    <body>
        
        <?php
        if (!isset($_GET['nolayout'])) {
            Yii::app()->controller->content = $content;
            echo GElementRenderer::render(GSiteTemplate::select("template"));
        } else
            echo '<div class="GArticle">'.$content.'</div>';

        ?>
        <p id="processing" class="hidden"></p>
        <p id="processingReady" class="hidden"></p>
        <p id="processingEnd" class="hidden"></p>
        <p id="liveHead" class="hidden"></p>
        <p id="input" class="hidden"></p>
    </body>
</html>