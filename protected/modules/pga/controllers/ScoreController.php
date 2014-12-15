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
				$scores = sizeof($player->scores);
				$hole = $scores%18;
				$team = $player->team;
				$players = $team->players;
				$dontStore = false;
				foreach($team->players as $tPlayer) {
					$tScores = sizeof($tPlayer->scores);
					if($scores > $tScores) $dontStore = true;
				}
				if(isset($player)) {
					if(isset($_GET['shots'])) {
						$score = GSubmission::forForm('Score');
						$score->shots = $_GET['shots'];
						$score->player = $_GET['player'];
						$group = $player->group;

						$score->course = $group->course->id;
						if($dontStore) {
								$json['status'] = 'Not saved';
								$json['message'] = 'Score has not been logged for: '.$player->name.' on hole '.($hole+1). ' player is ahead of team';
						} else {
							if($score->save()) {
								$json['status'] = 'Saved';
								$json['message'] = 'Score has been logged for: '.$player->name.' on hole '.($hole+1);
							}

						}
					}
				} else {
					$json['status'] = 'Error: player not found';
				}
			}
			$team = GSubmission::forForm('Team')->findByPk($_GET['team']);
			if(isset($team)) {
				$rounds = ScoreTools::playerScore($team->players);
				if(!isset($json['status']))$json['status']="Select a player";
				foreach($team->players as $player) {
					$json['players'][$player->id] = array('id'=>$player->id, 'name'=>$player->name, 'total'=>$rounds['total']['player'][$player->id]['strokes'], 'nett'=>$rounds['total']['player'][$player->id]['nett'], 'gross'=>$rounds['total']['player'][$player->id]['gross']);
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