<?php
$cs = Yii::app()->getClientScript();
$imgDirectory = 'http://'.$_SERVER['SERVER_NAME'].$cs->getCoreScriptUrl() . '/images/';
?>
<td colspan="2" bgcolor="#FFFFFF"><h1 style="color:#7C7C7C;">Music 2 Media - Invitation<img alt="Turn Table Trace Image" src="http://<?php echo $imgDirectory?>about_turn_table.gif" width="300" height="230" style="float:right"/></h1>
<h5 style="color:#7C7C7C;">You have been invited to join Music 2 Media</h5>
<h5 style="color:#7C7C7C;">The following message has been attached to your invitation:</h5>
<p style="color:#FF7F23;font-weight:bold"><?php echo $body ?></p>
<h5 style="color:#7C7C7C;">Please visit <a href="<?php echo $this->createAbsoluteUrl("user/register"); ?>" style="color:#68d800"><?php echo $this->createAbsoluteUrl("user/register"); ?></a> to fill in your registration form and join Music 2 Media</h5>
<p style="color:#7C7C7C;">Please register with us and once your details have been verified, you'll enjoy unlimited access to the latest albums, press releases, pictures and videos from the hottest names in the music biz!</p>

<img alt="Heaphones Trace Image" src="http://<?php echo $imgDirectory ?>about_headphones.gif" width="100" height="69" style="float:left;padding-left:15px;padding-right:15px;"/><p style="position:relative;top: 25px;"> All Rights Reserved <a href="http://www.music2media.net/music2media" style="color:#68d800">http://www.music2media.net</a> 2010</p>
</td>
