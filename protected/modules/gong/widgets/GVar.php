<?php

class GVar extends CWidget {

    public $key;

    public function run() {
        if(!isset($this->label)) echo $this->controller->getVar($this->key);
        parent::run();
    }
}

?>