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

function parnett($par, $nett) {
    $diff = $nett-$par;

    if ($diff >= 2) return 0;
    if ($diff == 1) return 1;
    if ($diff == 0) return 2;
    if ($diff == -1) return 3;
    if ($diff == -2) return 4;
    if ($diff == -3) return 5;
    if ($diff <= -4) return 6;
}

class ScoreTools {
    public static function playerScore(array $calcPlayers, $max = 4, $courses, $holes, $rules, $scoreRules = null) {
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

            $holeCount = 0;
            foreach($player->scores as $score) {
                $course = $player->group->course;
                if($score->course->id == $course->id) {
                    ++$holeCount;
                }
            }

            $holeNumbert = (($holeCount) + $player->holeOffset) % 18;
            if($holeNumbert == 0 && $holeCount > 0) $holeNumbert = 18;

            $course = $player->group->course->name;
            $newHoleNumber = ($holeNumbert+1)%18;
            if($newHoleNumber == 0 && $holeNumbert > 0) $newHoleNumber = 18;

            $total = 0;
            $day = 0;
            $roundIndex = 0;
            $rounds ['total'] ['player'] [$player->id] = array (
                'shots' => 0,
                'gross' => 0,
                'parnett' => 0,
                'nett' => 0,
                'par' => 0,
                'hole' => 0,
                'days' => array ()
            );
            $player_scores = $player->scores;
            $handicap = $player->handicap;
            $dayParnett = 0;
            $maxed = 0;
            $coursePar = 0;
            if ($d)
                CVarDumper::dump ( 'Player holes: ' . sizeof($player_scores) . "\n", 1, true );
            foreach ( $player_scores as $score ) {
              if ($d)
                  CVarDumper::dump ( 'Hole number: ' . $holeNumber+1 . "\n", 1, true );
                // if($d) CVarDumper::dump($score->courseRelation, 1,true);
                $course = filter ( $courses, 'id', $score->attributes['course']  );
                $hole = filter ( $holes, 'id', $score->attributes['hole'] );
                $gross = $score->shots;
                if ($d)
                    CVarDumper::dump ( 'Course stroke for hole: ' . $hole->stroke . "\n", 1, true );
                if ($d)
                    CVarDumper::dump ( 'Gross: ' . $score->shots . "\n", 1, true );
                if ($d)
                    CVarDumper::dump ( 'Player handicap: ' . $handicap . "\n", 1, true );

                $adjustment = 0;
                if ($handicap >= $hole->stroke) {
                    if ($d)
                        CVarDumper::dump ( "Handicap: {$handicap} is more or equal to stroke: {$hole->stroke}, nett - 1\n", 1, true );
                    -- $adjustment;
                }
                if (($handicap - 18) >= $hole->stroke) {
                    if ($d)
                        CVarDumper::dump ( "Handicap: {$handicap} is more or equal to 18 over stroke: {$hole->stroke}, nett - 1\n", 1, true );
                    -- $adjustment;
                }
                $nett = $gross + $adjustment;
                $par = $hole->par;
                if ($d)
                    CVarDumper::dump ( "Gross $gross vs par $par\n", 1, true );

                if ($gross > $par + 4) {
                    ++$maxed;
                }

                if ($d)
                    CVarDumper::dump ( "Handicap adjustment for nett:" . $adjustment."\n", 1, true );
                // find a matching score rule
                $parComparison = $nett - $par;

                if ($d)
                    CVarDumper::dump ( "Par comparison:" . $parComparison."\n", 1, true );

                if($scoreRules) {
                  $shots = 0;
                  foreach ( $scoreRules as $rule ) {
          					if ($parComparison == $rule->parComparison) {
          						$shots = $rule->point;
                    }
          				}
                } else {
                  $shots = $nett;
                }

                if ($d)
                    CVarDumper::dump ( "A score of $shots was calculated.\n", 1, true );
                $total += $shots;
                $day += $shots;
                $coursePar += $par;
                $nettTotal += $nett;
                $grossTotal += $gross;
                if ($d)
                    CVarDumper::dump ( "Player score is now: $total.\n", 3, true );
                if ($d)
                    CVarDumper::dump ( "\n", 1, true );

                $rounds ['player'] [$roundIndex] [$player->id] = array (
                    "course" => $course,
                    "handicap" => $handicap,
                    "name" => $player->name,
                    'gross' => $gross,
                    "adjustment" => $adjustment,
                    'nett' => $nett,
                    "par" => $par,
                    "parnett" => parnett($par, $nett),
                    'shots' => $shots,
                    "total" => $total
                );
                $rounds ['total'] ['player'] [$player->id] ['shots'] += $shots;
                $dayParnett += $rounds ['total'] ['player'] [$player->id] ['parnett'] += parnett($par, $nett);
                $rounds ['total'] ['player'] [$player->id] ['nett'] += $nett;
                $rounds ['total'] ['player'] [$player->id] ['gross'] += $gross;
                $rounds ['total'] ['player'] [$player->id] ['hole'] = $newHoleNumber;
                $rounds ['total'] ['player'] [$player->id] ['handicap'] = $handicap;
                if ($d)
                    CVarDumper::dump ( "Parnett for this round ".parnett($par, $nett)." from par of $par and nett of $nett", 1, true );

                if (++ $holeNumber == 18) {
                    $holeNumber = 0;
                    $rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
                    $days = $rounds ['total'] ['player'] [$player->id] ['days'];
                    if ($d)
                        CVarDumper::dump ( "Maxed: $maxed", 1, true );

                    if($player->lock != 'lock' && $maxed < 18) {
                        foreach($rules as $rule) {
                            $calc = $nettTotal - $coursePar;
                             if ($d)
                                CVarDumper::dump ( "Testing $calc against $rule->min and $rule->max.\n", 1, true );
                            if($calc >= $rule->min && $calc <= $rule->max) {
                                $handicap += $rule->point;
                                if ($d)
                                    CVarDumper::dump ( "Handicap adjusted to $handicap.\n", 1, true );
                            }
                        }
                    } else {
                        if ($d && $maxed >= 18)
                            CVarDumper::dump ( "DQ round, no handicap adjustment.", 1, true );
                    }
                    $maxed = 0;
                    $day = 0;
                    $coursePar = 0;
                }
                $roundIndex ++;
            }
        }
        if (sizeof ( $calcPlayers ) == 1) {
            //$rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
            $rounds ['total'] ['player'] = array (
                'shots' => $total,
                'nett' => $nettTotal,
                'parnett' => $rounds ['total'] ['player'] [$player->id] ['parnett'],
                'gross' => $grossTotal,
                'days' => $days,
                'hole' => $newHoleNumber,
                'handicap' => $handicap,
            );
        } else {
            if ($d)
                CVarDumper::dump ( "Processing team:\n", 3, true );
            $total = 0;
            $day = 0;
            $grossTotal = 0;
            $nettTotal = 0;
            $holeNumber = 0;
            $rounds ['total'] ['team'] = array (
                'shots' => 0,
                'days' => array ()
            );
            $dayPlayers = array();
            if ($d)
                CVarDumper::dump ( $rounds, 3, true );

            foreach ( $rounds ['player'] as $round ) {
                if ($d) {
                    CVarDumper::dump ( "Running round:\n", 3, true );
                    CVarDumper::dump ( $round, 1, true );
                }
                if ($min = 0)
                    $min = sizeof ( $round );
                if (sizeof ( $round ) < $min) {
                    if ($d)
                        CVarDumper::dump ( "Skipping partial round.\n", 3, true );
                    continue;
                }
                $shots = 0;
                $gross = 0;
                $nett = 0;
                $dayPlayers = array();
                $x = 0;
                foreach ( $round as $roundPlayer ) {
                  if ($d) {
                      CVarDumper::dump ( "Running round player:\n", 3, true );
                      CVarDumper::dump ( $roundPlayer, 1, true );
                  }
                  if ($d)
                    CVarDumper::dump ( "{$roundPlayer['name']} with {$roundPlayer['shots']}\n", 1, true );
                  if(!isset($dayPlayers[$x])) $dayPlayers[$x]=0;
                  $dayPlayers[$x] += $shots;
                  $x++;
                }
                $min = sizeof ( $round );
                if (++ $holeNumber == 18) {
                    $holeNumber = 0;
                    usort ( $dayPlayers, function ($a, $b) {
                        return $a  < $b ;
                    } );
                    $day = 0;
                    $x = 0;
                    foreach ( $dayPlayers as $pscore ) {
                      if (++ $x > $max)
                          break;
                      $day += $pscore;
                    }
                    $rounds ['total'] ['team'] ['days'] [] = $day;
                    $total += $day;
                    $dayPlayer = array();
                }
            }
            $rounds ['total'] ['team'] ['shots'] = $total;
        }
        unset ( $rounds ['player'] );
        // unset($rounds['team']);
        return $rounds;
    }

    static function processScores($max = 4) {
      $d = isset ( $_GET ['debug'] );
        if ($d)
            CVarDumper::dump ( "PRO\n\n-----------------------------------------\n", 1, true );

        $proGame = GSubmission::forForm ( "Game" )->find ( 'name = :name', array (
            ":name" => 'Professional'
        ) );
        $players = GSubmission::forForm ( 'Player' )->findAll ( 'game = :game', array (
            ":game" => $proGame->id
        ) );
        $teams = GSubmission::forForm ( 'Team' )->findAll ();
        $courses = GSubmission::forForm ( 'Course' )->findAll ();
        $holes = GSubmission::forForm ( 'Hole' )->findAll ();
        $rules = GSubmission::forForm ( 'Rules' )->findAll ();
        $scoreRules = GSubmission::forForm ( 'ScoreRules' )->findAll ();
        $data = array ();
        $x = 0;
        foreach ( $players as $player ) {
            $rounds = ScoreTools::playerScore ( array (
                $player
            ), 2, $courses, $holes, $rules, $scoreRules );
            $data [] = array (
                'player' => $player,
                'total' => $rounds ['total'] ['player']
            );
        }

        usort ( $data, function ($a, $b) {
            return $a ['total'] < $b ['total'];
        } );

        Yii::app()->cache->delete('proRankingData');
        Yii::app ()->cache->set ( 'proRankingData', $data );

        if ($d)
            CVarDumper::dump ( "FLIGHTING/SCORE\n\n-----------------------------------------\n", 1, true );
        $flightings = GSubmission::forForm ( 'Flighting' )->findAll ();
        $playerData = array ();
        $flightingRankings = array ();
        $x = 0;
        foreach($flightings as $key => $flighting) {
            $players = GSubmission::forForm ( 'Player' )->findAll ( 'flighting = :flighting', array (
                ":flighting" => $flighting->id
            ) );
            $flightingsData = [];
            foreach ( $players as $player ) {
                $rounds = ScoreTools::playerScore ( array (
                    $player
                ), 2,  $courses, $holes, $rules, $scoreRules );
                $flightingsData [] = $playerData [] = array (
                    'player' => $player,
                    'total' => $rounds ['total'] ['player']
                );
            }
            usort ( $flightingsData, function ($a, $b) {
                return $a ['total']['shots'] > $b ['total']['shots'];
            } );
            $flightingRankings[$key] = $flightingsData;
        }


        Yii::app()->cache->delete('flightingRankingData');
        Yii::app ()->cache->set ( 'flightingRankingData', $flightingRankings );
        Yii::app()->cache->delete('playerRankingData');
        Yii::app ()->cache->set ( 'playerRankingData', $playerData);

        if ($d)
            CVarDumper::dump ( "TEAM\n\n-----------------------------------------\n", 1, true );
        $data = array();
        foreach($teams as $team) {
            $rounds = ScoreTools::playerScore($team->players, $max, $courses, $holes, $rules, $scoreRules);

            //gc_collect_cycles();
            $players = array();
            foreach($rounds['total']['player'] as $playerId => $playerData) {
                $player = null;
                foreach($team->players as $tmpPlayer) {
                    if($playerId = $tmpPlayer->id) $players[$playerId] = array('player'=>$tmpPlayer, 'shots'=>$playerData);
                }
            }
            usort ( $data, function ($a, $b) {
                return $a ['shots'] < $b ['shots'];
            } );
            $data[] = array('team'=>$team, 'shots'=>$rounds['total']['team']['shots'], 'days'=>$rounds['total']['team']['days'], 'players'=>$players);
        }
        usort ( $data, function ($a, $b) {
            return $a ['shots'] < $b ['shots'];
        } );
        Yii::app()->cache->delete('teamRankingData');
        Yii::app ()->cache->set ( 'teamRankingData', $data );
    }
}

?>
