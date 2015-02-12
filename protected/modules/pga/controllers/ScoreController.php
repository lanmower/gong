<?php
class ScoreController extends GController {
	public function actionBatch($team) {
		if(isset($_GET['players'])) $players = $_GET['players'];
		if(isset($_GET['team'])) $team = $_GET['team'];
		foreach (Yii::app()->log->routes as $route)
		{
			if ($route instanceof CWebLogRoute ||  $route instanceof YiiDebugToolbarRoute)
			{
				$route->enabled = false;
			}
		}
		$team = GSubmission::forForm('Team')->findByPk($team);
		$json['status'] = 'None saved';
		$json['message'] = '';
		$index = 0;
		foreach($players as $playerId) {
			foreach($team->players as $player) {
				$holeCount = 0;
				if($player->id == $playerId) {
					$course = $player->group->course;
					$score = GSubmission::forForm('Score');
					$score->shots = $_GET['shots'][$index];
					$score->player = $player->id;
					$score->course = $player->group->course->id;
					foreach($player->scores as $tscore) {
						if($tscore->course->id == $player->group->course->id) {
							++$holeCount;
						}
					}

					$holeNumber = (($holeCount) + $player->holeOffset) % 18;
					if($holeNumber == 0 && $holeCount > 0) $holeNumber = 18;
						
					$newHoleNumber = ($holeNumber+1)%18;
					if($newHoleNumber == 0 && $holeNumber > 0) $newHoleNumber = 18;
					
					foreach($player->group->course->holes as $tHole) {
						if($tHole->number == $newHoleNumber) $score->hole = $tHole->id;
					}
					if($holeCount < 18) {
						if($score->save()) {
							$json['status'] = 'Scores saved';
							if($holeCount+1 == 18) $json['message'] .= 'Course: '.$course->name.' completed for player: '.$player->name;
							else $json['message'] .= $score->shots.' shots have been logged for: '.$player->name.' on course: '.$player->group->course->name.', hole: '.($newHoleNumber);
						}
					} else {
						$json['message'] .= 'Score has not been logged for: '.$player->name.' course '.$course->name.' is complete for this player';
					}
				}
			}
			++$index;
		}
			$team = GSubmission::forForm('Team')->findByPk($_GET['team']);
			if(isset($team)) {
				$proGame = GSubmission::forForm("Game")->find('name = :name', array(":name"=>'Professional'));
				$players = GSubmission::forForm('Player')->findAll('team = :team', array(":team"=>$team->id)); //since players belong to a team, include only players from this team
				$teams = GSubmission::forForm('Team')->findAll('id = :team', array(":team"=>$team->id)); //only include this team
				$playerIds = array();
				foreach($team->players as $player) {
					$playerIds[] = $player->id;
				}
				//die(CVarDumper::dump(implode(' OR ', $playerIds)));
				$scores = GSubmission::forForm('Score')->findAll('player = "'.implode('" OR player = "', $playerIds).'"');//ByAttributes(array('id'=>implode(' OR ', $playerIds))); //only include scores from the teams players
				$countries = GSubmission::forForm('Country')->findAll();
				$groups = GSubmission::forForm('Group')->findAll();
				$courses = GSubmission::forForm('Course')->findAll();
				$holes = GSubmission::forForm('Hole')->findAll();
				$rules = GSubmission::forForm('Rules')->findAll();

				$rounds = ScoreTools::playerScore($team->players, $max=2, $players, $teams, $scores, $courses, $holes, $rules);
				if(!isset($json['status']))$json['status']="Select a player";
				foreach($team->players as $player) {
					$holeCount = 0;
					foreach($player->scores as $score) {
						$course = $player->group->course;
						if($score->course->id == $course->id) {
							++$holeCount;
						}
					}

					$holeNumber = (($holeCount) + $player->holeOffset) % 18;
					if($holeNumber == 0 && $holeCount > 0) $holeNumber = 18;

					$course = $player->group->course->name;
					$newHoleNumber = ($holeNumber+1)%18;
					if($newHoleNumber == 0 && $holeNumber > 0) $newHoleNumber = 18;

					if($holeCount == 18) $holeText = "complete";
					else {
						foreach($player->group->course->holes as $hole) {
							if($hole->number == $newHoleNumber) $holeText = "{$hole->number} (Par {$hole->par}, stroke {$hole->stroke})";
						}
					}
					$strokes = 0;
					$nett = 0;
					$gross = 0;
					if(isset($rounds['total']['player'][$player->id])) {
					$strokes = $rounds['total']['player'][$player->id]['strokes'];
					$nett = $rounds['total']['player'][$player->id]['nett'];
					$gross = $rounds['total']['player'][$player->id]['gross'];
					}
					$json['players'][$player->id] = array('course'=>$course, 'id'=>$player->id, 'name'=>$player->name, 'hole'=>$holeText, 'total'=>$strokes, 'nett'=>$nett, 'gross'=>$gross);
				}
			}
		echo CJavaScript::jsonEncode ( $json );
	}

	public function actionIndex() {
		$json = array('players'=>array());
		foreach (Yii::app()->log->routes as $route)
		{
			if ($route instanceof CWebLogRoute ||  $route instanceof YiiDebugToolbarRoute)
			{
				$route->enabled = false;
			}
		}
		if(isset($_GET['team'])) {
			if(isset($_GET['player'])) {
				$player = GSubmission::forForm("Player")->findByPk($_GET['player']);
				$holeCount = 0;

				$course = $player->group->course;
				foreach($player->scores as $score) {
					if($score->course->id == $course->id) {
						++$holeCount;
					}
				}

				$holeNumber = (($holeCount) + $player->holeOffset) % 18;
				if($holeNumber == 0 && $holeCount > 0) $holeNumber = 18;

				$team = $player->team;
				$players = $team->players;
				$dontStore = false;
				$lastPlayer = null;
				$nextPlayer = null;
				foreach($team->players as $tPlayer) {
					$tHoleCount = 0;
					foreach($tPlayer->scores as $score) {
						$course = $tPlayer->group->course;
						if($score->course->id == $course->id) ++$tHoleCount;
					}
					//if(isset($lastPlayer) && !isset($nextPlayer)) $nextPlayer = $tPlayer->id;
					if($tPlayer->id == $player->id) {
						$nextPlayer = $lastPlayer;
					}
					$lastPlayer = $tPlayer->id;

					if($holeCount > $tHoleCount) $dontStore = true;
				}

				if(isset($player)) {
					if(isset($_GET['shots'])) {
						$score = GSubmission::forForm('Score');
						$score->shots = $_GET['shots'];
						$score->player = $_GET['player'];
						$score->course = $player->group->course->id;
						$newHoleNumber = ($holeNumber+1)%18;
						if($newHoleNumber == 0 && $holeNumber > 0) $newHoleNumber = 18;
						foreach($player->group->course->holes as $tHole) {
							if($tHole->number == $newHoleNumber) $score->hole = $tHole->id;
						}
						if($dontStore) {
							$json['status'] = 'Not saved';
							$json['message'] = 'Score has not been logged for: '.$player->name.' on course: '.$course->name.', hole: '.($newHoleNumber). ' player is ahead of team';
							if(isset($lastPlayer)) $json['select'] = $lastPlayer;
						} else if($holeCount < 18) {
							if($score->save()) {
								$json['status'] = 'Saved';
								if($holeCount+1 == 18) $json['message'] = 'Course: '.$course->name.' completed for player: '.$player->name;
								else $json['message'] = $score->shots.' shots have been logged for: '.$player->name.' on course: '.$player->group->course->name.', hole: '.($newHoleNumber);

								if(isset($nextPlayer)) $json['select'] = $nextPlayer;
								else if(isset($lastPlayer)) $json['select'] = $lastPlayer;
								$json['nextPlayer'] = $nextPlayer;
								$json['lastPlayer'] = $lastPlayer;
							}
						} else {
							$json['status'] = 'Not saved';
							$json['message'] = 'Score has not been logged for: '.$player->name.' course '.$course->name.' is complete for this player';
						}
					}
				} else {
					$json['status'] = 'Error: player not found';
				}
			}

			$team = GSubmission::forForm('Team')->findByPk($_GET['team']);
			if(isset($team)) {
				$proGame = GSubmission::forForm("Game")->find('name = :name', array(":name"=>'Professional'));
				$players = GSubmission::forForm('Player')->findAll('team = :team', array(":team"=>$team->id)); //since players belong to a team, include only players from this team
				$teams = GSubmission::forForm('Team')->findAll('id = :team', array(":team"=>$team->id)); //only include this team
				$playerIds = array();
				foreach($team->players as $player) {
					$playerIds[] = $player->id;
				}
				//die(CVarDumper::dump(implode(' OR ', $playerIds)));
				$scores = GSubmission::forForm('Score')->findAll('player = "'.implode('" OR player = "', $playerIds).'"');//ByAttributes(array('id'=>implode(' OR ', $playerIds))); //only include scores from the teams players
				$countries = GSubmission::forForm('Country')->findAll();
				$groups = GSubmission::forForm('Group')->findAll();
				$courses = GSubmission::forForm('Course')->findAll();
				$holes = GSubmission::forForm('Hole')->findAll();
				$rules = GSubmission::forForm('Rules')->findAll();

				$rounds = ScoreTools::playerScore($team->players, $max=2, $players, $teams, $scores, $courses, $holes, $rules);
				if(!isset($json['status']))$json['status']="Select a player";
				foreach($team->players as $player) {
					$holeCount = 0;
					foreach($player->scores as $score) {
						$course = $player->group->course;
						if($score->course->id == $course->id) {
							++$holeCount;
						}
					}

					$holeNumber = (($holeCount) + $player->holeOffset) % 18;
					if($holeNumber == 0 && $holeCount > 0) $holeNumber = 18;

					$course = $player->group->course->name;
					$newHoleNumber = ($holeNumber+1)%18;
					if($newHoleNumber == 0 && $holeNumber > 0) $newHoleNumber = 18;

					if($holeCount == 18) $holeText = "complete";
					else {
						foreach($player->group->course->holes as $hole) {
							if($hole->number == $newHoleNumber) $holeText = "{$hole->number} (Par {$hole->par}, stroke {$hole->stroke})";
						}
					}
					$strokes = 0;
					$nett = 0;
					$gross = 0;
					if(isset($rounds['total']['player'][$player->id])) {
					$strokes = $rounds['total']['player'][$player->id]['strokes'];
					$nett = $rounds['total']['player'][$player->id]['nett'];
					$gross = $rounds['total']['player'][$player->id]['gross'];
					}
					$json['players'][$player->id] = array('course'=>$course, 'id'=>$player->id, 'name'=>$player->name, 'hole'=>$holeText, 'total'=>$strokes, 'nett'=>$nett, 'gross'=>$gross);
				}
			}
		} else {
			$teams = GSubmission::forForm('Team')->findAll();
			$json = array('teams'=>array(), 'status'=>'Select a team');
			foreach($teams as $team) $json['teams'][$team->id] = array('id'=>$team->id, 'name'=>$team->name);
		}
		echo CJavaScript::jsonEncode ( $json );
	}
}