
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
        ?><form action="/page/form" method="post"><?php
        $holes = [];
        $this->widget ( 'GActiveDropDown', array (
            'label' => 'Group',
            'formName' => 'Group',
            'listOptions' => array (
                'onchange' => '$(this.form).trigger("submit");'
            ),
            'name' => 'group'
        ) );
        if (isset ( $_POST ['group'] ) && is_numeric ( $_POST ['group'] )) {
            $groupId = $_POST ['group'];
            $group = GSubmission::forForm ( 'Group' )->findByAttributes ( array (
                'id' => $groupId
            ) );
            $course = $group->course;
            $x = 0;
            $courseId = $course->id;
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

                try {
                    $scores = GSubmission::forForm('Score')->findAll('created = :created AND player = :player AND course = :course', array(
                        'created' => date('Y-m-d'),
                        ':player' => $player->id,
                        ':course' => $courseId
                    ));

                    $rounds = ScoreTools::playerScore([$player], 2, $scores, [$course], $course->holes, []);

                    foreach($course->holes as $hole) {
                        $x++;
                        $handicap = 0;
                        $holes[] = [
                            'par'=>$hole->par,
                            'stroke'=>$hole->stroke,
                            'handicap'=>0,
                            'score'=>3
                        ];
                    }
                    die(print_r($rounds));
                    if ($player->modified != date ( 'Y-m-d' ) || $player->lock == 'unlock') {
                        echo CHtml::tag ( 'div', array (), 'Flighting: ' . $player->flighting->name );
                        echo CHtml::tag ( 'div', array (), 'Team: ' . $player->team->name );

                        if (isset ( $_POST ['clear'] ) && $_POST ['clear']) {
                            foreach ( $scores as $score )
                                $score->delete ();
                            $scores = GSubmission::forForm ( 'Score' )->findAll ( 'created = :created AND player = :player AND course = :course', array (
                                'created' => date ( 'Y-m-d' ),
                                ':player' => $player->id,
                                ':course' => $courseId
                            ) );
                        } else if (sizeof ( $scores ) < 18) {
                            if (isset ( $_POST ['Score'] ) && is_array ( $_POST ['Score'] )) {
                                foreach ( $_POST ['Score'] as $holeNum => $score ) {
                                    $scorePar = null;
                                    foreach ( $course->holes as $hole ) {
                                        if ($hole->number == $holeNum) {
                                            $scorePar = $hole->par;
                                        }
                                    }

                                    if (is_numeric ( $score ) && isset ( $scorePar )) {
                                        $do = true;
                                        foreach ( $scores as $tscore ) {
                                            if ($tscore->hole->number == $holeNum) {
                                                $do = false;
                                            }
                                        }
                                        if ($do) {
                                            $newScore = GSubmission::forForm ( 'Score' );
                                            $newScore->player = $_POST ['player'];
                                            $newScore->course = $group->course->id;
                                            $newScore->hole = $holeNum;
                                            if ($score > $scorePar + 4) {
                                                $score = $scorePar + 4;
                                            }
                                            if ($score < 0)
                                                $score = 0;
                                            $newScore->setAttribute ( 'shots', $score );
                                            if(!$newScore->save ()) print_r($newScore->errors);

                                            // Gong::setFlash('alert-info', 'Scores have been set.');
                                        }
                                    }
                                }
                                $scores = GSubmission::forForm ( 'Score' )->findAll ( 'created = :created AND player = :player AND course = :course', array (
                                    'created' => date ( 'Y-m-d' ),
                                    ':player' => $player->id,
                                    ':course' => $courseId
                                ) );
                            }
                        }
                    }

                    foreach ( $course->holes as $hole ) {
                        $coursePar += $hole->par;
                    }
                    foreach ( $scores as $score ) {
                        $grossTotal += $score->shots;
                    }
                    if ($grossTotal < 0)
                        $grossTotal = 0;
                    // tally nett
                    $nettTotal = $grossTotal - $player->handicap;
                    if ($nettTotal < 0)
                        $nettTotal = 0;
                    $handicap = self::calculateHandicap ( $nettTotal, $coursePar );

                    $newHandicap = $player->handicap;
                    $player->handicap = $newHandicap;
                    // echo CHtml::tag('div', array(), 'Old handicap: ' . $oldHandicap);
                    $newHandicap += $handicap;
                    if ($newHandicap < 0)
                        $newHandicap = 0;
                    if (isset ( $_POST ['confirm'] )) {
                        $newScore = GSubmission::forForm ( 'Score' );
                        $newScore->playerId = $_POST ['player'];
                        $newScore->course = $_POST ['Course'];
                        $newScore->hole = 0;
                        $newScore->shots = - $player->handicap;
                        $newScore->save ();

                        $newScore->setAttribute ( 'score', $score );
                        $newScore->save ();
                        if ($newHandicap < 0)
                            $newHandicap = 0;
                        $player->lock = 'lock';
                        if (! $player->save ()) {
                            throw new CHttpException ( 500, CHtml::errorSummary ( $player ) );
                        }
                        $player = GSubmission::forForm ( 'Player' )->findByPk ( $_POST ['player'] );
                        $x = 0;
                    }
                    ?>
                    <style>
                        table{border-collapse: collapse;border-color:grey;}
                        table tr {border-style: solid;border-width:2px}
                        table td {padding:5px;margin:0px;border:0px;border-style: solid;    border-color: gray;border-width:1px}
                        .color{background-color:#999;color:white;}
                        .fifty{background-color:#ccc;}
                    </style>

                    <table>
                        <tr>
                            <th class="color">
                                Name
                            </th>
                            <td>
                                <?php echo $player->name ?>
                            </td>
                        </tr>
                        <tr>
                            <th class="color">
                                Handicap
                            </th>
                            <td>
                                <?php echo $player->handicap; ?>
                            </td>
                        </tr>
                        <tr>
                            <th class="color">
                                Course Name
                            </th>
                            <td>
                                <?php echo $course->name; ?>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr class="color">
                            <th>Hole</th>
                            <?php for($x = 1; $x < 10; $x ++) {  echo "<td>$x</td>"; }?>
                        </tr>
                        <tr class="color">
                            <th>Par</th>
                            <?php for($x = 0; $x < 9; $x ++) { echo "<td>{$holes[$x]['par']}</td>";} ?>
                        </tr>
                        <tr class="color">
                            <th>Stroke</th>
                            <?php for($x = 0; $x < 9; $x ++) { echo "<td>{$holes[$x]['stroke']}</td>"; }?>
                        </tr>
                        <tr>
                            <th class="color">Handicap</th>
                            <?php for($x = 0; $x < 9; $x ++) { echo "<td>{$holes[$x]['handicap']}</td>";} ?>
                        </tr>
                        <tr>
                            <th class="color">Score</th>
                            <?php for($x = 0; $x < 9; $x ++) { echo "<td><input size=\"2\" type=\"text\" name=\"Score[$x]\" value=\"{$holes[$x]['score']}\"/></td>"; }?>
                        </tr>
                        <tr>
                            <th class="color">Score</th>
                            <?php for($x = 9; $x < 18; $x ++) { echo "<td><input size=\"2\" type=\"text\" name=\"Score[$x]\" value=\"{$holes[$x]['score']}\"/></td>"; }?>
                        </tr>
                        <tr>
                            <th class="color">Handicap</th>
                            <?php for($x = 9; $x < 18; $x ++) { echo "<td>{$holes[$x]['handicap']}</td>";} ?>
                        </tr>
                        <tr class="color">
                            <th>Stroke</th>
                            <?php for($x = 9; $x < 18; $x ++) { echo "<td>{$holes[$x]['stroke']}</td>"; }?>
                        </tr>
                        <tr class="color">
                            <th>Par</th>
                            <?php for($x = 9; $x < 18; $x ++) { echo "<td>{$holes[$x]['par']}</td>";} ?>
                        </tr>
                        <tr class="color">
                            <th>Hole</th>
                            <?php for($x = 10; $x < 19; $x ++) {  echo "<td>$x</td>"; }?>
                        </tr>
                    </table>
                    <?php
                    // tally gross

                    $grossTotal = 0;
                    $coursePar = 0;
                    foreach ( $course->holes as $hole ) {
                        $coursePar += $hole->par;
                    }
                    foreach ( $scores as $score ) {
                        $grossTotal += $score->shots;
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
                        die('test');
                        if ($grossTotal > 0) {
                            $nettScore = $grossTotal - $player->handicap;
                            if ($nettScore < 0)
                                $nettScore = 0;
                            echo CHtml::tag ( 'div', array (), 'Gross total:' . $grossTotal );
                            echo CHtml::tag ( 'div', array (), 'Course par:' . $coursePar );
                            echo CHtml::tag ( 'div', array (), 'Nett score:' . $nettScore );
                            echo CHtml::tag ( 'div', array (), 'Old handicap: ' . $player->handicap );
                            echo CHtml::tag ( 'div', array (), 'New Handicap:' . $newHandicap );
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

                }catch(Exception $e) {
                    echo $e->getMessage();
                    echo $e->getLine();
                }
            }
        }
        ?></form><?php
        parent::run ();
    }
}
?>
