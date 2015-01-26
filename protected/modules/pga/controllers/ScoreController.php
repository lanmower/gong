<?php
class ScoreController extends GController {
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

				foreach($player->scores as $score) {
					$course = $player->group->course;
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
					if(isset($lastPlayer) && !isset($nextPlayer)) $nextPlayer = $tPlayer->id;
					if($tPlayer->id == $player->id) {
						$lastPlayer == $player->id;
					}
					
					if($holeCount > $tHoleCount) $dontStore = true;
				}
				echo $lastPlayer+'\n';
				die($nextPlayer);

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
							}
						} else {
							$json['status'] = 'Not saved';
							$json['message'] = 'Score has not been logged for: '.$player->name.' course '.$course->name.' is complete for this player';
						}
					}
				} else {
					$json['status'] = 'Error: player not found';
				}
				GSubmission::clearCache();
			}

			$team = GSubmission::forForm('Team')->findByPk($_GET['team']);
			if(isset($team)) {
				$rounds = ScoreTools::playerScore($team->players);
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
					
					$json['players'][$player->id] = array('course'=>$course, 'id'=>$player->id, 'name'=>$player->name, 'hole'=>$holeText, 'total'=>$rounds['total']['player'][$player->id]['strokes'], 'nett'=>$rounds['total']['player'][$player->id]['nett'], 'gross'=>$rounds['total']['player'][$player->id]['gross']);
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