<?php

class GScoreRankingTeam extends GTag {

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
    	$d = isset($_GET['debug']);
        $teams = GSubmission::forForm('Team')->findAll();
        foreach($teams as $team) {
        	echo $team->name.":";
        	$rounds = ScoreTools::playerScore($team->players);
        	if($d) CVarDumper::dump($rounds, 4, true);
        	echo $rounds['total']['team'];
        	foreach($team->players as $player) {
	        	echo $player->name.':'.$rounds['total']['player'][$player->id];
        	}
        	echo "<br/>";
        }
        $data = array();
    }

}

?>
