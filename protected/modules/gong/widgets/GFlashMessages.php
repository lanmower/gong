<?php
class GFlashMessages extends GTag {

    
    public function run() {
        echo G::renderFlash();
        parent::run();
    }
}
?>
