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
			return $a ['total'] < $b ['total'];
		} );

		echo "<table class='table'>";
		echo "<tr>";
		echo "<th class='th1'>POS</th>";
		echo "<th class='th2'>Player</th>";
		echo "<th class='th4'>Gross</th>";
		echo "<th class='th4'>Nett</th>";
		echo "<th class='th4'>Day 1</th>";
		echo "<th class='th4'>Day 2</th>";
		echo "<th class='th4'>Day 3</th>";
		echo "<th class='th4'>Day 4</th>";
		echo "<th class='th4'>Day 5</th>";
		echo "<th class='th4'>Strokes</th>";
		echo "</tr>";
		$pos = 0;
		$lastTotal = 0;
		foreach ( $data as $playerData ) {
			$player = $playerData['player'];
			$total = $playerData['total']['strokes'];
			echo "<tr>";
			echo "<td>";
			++ $pos;
			if($lastTotal != $playerData['total']) echo $pos;
			$lastTotal = $playerData['total'];
			echo "</td>";
			echo "<td>";
			if (isset ( $player->country )) {
				echo CHtml::image ( str_replace ( 'protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission/', $player->country->flag ) );
			}
			echo $player ['name'];
			echo "</td>";
			echo CHtml::tag ( 'td', array (), $playerData['total']['gross'] );
			echo CHtml::tag ( 'td', array (), $playerData['total']['nett'] );
			echo CHtml::tag ( 'td', array (), isset($playerData['total']['days'][0])?$playerData['total']['days'][0]:"" );
			echo CHtml::tag ( 'td', array (), isset($playerData['total']['days'][1])?$playerData['total']['days'][1]:"" );
			echo CHtml::tag ( 'td', array (), isset($playerData['total']['days'][2])?$playerData['total']['days'][2]:"" );
			echo CHtml::tag ( 'td', array (), isset($playerData['total']['days'][3])?$playerData['total']['days'][3]:"" );
			echo CHtml::tag ( 'td', array (), isset($playerData['total']['days'][4])?$playerData['total']['days'][4]:"" );
			echo CHtml::tag ( 'td', array (), $total );
			echo "</tr>";
		}
		echo "</tr>";
		echo "</table>";

	}

}

?>
