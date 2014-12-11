<?php
echo CHtml::openTag ( 'div', array (
		'id' => $containerId,
		'class' => 'jp-container jp-type-playlist' 
) );
echo CHtml::tag ( 'div', array (
		'id' => $playerId,
		'class' => 'jp-jplayer' 
) );
echo CHtml::closeTag ( 'div' );
?>
<div class='deck jp-left'>
	<ul class="jp-controls">
		<li><a href="javascript:;" class="jp-previous" tabindex="1"><i
				class="glyphicon glyphicon-backward glyphicon-2x"></i></a></li>
		<li><a href="javascript:;" class="jp-play" tabindex="1"><i
				class="glyphicon glyphicon-play glyphicon-2x"></i></a></li>
		<li><a href="javascript:;" class="jp-pause" tabindex="1"><i
				class="glyphicon glyphicon-pause glyphicon-2x"></i></a></li>
		<li><a href="javascript:;" class="jp-next" tabindex="1"><i
				class="glyphicon glyphicon-forward glyphicon-2x"></i></a></li>
		<li><a href="javascript:;" class="jp-stop" tabindex="1"><i
				class="glyphicon glyphicon-stop glyphicon-2x"></i></a></li>
	</ul>
	<br />
	<div class="jp-progress">
		<div class="jp-seek-bar">
			<div class="jp-time">
				<span class="jp-current-time"></span> <span>/</span> <span
					class="jp-duration"></span>
			</div>
			<div class="jp-play-bar"></div>
		</div>
	</div>

	<div class="jp-volume">
		<div class="jp-volume-bar">
			<div class="jp-volume-bar-value"></div>
		</div>
		<a class="jp-full-screen glyphicon glyphicon-fullscreen glyphicon-2x"></a>
		<!--a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume"><i class="glyphicon glyphicon-volume-up glyphicon-2x"></i></a-->
	</div>
	<br />
	<div class="jp-playlist">
		<ul>
			<li></li>
		</ul>
	</div>
</div>

<!--div class='jp-middle'>
</div>
<div class="jp-right">
</div-->

<br />
<!--div class="jp-toggles">
        <ul>
            <li><a href="javascript:;" class="jp-shuffle" tabindex="1" title="shuffle"><i class="glyphicon glyphicon-random glyphicon-2x"></i></a></li>
            <li><a href="javascript:;" class="jp-shuffle-off" tabindex="1" title="shuffle off"><i class="glyphicon glyphicon-long-arrow-right glyphicon-2x"></i></a></li>
            <li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat"><i class="glyphicon glyphicon-repeat glyphicon-2x active"></i></a></li>
            <li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off"><i class="glyphicon glyphicon-repeat glyphicon-2x"></i></a></li>
        </ul>
    </div>
    <a href="javascript:;" class="jp-mute" tabindex="1" title="mute"><i class="glyphicon glyphicon-volume-off glyphicon-2x"></i></a>
    <a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute"><i class="glyphicon glyphicon-volume-off glyphicon-2x active"></i></a-->


</div>


<div class="jp-no-solution">
	<span>Update Required</span> To play the media you will need to either
	update your browser to a recent version or update your <a
		href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
</div>
