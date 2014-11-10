<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="language" content="en"/>
        <title><?php echo Yii::app()->name; ?></title>        
        <?php
        $js = Yii::app()->getModule('gong')->registerScripts();
        $cs = Yii::app()->clientscript;

        $slickGridUrl = Yii::app()->assetManager->publish('protected/vendors/slickgrid', false, -1, YII_DEBUG);
        $cs->registerScriptFile($slickGridUrl . '/lib/firebugx.js', CClientScript::POS_BEGIN);
        $cs->registerCssFile($slickGridUrl . '/slick.grid.css');

        $cs->registerScriptFile($cs->getCoreScriptUrl() . '/jui/js/jquery-ui.min.js');
        $cs->registerCssFile($cs->getCoreScriptUrl() . '/jui/css/jquery-ui.css');
        $assetPath = Yii::app()->assetManager->publish('themes/' . Yii::app()->theme->name . '/css', false, -1, YII_DEBUG);
        $cs->registerCssFile($assetPath . '/style.css');
          Yii::app()->clientScript->registerCssFile($assetPath . '/print.css', 'print');
        $time = Yii::app()->session->timeout + 1;
        echo '<meta http-equiv="refresh" content="' . $time . '"/>';
        ?>
        
        <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" href="<?php echo $assetPath; ?>/ie.css" media="screen, projection" />
        <script type="text/javascript">
            $(function(){
                $.alm.isIE = true;
            });
        </script>
        <![endif]-->
    </head>

    <body>
        <div class="GBaseWidget widget loading" style="display:block"><img class="GImage widget" id="widget-1952" src="/themes/ipp-rfri/images/DOE-MAIN-logo.png" alt="Logo loading"><h3 class="GTag widget" id="widget-1950">Receiving...</h3></div>
        <div class="GBaseWidget widget fullscreen" style="display:block"></div>
        <?php
        if (!isset($_GET['nolayout'])) {
            Yii::app()->controller->content = $content;
            echo GDrawWidget::drawTemplateByName('printTemplate');
        } else
            echo $content;

        ?>
        <p id="processing" class="hidden"></p>
        <p id="processingReady" class="hidden"></p>
        <p id="processingEnd" class="hidden"></p>
        <p id="liveHead" class="hidden"></p>
        <p id="input" class="hidden"></p>
        <script>
            $(document).ready(function(){
                $("body").keydown(false);
                $('textarea').autosize();                
                $('.control-label').hide();
                $('.jtable-add-record').hide();
                $('.fullscreen').hide();
                $('.Loading').hide(200,function() {
                    $('<div>Your document is ready for print.</div>').dialog({
                        modal: true,
                        height: 'auto',
                        width: 'auto',

                        buttons: {
                            Print: function() {
                                $( this ).dialog( "close" );
                                window.print();  
                                window.close();
                                $('body').append('<div class="GBaseWidget widget fullscreen glass"></div>');
                            },
                            Cancel: function() {
                                $( this ).dialog( "close" );
                                window.close();
                                $('body').append('<div class="GBaseWidget widget fullscreen glass"></div>');
                            }
                        }
                    });
                });
            });
            
</script>
    </body>
</html>