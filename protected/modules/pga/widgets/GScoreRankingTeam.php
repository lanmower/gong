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
			GSubmission::clearCache();
			//gc_collect_cycles();
			$players = array();
			foreach($rounds['total']['player'] as $playerId => $playerData) {
				$player = null;
				foreach($team->players as $tmpPlayer) {
					if($playerId = $tmpPlayer->id) $players[$playerId] = array('player'=>$tmpPlayer, 'strokes'=>$playerData);
				}
			}
			usort ( $data, function ($a, $b) {
				return $a ['strokes'] < $b ['strokes'];
			} );
			$data[] = array('team'=>$team, 'strokes'=>$rounds['total']['team']['strokes'], 'days'=>$rounds['total']['team']['days'], 'players'=>$players);
		}
		usort ( $data, function ($a, $b) {
			return $a ['strokes'] < $b ['strokes'];
		} );

		echo "<table class='table'>";
		echo "<tr>";
		echo "<th>POS</th>";
		echo "<th>Team</th>";
		echo "<th>Players</th>";
		echo "<th>Day 1</th>";
		echo "<th>Day 2</th>";
		echo "<th>Day 3</th>";
		echo "<th>Day 4</th>";
		echo "<th>Day 5</th>";
		echo "<th>Score</th>";
		echo "</tr>";
		$pos = 0;
		$lastTotal = 0;
		foreach ( $data as $team ) {
			if ($team ['strokes'] == 0)
			continue;
			echo "<tr>";
			echo "<td>";
			++ $pos;
			if($lastTotal != $team['strokes']) echo $pos;
			$lastTotal = $team['strokes'];
			echo "</td>";
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
			echo CHtml::tag ( 'td', array (), isset($team['days'][0])?$team['days'][0]:"" );
			echo CHtml::tag ( 'td', array (), isset($team['days'][1])?$team['days'][1]:"" );
			echo CHtml::tag ( 'td', array (), isset($team['days'][2])?$team['days'][2]:"" );
			echo CHtml::tag ( 'td', array (), isset($team['days'][3])?$team['days'][3]:"" );
			echo CHtml::tag ( 'td', array (), isset($team['days'][4])?$team['days'][4]:"" );
			echo "</td>";
			echo CHtml::tag ( 'td', array (), $team['strokes'] );
		}
		echo "</tr>";
		echo "</table>";

	}

}

?>
