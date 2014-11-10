<?php

class GScoreRankingTeam extends GTag {

    public function init() {
        $this->script = '
            setTimeout("location.reload(true);", 240000);
					';
        if (isset($_GET['scroll']))
            $this->script .= '$("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);
  var scrolltopbottom =  setInterval(function(){
         // 4000 - it will take 4 secound in total from the top of the page to the bottom
    $("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);

    },240000);
';
        parent::init();
    }

    public function run() {
        //load countries (flags), assosiated by id
        $flagsData = GSubmission::forForm('Country')->findAll();
        $flags = array();
        foreach ($flagsData as $flagData) {
            $flags[$flagData->id] = $flagData;
        }
        //load courses assosiated by id
        $coursesData = GSubmission::forForm('Course')->findAll();
        $courses = array();
        foreach ($coursesData as $courseData) {
            $courses[$courseData->id] = array('name'=>$courseData->name, 'pars'=>array());
        }
        //load holes (pars), assosiated by hole number, into courses
        $parsData = GSubmission::forForm('Par')->findAll();
        foreach ($parsData as $parData) {
            $courses[$parData->course]['pars'][$parData->hole] = $parData;
        }
        //load players assosiated by id
        $playersData = GSubmission::forForm('Player')->findAll();
        $players = array();
        foreach ($playersData as $playerData) {
            $players[$playerData->id] = array('player'=>$playerData, 'scores'=>array(), 'scorecards'=>array());
        }
        //load scores, assosiated by id, into players
        $scoresData = GSubmission::forForm('Score')->findAll();
        $scores = array();
        foreach ($scoresData as $scoreData) {
            $players[$scoreData->playerId]['scores'][$scoreData->id] = $scoreData;
        }
        //generate score cards for each player
        foreach ($players as $player) {
            if(!isset($player['player'])) continue;
            $scoreCards = array();
            $i = 0;
            $handicap = $player['player']->handicap;
            $scoreCard = array();
            $cards = 0;
            foreach($player['scores'] as $score) {
                if($score->score > 0) {
                    $scoreCard[$score->hole] = $score->score;
                    $course = $score->course;
                    if(++$i == 18) {
                        $grossTotal = 0;
                        $coursePar = 0;
                        for($i = 1; $i <= 18; $i++) {
                            ++$cards;
                            $grossTotal += $scoreCard[$i];
                            $coursePar += $courses[$course]['pars'][$i]->par;
                            $nettTotal = $grossTotal - $handicap;
                        }
                        $scoreCard['nettTotal'] = $nettTotal;
                        $scoreCard['grossTotal'] = $grossTotal;
                        $scoreCard['handicap'] = $player['player']->handicap;
                        $scoreCard['player'] = $player['player']->id;
                        $handicap = $player['player']->handicap + GScoreForm::calculateHandicap($nettTotal, $coursePar);
                        $scoreCards[] = $scoreCard;
                        $scoreCard = array();
                        $i = 0;
                    }
                }
            }
            if(isset($player['player'])) {
                $players[$player['player']->id]['scorecards'] = $scoreCards;
            }
        }
        
        
        //load teams assosiated by id, adding team players to array
        $teamsData = GSubmission::forForm('Team')->findAll(array('order' => 'name'));
        $teams = array();
        foreach ($teamsData as $teamData) {
            $teams[$teamData->id] = array('name'=>$teamData->name, 'players'=>array(), 'nettTotal' => 0, 'grossTotal' => 0, 'scorecards'=>array());
            foreach($players as $player) {
                if(!isset($player['player'])) {
                    continue;
                }
                if($player['player']->team == $teamData->id) {
                    $teams[$teamData->id]['players'][] = $player;
                }
            }
        }
        $done = false;
        $i = 0;
        while(!$done) {
            foreach($teams as $team) {
                foreach($team['players'] as $player) {
                    if(!isset($player['scorecards'][$i])) {
                        $done = true;
                        break;
                    }
                }
            }
            $i++;
        }
        $done = false;
        $i = 0;
        $maxRounds = $i;
        echo $i; echo $maxRounds;
        while(!$done && $i <= $maxRounds) {
            echo 'round';
            foreach($teams as $teamId=>$team) {
                //sort players by the currently selected scorecards nett
                usort($team['players'], function($a, $b) use ($i) {
                    return $a['scorecards'][$i]['nettTotal'] > $b['scorecards'][$i]['nettTotal'];
                });
                //record first four players
                $playerIndex = 0;
                foreach($team['players'] as $player) {
                    if($playerIndex++ > 4) {
                        break;
                    }
                    $teams[$teamId]['grossTotal'] += $player['scorecards'][$i]['grossTotal'];
                    $teams[$teamId]['nettTotal'] += $player['scorecards'][$i]['nettTotal'];
                    $teams[$teamId]['scorecards'][] = $player['scorecards'][$i];
                }
            }
            ++$i;
        }
        usort($teams, function($a, $b) {
            return $a['nettTotal'] > $b['nettTotal'];
        });
        
        
        $dataProvider = new CArrayDataProvider($teams, array('pagination' => array(
                'pageSize' => 999,
        )));

        echo "<table class='table'>";
        echo"<tr>";
        echo "<th>POS</th>";
        echo "<th>Team</th>";
        echo "<th>Players</th>";
        echo "<th>Gross Total</th>";
        echo "<th>Nett Total</th>";
        echo"</tr>";
        $pos = 0;
        foreach ($dataProvider->getData() as $teamId => $team) {
            if($team['grossTotal'] == 0) continue;
            echo "<tr>";
            echo "<td>" . ++$pos . "</td>";
            echo "<td>" . $team['name'] . "</td>";
            echo "<td>";
            foreach ($team['players'] as $playerId => $player) {
                echo CHtml::openTag('div', array('class' => 'scorelistplayer'));
                if (isset($flags[$player['player']->country])) {
                    echo CHtml::image(str_replace('protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission//', $flags[$player['player']->country]->flag));
                }
                echo $player['player']->name;
                echo CHtml::closeTag('div');
            }
            echo "</td>";
            echo CHtml::tag('td', array(), $team['grossTotal']);
            echo CHtml::tag('td', array(), $team['nettTotal']);
        }
        echo "</tr>";
        echo "</table>";
        parent::run();
    }

}

?>
