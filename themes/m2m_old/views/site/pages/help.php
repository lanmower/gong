<?php
$this->pageTitle = Yii::app()->name . ' - Help';
$this->breadcrumbs = array(
    'Legal',
);
$cs = Yii::app()->getClientScript();
$imgDirectory = $cs->getCoreScriptUrl().'/images/';
?>
<div class="help">
    <h1>Help</h1>
    <h2>Posts</h2>
    <span class="userInfoAll floatLeft"></span><h3>Company / User Information</h3>
    <p>E-Mail . First Name . Last Name . Company Name</p>
    <hr/>
    <span class="deleteAll"></span><h3>Delete Post</h3>
    
    <div class="permissions">
        <p>Click on <a href="/create">'Create'</a> in left navigation</p>
        <h3>Permissions</h3>
        <p>Set content permissions for users</p>
        <span class="contentPublic"></span><span>Public - Everyone</span><span class="contentRestrict"></span><span>Restricted - Friends only</span><span class="contentPrivate"></span><span>Private - Owner Only</span>
    </div>
    
</div>