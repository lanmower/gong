<?php
class GArticle extends GTag {
    public function init() {
        parent::init();
        echo Yii::app()->controller->content;
    }
    
    
    
}
?>
