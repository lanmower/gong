<?php

class GScoreRankingPro extends GTag {

    public function init() {
        $this->script = '
						setTimeout("location.reload(true);", 240000);
					';
        if (isset($_GET ['scroll']))
            $this->script .= '$("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);
  var scrolltopbottom =  setInterval(function(){
    $("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);

    },240000);
';
        parent::init();
    }

    public function run() {
        $players = GSubmission::forForm('Player')->findAll();
        foreach($players as $player) {
        	echo $player->name.":";
        	$rounds = ScoreTools::playerScore(array($player));
        	echo $rounds['total']['player'];
        }
        $data = array();
    }

}

?>
