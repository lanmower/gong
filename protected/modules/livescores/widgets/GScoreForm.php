<?php
class GScoreForm extends GTag {
	public function init() {
		$tablecloth = Yii::app ()->assetManager->publish ( 'protected/vendors/tablecloth/assets', false, - 1, YII_DEBUG );
		// $this->js[] = array('url' => $tablecloth . "/js/jquery.metadata.js");
		// $this->js[] = array('url' => $tablecloth . "/js/jquery.tablesorter.min.js");
		$this->js [] = array (
				'url' => $tablecloth . "/js/jquery.tablecloth.js" 
		);
		
		$this->css [] = array (
				'url' => $tablecloth . "/css/tablecloth.css" 
		);
		// $this->css[] = array('url' => $tablecloth . "/css/prettify.css");
		$this->script = "
                    $('#$this->id table').tablecloth({
                        theme: 'default',
                        condensed: true
                    });
                    ";
		parent::init ();
	}
	public static function calculateHandicap($nettTotal, $coursePar) {
		$diff = $nettTotal - $coursePar;
		++ $diff;
		if ($diff > 13)
			$handicap = 3;
		else if ($diff > 8)
			$handicap = 2;
		else if ($diff > 5)
			$handicap = 1;
		else if ($diff > - 2)
			$handicap = 0;
		else if ($diff > - 4)
			$handicap = - 1;
		else if ($diff > - 6)
			$handicap = - 2;
		else if ($diff > - 8)
			$handicap = - 3;
		else if ($diff > - 10)
			$handicap = - 4;
		else if ($diff > - 12)
			$handicap = - 5;
		else
			$handicap = - 6;
		return $handicap;
	}
	public function run() {
		if (isset ( $_POST ['Course'] ) && is_numeric ( $_POST ['Course'] )) {
			$courseId = $_POST ['Course'];
			$pars = GSubmission::forForm ( 'Par' )->findAllByAttributes ( array (
					'course' => $courseId 
			), array (
					'order' => 'hole' 
			) );
			$group = GSubmission::forForm ( 'Group' )->findByAttributes ( array (
					'course' => $courseId 
			) );
			$grossTotal = 0;
			$coursePar = 0;
			if (! $group) {
				echo 'There are no groups assigned to this course at present';
				return parent::run ();
			}
			$this->widget ( 'GActiveDropDown', array (
					'label' => 'Player',
					'formName' => 'Player',
					'criteria' => array (
							'condition' => '`group` = :group',
							'params' => array (
									':group' => $group->id 
							) 
					),
					'listOptions' => array (
							'onchange' => '$(this.form).trigger("submit");' 
					),
					'name' => 'player' 
			) );
			
			if (isset ( $_POST ['player'] ) && is_numeric ( $_POST ['player'] )) {
				$player = GSubmission::forForm ( 'Player' )->findByPk ( $_POST ['player'] );
				
				$scores = GSubmission::forForm ( 'Score' )->findAll ( 'created = :created AND playerId = :player AND course = :course', array (
						'created' => date ( 'Y-m-d' ),
						':player' => $player->id,
						':course' => $courseId 
				) );
				
				if ($player->modified != date ( 'Y-m-d' ) || $player->lock == 'unlock') {
					echo CHtml::tag ( 'div', array (), 'Flighting: ' . GSubmission::forForm ( 'Flighting' )->findByPk ( $player->flighting )->name );
					echo CHtml::tag ( 'div', array (), 'Team: ' . GSubmission::forForm ( 'Team' )->findByPk ( $player->team )->name );
					
					if (isset ( $_POST ['clear'] ) && $_POST ['clear']) {
						foreach ( $scores as $score )
							$score->delete ();
						$scores = GSubmission::forForm ( 'Score' )->findAll ( 'created = :created AND playerId = :player AND course = :course', array (
								'created' => date ( 'Y-m-d' ),
								':player' => $player->id,
								':course' => $courseId 
						) );
					} else if (sizeof ( $scores ) < 18) {
						if (isset ( $_POST ['Score'] ) && is_array ( $_POST ['Score'] )) {
							foreach ( $_POST ['Score'] as $holeNum => $score ) {
								$scorePar = null;
								foreach ( $pars as $par ) {
									if ($par->hole == $holeNum) {
										$scorePar = $par;
									}
								}
								if (is_numeric ( $score ) && isset ( $scorePar )) {
									$do = true;
									foreach ( $scores as $tscore ) {
										if ($tscore->hole == $holeNum) {
											$do = false;
										}
									}
									if ($do) {
										$newScore = GSubmission::forForm ( 'Score' );
										$newScore->playerId = $_POST ['player'];
										$newScore->course = $_POST ['Course'];
										$newScore->hole = $holeNum;
										if ($score > $scorePar->par + 4) {
											$score = $scorePar->par + 4;
										}
										if ($score < 0)
											$score = 0;
										$newScore->setAttribute ( 'score', $score );
										$newScore->save ();
										// Gong::setFlash('alert-info', 'Scores have been set.');
									}
								}
							}
							$scores = GSubmission::forForm ( 'Score' )->findAll ( 'created = :created AND playerId = :player AND course = :course', array (
									'created' => date ( 'Y-m-d' ),
									':player' => $player->id,
									':course' => $courseId 
							) );
						}
					}
				}
				foreach ( $pars as $par ) {
					$coursePar += $par->par;
				}
				foreach ( $scores as $score ) {
					$grossTotal += $score->score;
				}
				if ($grossTotal < 0)
					$grossTotal = 0;
					// tally nett
				$nettTotal = $grossTotal - $player->handicap;
				if ($nettTotal < 0)
					$nettTotal = 0;
				$handicap = self::calculateHandicap ( $nettTotal, $coursePar );
				if (! $player->newHandicap)
					$player->newHandicap = $player->handicap;
				$player->handicap = $player->newHandicap;
				// echo CHtml::tag('div', array(), 'Old handicap: ' . $oldHandicap);
				$player->newHandicap += $handicap;
				if ($player->newHandicap < 0)
					$player->newHandicap = 0;
				if (isset ( $_POST ['confirm'] )) {
					$player->lock = 'lock';
					if (! $player->save ()) {
						throw new CHttpException ( 500, CHtml::errorSummary ( $player ) );
					}
					$player = GSubmission::forForm ( 'Player' )->findByPk ( $_POST ['player'] );
				}
				
				echo CHtml::openTag ( 'table', array (
						'table' 
				) );
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Out' );
				echo CHtml::tag ( 'th', array (
						'colspan' => '9' 
				) );
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Hole' );
				for($x = 0; $x < sizeof ( $pars ) && $x < 9; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->hole;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::tag ( 'th', array (), 'Score' );
				for($x = 0; $x < sizeof ( $pars ) && $x < 9; $x ++) {
					echo CHtml::openTag ( 'td' );
					$thisScore = null;
					foreach ( $scores as $score ) {
						if ($score->hole == $pars [$x]->hole)
							$thisScore = $score;
					}
					if (isset ( $thisScore )) {
						echo CHtml::tag ( 'span', array (), $thisScore->score );
					} else if (isset ( $_POST ['Score'] ) && is_numeric ( $_POST ['Score'] )) {
						echo $_POST ['Score'] [$pars [$x]->hole];
					} else {
						echo CHtml::textField ( "Score[" . $pars [$x]->hole . "]", isset ( $_POST ['Score'] ) ? $_POST ['Score'] [$pars [$x]->hole] : null );
					}
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Par' );
				for($x = 0; $x < sizeof ( $pars ) && $x < 9; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->par;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Max' );
				for($x = 0; $x < sizeof ( $pars ) && $x < 9; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->par + 4;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'In' );
				echo CHtml::tag ( 'th', array (
						'colspan' => '9' 
				) );
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Hole' );
				for($x = 9; $x < sizeof ( $pars ) && $x < 18; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->hole;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::tag ( 'th', array (), 'Score' );
				for($x = 9; $x < sizeof ( $pars ) && $x < 18; $x ++) {
					echo CHtml::openTag ( 'td' );
					$thisScore = null;
					foreach ( $scores as $score ) {
						if ($score->hole == $pars [$x]->hole)
							$thisScore = $score;
					}
					if (isset ( $thisScore )) {
						echo CHtml::tag ( 'span', array (), $thisScore->score );
					} else if (isset ( $_POST ['Score'] ) && is_numeric ( $_POST ['Score'] )) {
						echo $_POST ['Score'] [$pars [$x]->hole];
					} else {
						echo CHtml::textField ( "Score[" . $pars [$x]->hole . "]", isset ( $_POST ['Score'] ) ? $_POST ['Score'] [$pars [$x]->hole] : null );
					}
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Par' );
				for($x = 9; $x < sizeof ( $pars ) && $x < 18; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->par;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::openTag ( 'tr' );
				echo CHtml::tag ( 'th', array (), 'Max' );
				for($x = 9; $x < sizeof ( $pars ) && $x < 18; $x ++) {
					echo CHtml::openTag ( 'td' );
					echo $pars [$x]->par + 4;
					echo CHtml::closeTag ( 'td' );
				}
				echo CHtml::closeTag ( 'tr' );
				
				echo CHtml::closeTag ( 'table' );
				// tally gross
				$grossTotal = 0;
				$coursePar = 0;
				foreach ( $pars as $par ) {
					$coursePar += $par->par;
				}
				foreach ( $scores as $score ) {
					$grossTotal += $score->score;
				}
				if ($grossTotal < 0)
					$grossTotal = 0;
					// tally nett
				$nettTotal = $grossTotal - $player->handicap;
				if ($nettTotal < 0)
					$nettTotal = 0;
				
				if (sizeof ( $scores ) < 18) {
					echo CHtml::tag ( 'div', array (), 'Handicap: ' . $player->handicap );
					echo CHtml::submitButton ( 'Submit', array (
							'class' => 'btn btn-default' 
					) );
				} else if ($player->modified != date ( 'Y-m-d' ) || $player->lock == 'unlock') {
					if ($grossTotal > 0) {
						$nettScore = $grossTotal - $player->handicap;
						if ($nettScore < 0)
							$nettScore = 0;
						echo CHtml::tag ( 'div', array (), 'Gross total:' . $grossTotal );
						echo CHtml::tag ( 'div', array (), 'Course par:' . $coursePar );
						echo CHtml::tag ( 'div', array (), 'Nett score:' . $nettScore );
						echo CHtml::tag ( 'div', array (), 'Old handicap: ' . $player->handicap );
						echo CHtml::tag ( 'div', array (), 'New Handicap:' . $player->newHandicap );
					}
					echo CHtml::submitButton ( 'Confirm', array (
							'class' => 'btn btn-default',
							'name' => 'confirm' 
					) );
					echo CHtml::button ( 'Clear form', array (
							'class' => 'btn btn-default',
							'onclick' => '$(this.form).append("<input type=\'hidden\' name=\'clear\' value=\'true\'/>");this.form.submit(); ' 
					) );
				}
			}
		}
		parent::run ();
	}
}

?>
