<?php
class GScoreRankingFlighting extends GTag {
	public function init() {
		$this->script = '
						setTimeout("location.reload(true);", 240000);
					';
		if (isset ( $_GET ['scroll'] ))
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
		parent::init ();
	}
	public function run() {
		$flightings = GSubmission::forForm ( 'Flighting' )->findAll ();
		$players = GSubmission::forForm ( 'Player' )->findAll ( array (
				'order' => 'flighting' 
		) );
		$scores = GSubmission::forForm ( 'Score' )->findAll ();
		$flags = GSubmission::forForm ( 'Country' )->findAll ();
		$data = array ();
		foreach ( $flightings as $flighting ) {
			$flightingData = array ();
			$flightingData ['players'] = array ();
			$flightingData ['name'] = $flighting->name;
			foreach ( $players as $player ) {
				if ($player->flighting == $flighting->id) {
					$playerData = array ();
					$nettTotal = 0;
					$grossTotal = 0;
					foreach ( $scores as $score ) {
						if ($score->playerId == $player->id)
							$nettTotal += $score->score;
						if ($score->playerId == $player->id && $score->score > 0)
							$grossTotal += $score->score;
					}
					
					$playerData ['id'] = $player->id;
					$playerData ['grossScore'] = $grossTotal;
					$playerData ['nettScore'] = $nettTotal;
					if ($playerData ['grossScore'] < 0)
						$playerData ['grossScore'] = 0;
					if ($playerData ['nettScore'] < 0)
						$playerData ['nettScore'] = 0;
					
					$playerData ['name'] = $player->name;
					foreach ( $flags as $flag ) {
						if ($flag->id == $player->country)
							$playerData ['flag'] = $flag->flag;
					}
					
					$flightingData ['players'] [$player->id] = $playerData;
				}
			}
			if (! empty ( $flightingData ['players'] ))
				$data [$flighting->id] = $flightingData;
		}
		
		$dataProvider = new CArrayDataProvider ( $data, array (
				'sort' => array (
						'attributes' => array (
								'players' => array (
										'asc' => '' 
								) 
						) 
				),
				'pagination' => array (
						'pageSize' => 999 
				) 
		) );
		
		foreach ( $dataProvider->getData () as $id => $flighting ) {
			$pos = 0;
			usort ( $flighting ['players'], function ($a, $b) {
				return $a ['nettScore'] > $b ['nettScore'];
			} );
			echo "<h2>Flight " . $flighting ['name'] . "</h2>";
			echo "<table class='table'>";
			echo "<tr>";
			echo "<th class='th1'>POS</th>";
			echo "<th class='th2'>Players</th>";
			echo "<th class='th3'>Gross total</th>";
			echo "<th class='th4'>Nett total</th>";
			echo "</tr>";
			foreach ( $flighting ['players'] as $id => $player ) {
				echo "<tr>";
				echo "<td>" . ++ $pos . "</td>";
				echo "<td>";
				if (isset ( $player ['flag'] )) {
					echo CHtml::image ( str_replace ( 'protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission/', $player ['flag'] ) );
				}
				echo $player ['name'];
				echo "</td>";
				echo CHtml::tag ( 'td', array (), $player ['grossScore'] );
				echo CHtml::tag ( 'td', array (), $player ['nettScore'] );
				
				echo "</tr>";
			}
			echo "</tr>";
			echo "</table>";
		}
		parent::run ();
	}
}

?>
