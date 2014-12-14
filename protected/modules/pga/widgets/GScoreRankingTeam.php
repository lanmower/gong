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
    	$data = array();
        foreach($teams as $team) {
        	$rounds = ScoreTools::playerScore($team->players);
        	$players = array();
        	foreach($rounds['total']['player'] as $playerId => $playerData) {
				$player = null;
				foreach($team->players as $tmpPlayer) {
					if($playerId = $tmpPlayer->id) $players[$playerId] = array('player'=>$tmpPlayer, 'total'=>$playerData);
				}
			}
			usort ( $data, function ($a, $b) {
				return $a ['total'] > $b ['total'];
			} );
			$data[] = array('team'=>$team, 'total'=>$rounds['total']['team'], 'players'=>$players);
        }
		usort ( $data, function ($a, $b) {
			return $a ['total'] > $b ['total'];
		} );
		
		echo "<table class='table'>";
		echo "<tr>";
		echo "<th>POS</th>";
		echo "<th>Team</th>";
		echo "<th>Players</th>";
		echo "<th>Total</th>";
		echo "</tr>";
		$pos = 0;
		foreach ( $data as $team ) {
			if ($team ['total'] == 0)
				continue;
			echo "<tr>";
			echo "<td>" . ++ $pos . "</td>";
			echo "<td>" . $team ['team']->name . "</td>";
			echo "<td>";
			foreach ( $team ['players'] as $player ) {
				echo CHtml::openTag ( 'div', array (
						'class' => 'scorelistplayer' 
				) );
				if (isset ( $player->country )) {
					echo CHtml::image ( str_replace ( 'protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission//', $player->country->flag ) );
				}
				echo $player['player']->name;
				echo CHtml::closeTag ( 'div' );
			}
			echo "</td>";
			echo CHtml::tag ( 'td', array (), $team ['total'] );
		}
		echo "</tr>";
		echo "</table>";
				
    }

}

?>
