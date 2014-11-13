<?php
$this->pageTitle = Yii::app()->name . ' - About';
$this->breadcrumbs = array(
    'About Us',
);
        $cs = Yii::app()->getClientScript();
        $imgDirectory = $cs->getCoreScriptUrl().'/images/';
?>
<div id="static" class="text_normal">
    <h1> About us </h1>
    <div class="floatRight pad1"><?php echo CHtml::image('/images/ipp/about_turn_table.gif'); ?></div>
    <p>
        Music2Media's primary purpose is to serve as a link between the music industry and the media. Traditionally, music publishers disseminate physical CDs to entertainment editors. Music2Media fulfills this task in a far more expedient manner, negating geographical barriers and making content available across South Africa in a fraction of the time. Music2Media is a closed environment and boasts a high level of security, thus protecting the intellectual property it hosts.
    </p> 


</div>