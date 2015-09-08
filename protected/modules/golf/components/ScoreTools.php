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
    public static function playerScore(array $calcPlayers, $max = 2, $courses, $holes, $rules) {
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
                'nett' => 0,
                'par' => 0,
                'hole' => 0,
                'days' => array ()
            );
            $player_scores = $player->scores;
            $handicap = $player->handicap;
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
                    CVarDumper::dump ( "Handicap adjustment for nett:" . $adjustment."\n", 1, true );
                // find a matching score rule
                $shots = $nett;

                if ($d)
                    CVarDumper::dump ( "A score of $shots was calculated.\n", 1, true );
                $total += $shots;
                $day += $shots;
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
                    'shots' => $shots,
                    "total" => $total
                );
                $rounds ['total'] ['player'] [$player->id] ['shots'] += $shots;
                $rounds ['total'] ['player'] [$player->id] ['nett'] += $nett;
                $rounds ['total'] ['player'] [$player->id] ['gross'] += $gross;
                $rounds ['total'] ['player'] [$player->id] ['hole'] == $newHoleNumber;
                //$rounds ['total'] ['player'] [$player->id] ['handicap'] == $handicap;
                if (++ $holeNumber == 18) {
                    $holeNumber = 0;
                    $rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
                    $days = $rounds ['total'] ['player'] [$player->id] ['days'];
                    foreach($rules as $rule) {
                        if ($d)
                            CVarDumper::dump ( "Testing $day against $rule->min and $rule->max.\n", 1, true );
                        if($day >= $rule->min && $day <= $rule->max) {
                            $handicap += $rule->point;
                            if ($d)
                                CVarDumper::dump ( "Handicap adjusted to $handicap.\n", 1, true );
                        }
                    }
                    $day = 0;
                }
                $roundIndex ++;
            }
        }
        if (sizeof ( $calcPlayers ) == 1) {
            //$rounds ['total'] ['player'] [$player->id] ['days'] [] = $day;
            $rounds ['total'] ['player'] = array (
                'shots' => $total,
                'nett' => $nettTotal,
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
                    return $a ['shots'] < $b ['shots'];
                } );
                $shots = 0;
                $gross = 0;
                $nett = 0;
                $x = 0;
                if ($d) {
                    foreach ( $round as $roundPlayer ) {
                        CVarDumper::dump ( "{$roundPlayer['name']} with {$roundPlayer['shots']}\n", 1, true );
                    }
                }
                foreach ( $round as $roundPlayer ) {
                    if (++ $x > $max)
                        break;
                    $shots = $roundPlayer ['shots'];
                    $total += $shots;
                    $day += $shots;
                    $gross = $roundPlayer ['gross'];
                    $nett = $roundPlayer ['nett'];
                    $grossTotal += $gross;
                    $nettTotal += $nett;
                    if ($d)
                        CVarDumper::dump ( "Added: {$roundPlayer['shots']} from player {$roundPlayer['name']}, new team total: $total.\n", 3, true );
                }
                /*
                 * $rounds['team'][] = array(
                 * 'gross' =>$gross,
                 * 'nett'=>$nett,
                 * 'shots'=>$total
                 * );
                 */
                $min = sizeof ( $round );
                if (++ $holeNumber == 18) {
                    $holeNumber = 0;
                    $rounds ['total'] ['team'] ['days'] [] = $day;
                    $day = 0;
                }
            }
            $rounds ['total'] ['team'] ['shots'] = $total;
            $rounds ['total'] ['team'] ['days'] [] = $day;
        }
        unset ( $rounds ['player'] );
        // unset($rounds['team']);
        return $rounds;
    }

    static function processScores() {
        $proGame = GSubmission::forForm ( "Game" )->find ( 'name = :name', array (
            ":name" => 'Professional'
        ) );
        $players = GSubmission::forForm ( 'Player' )->findAll ( 'game = :game', array (
            ":game" => $proGame->id
        ) );
        $teams = GSubmission::forForm ( 'Team' )->findAll ();
        $scores = GSubmission::forForm ( 'Score' )->findAll ();
        $courses = GSubmission::forForm ( 'Course' )->findAll ();
        $holes = GSubmission::forForm ( 'Hole' )->findAll ();
        $rules = GSubmission::forForm ( 'Rules' )->findAll ();
        $data = array ();
        $x = 0;
        foreach ( $players as $player ) {
            $rounds = ScoreTools::playerScore ( array (
                $player
            ), 2,  $scores, $courses, $holes, $rules );
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
        $data = array();
        foreach($teams as $team) {
            $rounds = ScoreTools::playerScore($team->players, 2, $scores, $courses, $holes, $rules);

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