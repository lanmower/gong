<?php

class GDump extends CWidget {

    public $key;

    public function run() {
        if(!isset($this->label)) echo CVarDumper::dump($this->controller->getVars(), 2, true);
        parent::run();
    }
}

?>