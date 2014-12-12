<?php

class ScoreTools {
    public static function playerScore(GSubmission $player) {
        $d = isset($_GET['debug']);
        $holeNumber = 0;
        if($d) CVarDumper::dump("Processing player {$player->name}\n", 1, true);
        $ret = 0;
        foreach($player->scores as $score) {
            ++$holeNumber;
            //if($d) CVarDumper::dump($score->courseRelation, 1,true);
            $course = $score->course;
        	$hole = $score->course->holes[$holeNumber-1];
        	$gross = $score->shots;
        	if($d) CVarDumper::dump('Record number: '.$holeNumber."\n", 1, true);
        	if($d) CVarDumper::dump('Course stroke for hole: '.$hole->stroke."\n", 1,true);
        	if($d) CVarDumper::dump('Gross: '.$score->shots."\n", 1,true);
        	if($d) CVarDumper::dump('Player handicap: '.$player->handicap."\n", 1,true);
        	$adjustment = 0;
        	if($player->handicap >= $hole->stroke) {
        		if($d) CVarDumper::dump("Handicap: {$player->handicap} is more or equal to stroke: {$hole->stroke}, nett - 1\n", 1, true);
        		--$adjustment;
        	}
        	if(($player->handicap-18) >= $hole->stroke) {
        		if($d) CVarDumper::dump("Handicap: {$player->handicap} is more or equal to 18 over stroke: {$hole->stroke}, nett - 1\n", 1, true);
        		--$adjustment;
        	}
        	$nett = $gross - $adjustment;
        	$par = $hole->par;
        	
        	$parComparison = $nett - $par;
        	
        	
        	if($d) CVarDumper::dump("Par $par vs Nett $nett comparison:$parComparison\n", 1,true);
        	//find a matching score rule
        	foreach($score->rules as $rule) {
        		if($parComparison == $rule->parComparison) $points = $rule->point;
        	}
        	if($d) CVarDumper::dump("A score of $points was loaded for this par comparison.\n", 1,true);
        	$ret += $points;
        	if($d) CVarDumper::dump("Player score is now: $ret.\n", 3,true);
        	if($d) CVarDumper::dump("\n", 1,true);
        	if($holeNumber == 18) $holeNumber = 0;
        }
        return $ret;
    }
}

?>
