<?php
Yii::import('gong.modules.widget.models.Image');

class GImage extends GTag {
    public $src = "", $alt = "", $url;
    public function init() {
        parent::init();
        echo CHtml::image($this->src, $this->alt, $this->htmlOptions);
        if (isset($this->url)) {
           echo CHtml::link($image, $this->url, $this->htmlOptions);
        }
    }

}

?>
