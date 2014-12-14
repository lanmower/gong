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
		$proGame = GSubmission::forForm("Game")->find('name = :name', array(":name"=>'Professional'));
		$players = GSubmission::forForm('Player')->findAll('game = :game', array(":game"=>$proGame->id));
		$data = array();
		foreach($players as $player) {
			$rounds = ScoreTools::playerScore(array($player));
			$data[] = array('player'=>$player, 'total'=>$rounds['total']['player']);
		}

		usort ( $data, function ($a, $b) {
			return $a ['total'] > $b ['total'];
		} );

		echo "<table class='table'>";
		echo "<tr>";
		echo "<th class='th1'>Position</th>";
		echo "<th class='th2'>Player</th>";
		echo "<th class='th4'>Score</th>";
		echo "</tr>";
		$pos = 0;
		foreach ( $data as $playerData ) {
			$player = $playerData['player'];
			$total = $playerData['total'];
			echo "<tr>";
			echo "<td>" . ++ $pos . "</td>";
			echo "<td>";
			if (isset ( $player->country )) {
				echo CHtml::image ( str_replace ( 'protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission/', $player->country->flag ) );
			}
			echo $player ['name'];
			echo "</td>";
			echo CHtml::tag ( 'td', array (), $total );

			echo "</tr>";
		}
		echo "</tr>";
		echo "</table>";

	}

}

?>
