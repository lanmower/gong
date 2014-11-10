<?php

class GNotification extends GTag {
    public function init() {
        $this->htmlOptions["class"]=isset($this->htmlOptions["class"])?"alert alert-danger ".$this->htmlOptions["class"]:"alert alert-danger";
        parent::init();
    }
}

?>
