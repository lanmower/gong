<?php

/*
 * !!!CLEAR OLD SCORES!!!
 * DELETE FROM scores_score
 * WHERE NOT EXISTS(SELECT NULL
 * FROM scores_player f
 * WHERE f.id = player)
 *
 */
function filter($array, $attr, $compare) {
	foreach ( $array as $obj )
		if ($obj->attributes [ $attr ] == $compare)
			return $obj;
}
function filter_all($array, $attr, $compare) {
	return array_filter ( $array, function ($obj) use(&$attr, &$compare) {
			return $obj->attributes [ $attr ] == $compare;
	} );
}
class ScoreTools {
	public static function playerScore(array $calcPlayers, $max = 2, $players, $teams, $scores, $courses, $holes, $rules) {
		$d = isset ( $_GET ['debug'] );
		$rounds = array (
				'player' => array (),
				'team' => array (),
				'total' => array (
						'player' => array (),
						'team' => 0 
				) 
		);
		$total = 0;
		$nettTotal = 0;
		$grossTotal = 0;
		$days = array ();
		$holeNumber = 0;
		foreach ( $calcPlayers as $player ) {
			$d = isset ( $_GET ['debug'] );
			if ($d)
				CVarDumper::dump ( "Processing player {$player->name}\n", 1, true );
			$total = 0;
			$day = 0;
			$roundIndex = 0;
			$rounds ['total'] ['player'] [$player->id] = array (
					'strokes' => 0,
					'gross' => 0,
					'nett' => 0,
					'days' => array () 
			);
			$player_scores = filter_all ( $scores, 'player', $player->id );

			foreach ( $player_scores as $score ) {
				// if($d) CVarDumper::dump($score->courseRelation, 1,true);
				$course = filter ( $courses, 'id', $score->attributes['course']  );
				$hole = filter ( $holes, 'id', $score->attributes['hole'] );
				$gross = $score->shots;
				if ($d)
					CVarDumper::dump ( 'Course stroke for hole: ' . $hole->stroke . "\n", 1, true );
				if ($d)
					CVarDumper::dump ( 'Gross: ' . $score->shots . "\n", 1, true );
				if ($d)
					CVarDumper::dump ( 'Player handicap: ' . $player->handicap . "\n", 1, true );
				$adjustment = 0;
				if ($player->handicap >= $hole->stroke) {
					if ($d)
						CVarDumper::dump ( "Handicap: {$player->handicap} is more or equal to stroke: {$hole->stroke}, nett - 1\n", 1, true );
					-- $adjustment;
				}
				if (($player->handicap - 18) >= $hole->stroke) {
					if ($d)
						CVarDumper::dump ( "Handicap: {$player->handicap} is more or equal to 18 over stroke: {$hole->stroke}, nett - 1\n", 1, true );
					-- $adjustment;
				}
				$nett = $gross + $adjustment;
				$par = $hole->par;
				
				$parComparison = $nett - $par;
				if ($d)
					CVarDumper::dump ( "Gross adjustment:" . $adjustment, 1, true );
				if ($d)
					CVarDumper::dump ( "Par $par vs Nett $nett comparison:$parComparison\n", 1, true );
					// find a matching score rule
				$strokes = 0;
				foreach ( $rules as $rule ) {
					if ($parComparison == $rule->parComparison)
						$strokes = $rule->point;
				}
				if ($d)
					CVarDumper::dump ( "A score of $strokes was loaded for this par comparison.\n", 1, true );
				$total += $strokes;
				$day += $strokes;
				$nettTotal += $nett;
				$grossTotal += $gross;
				if ($d)
					CVarDumper::dump ( "Player score is now: $total.\n", 3, true );
				if ($d)
					CVarDumper::dump ( "\n", 1, true );
				
				$rounds ['player'] [$roundIndex] [$player->id] = array (
						"course" => $course,
						"handicap" => $player->handicap,
						"name" => $player->name,
						'gross' => $gross,
						"adjustment" => $adjustment,
						'nett' => $nett,
						"par" => $par,
						'parComparison' => $parComparison,
						'strokes' => $strokes,
						"total" => $total 
				);
				$rounds ['total'] ['player'] [$player->id] ['strokes'] += $strokes;
				$rounds ['total'] ['player'] [$player->id] ['nett'] += $nett;
				$rounds ['total'] ['player'] [$player->id] ['gross'] += $gross;
				if (++ $holeNumber == 18) {
					$holeNumber = 0;
					$rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
					$days = $rounds ['total'] ['player'] [$player->id] ['days'];
					$day = 0;
				}
				$roundIndex ++;
			}
		}
		if (sizeof ( $calcPlayers ) == 1) {
			$rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
			$rounds ['total'] ['player'] = array (
					'strokes' => $total,
					'nett' => $nettTotal,
					'gross' => $grossTotal,
					'days' => $days 
			);
		} else {
			if ($d)
				CVarDumper::dump ( "Processing team:\n", 3, true );
			$total = 0;
			$day = 0;
			$grossTotal = 0;
			$nettTotal = 0;
			$min = 0;
			$holeNumber = 0;
			$rounds ['total'] ['team'] = array (
					'strokes' => 0,
					'days' => array () 
			);
			foreach ( $rounds ['player'] as $round ) {
				if ($min = 0)
					$min = sizeof ( $round );
				if (sizeof ( $round ) < $min) {
					if ($d)
						CVarDumper::dump ( "Skipping partial round.\n", 3, true );
					continue;
				}
				if ($d) {
					CVarDumper::dump ( "Sorting team round:\n", 3, true );
				}
				usort ( $round, function ($a, $b) {
					return $a ['strokes'] < $b ['strokes'];
				} );
				$strokes = 0;
				$gross = 0;
				$nett = 0;
				$x = 0;
				if ($d) {
					foreach ( $round as $roundPlayer ) {
						CVarDumper::dump ( "{$roundPlayer['name']} with {$roundPlayer['strokes']}\n", 1, true );
					}
				}
				foreach ( $round as $roundPlayer ) {
					if (++ $x > $max)
						break;
					$strokes = $roundPlayer ['strokes'];
					$total += $strokes;
					$day += $strokes;
					$gross = $roundPlayer ['gross'];
					$nett = $roundPlayer ['nett'];
					$grossTotal += $gross;
					$nettTotal += $nett;
					if ($d)
						CVarDumper::dump ( "Added: {$roundPlayer['strokes']} from player {$roundPlayer['name']}, new team total: $total.\n", 3, true );
				}
				/*
				 * $rounds['team'][] = array(
				 * 'gross' =>$gross,
				 * 'nett'=>$nett,
				 * 'strokes'=>$total
				 * );
				 */
				$min = sizeof ( $round );
				if (++ $holeNumber == 18) {
					$holeNumber = 0;
					$rounds ['total'] ['team'] ['days'] [] = $day;
					$day = 0;
				}
			}
			$rounds ['total'] ['team'] ['strokes'] = $total;
			$rounds ['total'] ['team'] ['days'] [] = $day;
		}
		unset ( $rounds ['player'] );
		// unset($rounds['team']);
		return $rounds;
	}
}

?>
