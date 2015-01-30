<?php
class GPlayer extends GTag {
	public $audioFullscreen = 'false';
	public $supplied = "mp3, oga, m4a, m4v";
	public $wmode = "window";
	public $smoothPlayBar = true;
	public $keyEnabled = false;
	public $width = '288px';
	public $height = '216px';
	public function addClass($class, $target = null) {
		if ($target == null)
			G::addClassToString ( $this->htmlOptions ['class'], $class );
		G::addClassToString ( $target, $class );
	}
	public function init() {
		$this->tag = 'div';
		$this->htmlOptions ['id'] = "GPlayer-" . $this->hash;
		$jplayer = Yii::app ()->assetManager->publish ( 'protected/vendors/jplayer', false, - 1, YII_DEBUG );
		$this->core [] = array (
				'name' => 'jquery' 
		);
		$this->js [] = array (
				'url' => $jplayer . '/jquery.jplayer.min.js' 
		);
		$this->js [] = array (
				'url' => $jplayer . '/add-on/jplayer.playlist.js' 
		);
		$this->css [] = array (
				'url' => $jplayer . '/skin/m2m/jplayer.m2m.css' 
		);
		$playerId = "GPlayer-player-" . $this->hash;
		$containerId = "GPlayer-container-" . $this->hash;
		$this->id = $containerId;
		$this->script .= "
                
        var hideclip= function() {
            $('#$playerId').jPlayer('option', 'size', {
                            width: '1px',
                            height: '1px',
                    }); 
            //$('#{$this->htmlOptions['id']}').slideUp();
        }    
        $.alm.player = new jPlayerPlaylist(
            {
                jPlayer: '#$containerId',
                cssSelectorAncestor: '#{$this->htmlOptions['id']}'
            },
            [],
            {
                playlistOptions: {
                    enableRemoveControls: true,
                    autoPlay: true
                },
                swfPath: '$jplayer',
                supplied: '$this->supplied',
                wmode: '$this->wmode',
                smoothPlayBar: '$this->smoothPlayBar',
                    size: {
                            width: '$this->width',
                            height: '$this->height',
                    },
                keyEnabled: '$this->keyEnabled',
                /*audioFullScreen: '$this->audioFullscreen',
                *//*timeupdate: function(event) { // 4Hz
                    if (event.jPlayer.status.currentTime == 0 && event.jPlayer.status.paused) {
                        hideclip();
                    }
                }*/
            }
        );
        $('.jp-playlist').hide();
        hideclip();
        
        //$('.jp_container').hide();

        $('#$playerId').bind(  $.jPlayer.event.play, function() {
            $('#$playerId').jPlayer('option', 'size', {
                            width: '$this->width',
                            height: '$this->height',
                    }); 
            //$('#{$this->htmlOptions['id']}').slideDown();
        } );

        //$('#$playerId').bind( $.jPlayer.event.ended, hideclip );
           ";
		parent::init ();
		$this->render ( 'player', array (
				'containerId' => $containerId,
				'playerId' => $playerId 
		) );
	}
}

?>
