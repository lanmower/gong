<?php
class GFlash extends CWidget {

    
    public function run() {
        G::setFlash($this->id, $this->prefixContent.$this->text.$this->suffixContent);
        parent::run();
    }
}
    
?>