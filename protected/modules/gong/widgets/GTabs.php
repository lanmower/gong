<?php

class GTabs extends GTag {

    public $items = array();
    public $tabsOptions = array();

    public function init() {
        if(!isset($this->tabsOptions['htmlOptions'])) $this->tabsOptions['htmlOptions'] = array();
        $tabs = array();
        $setTab = true;
        foreach ($this->items as $tab) {
            if(isset($tab['view']) && !Yii::app()->user->can($tab['view'])) continue; 
            if (isset($tab['type'])) {
                if($tab['type'] == 'login') {
                    if(Yii::app()->user->isGuest) {
                        $tab['url'] = '/gong/user/auth/login';
                    }
                    else {
                        $tab['linkOptions'] = array('class'=>'nohijack');
                        $tab['url'] = '/gong/user/auth/logout';
                    }
                    
                }
                if($tab['type'] == 'article') {
                    $tab['linkOptions'] = array('style'=>'display:none;');
                }
                unset($tab['type']);
            }
            unset($tab['view']);
            if(isset($tab['active']) && $tab['active'] == true) $setTab = false;
            $tabs[] = $tab;
        }
        if($setTab) $tabs[0]['active'] = true;
        $this->tabsOptions['tabs'] = $tabs;
        if(!isset($this->tabsOptions['id'])) $this->tabsOptions['id'] = $this->hash.'-tabs';
        $this->addClass($this->hash.'-tabs');
        $this->addClass('tabs-left');
        $this->text = BsHtml::stackedTabs($this->tabsOptions['tabs'], $this->tabsOptions['htmlOptions']);
        parent::init();
    }

    public function run() {
        parent::run();
    }

}

?>