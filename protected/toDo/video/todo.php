ALI:


JAMES:

Uploading images covert art updated screen gets appended for each image.




<!------- 09 September 2014 ------->


ALI:

color menu items and make their icons white. 
unselected ones look awesome in grey can we background the selected one its color and white its icon?
<!-- log Out menu item need a css class please -->

upload list has a small layout problem its preventing clicking on items next to it, can you
advise on what to do to it dom wise to resolve the clicking before we hide it at page start?
<!-- I'm not following the question. why can't you put a link next to it? -->

set width and height in db
<!-- for? -->

* import 2014-09-08 14:13:27
<!-- thanks -->

JAMES

*import latest DB /home/ali/haw-cms/protected/toDo/video/DB/2014-08-26 11:50:36.sql
<!-- done -->

* File uploader needs to be hidden by default.
<!--The file uploader is completely invisible, are you referring to the file list in the bottom of the screen?
*see above under ali*-->

Please remove all inline styling and on nested tags. <span id="GPlayer-player-EwlSP" class="jp-jplayer" style="width: 64px; height: 64px; ">
<!-- no you do not remove the js styling you work with it,
its supposed to be there for video players, pick your width and height from the theme
inspector with width: 100px height: 100px

if you're not familiar with how online video players work, perhaps you should read about a
few, play around with one or two so you can get a basic understanding of how they operate?

In your line of work, you should be able to at least fire up a test version of any one of the
online video players, skin it, play with its options, know what they have in common DOM wise.

Installing a video player into an html page and knowing how to start and configure it is not
exactly dev work its general design spec stuff, it would help you so much if you knew the basics.

Dev work with players would begin where you're adding custom events or changing a part of the players
code or operation away from the very basic example pages that are online, the rest is configuring 
and installing a js program on a web page, very important info to know.
!-->
    
    Video not working in firefox?
    <!--works in ff use flash we've discussed this tens times since we started gong, please dont bring it up again !-->
    
    Hide <span id="GPlayer-player-EwlSP"until video plays.
<!-- no we have discussed this before. you do not hide the flash object when the page starts, please do not bring it up again
if there is something that you're having a hard time with doing explain what your trying to do, you cannot hide the 
flash object when the page starts. -->