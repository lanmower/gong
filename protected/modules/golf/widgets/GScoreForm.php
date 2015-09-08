
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

                    if (isset ( $_POST ['Score'] ) && is_array ( $_POST ['Score'] ) && isset($_POST['submit'])) {
                        foreach ( $_POST ['Score'] as $holeNum => $score ) {
                            $scorePar = null;
                            foreach ( $course->holes as $hole ) {
                                if ($hole->number == $holeNum+1) {
                                    $scorePar = $hole->par;
                                }
                            }
                            if (is_numeric ( $score ) && isset ( $scorePar )) {
                                $do = true;
                                foreach ( $scores as $tscore ) {
                                    if ($tscore->hole->number == $holeNum+1) {
                                        $newScore = $tscore;
                                        $do = false;
                                    }
                                }
                                if ($do) {
                                    $newScore = GSubmission::forForm ( 'Score' );
                                    $newScore->player = $_POST ['player'];
                                    $newScore->course = $group->course->id;
                                    foreach ( $course->holes as $hole ) {
                                        if ($hole->number == $holeNum+1) {
                                            $newScore->hole = $hole->id;
                                        }
                                    }
                                }
                                if ($score > $scorePar + 4) {
                                    $score = $scorePar + 4;
                                }
                                if ($score < 0)
                                    $score = 0;

                                $newScore->setAttribute ( 'shots', $score );
                                if(!$newScore->save ()) print_r($newScore->errors);

                            }
                        }
                        $scores = GSubmission::forForm('Score')->findAll('created = :created AND player = :player AND course = :course', array(
                            'created' => date('Y-m-d'),
                            ':player' => $player->id,
                            ':course' => $courseId
                        ));
                    }

                    $rounds = ScoreTools::playerScore([$player], 2, [$course], GSubmission::forForm ( 'Hole' )->findAll (),GSubmission::forForm ( 'Rules' )->findAll ());
                    $handicap = $rounds['total']['player']['handicap'];
                    foreach($course->holes as $hole) {
                        $x++;
                        $adjustment = 0;
                        //die(print_r($rounds));
                        if ($handicap >= $hole->stroke) {
                            -- $adjustment;
                        }
                        if (($handicap - 18) >= $hole->stroke) {
                            -- $adjustment;
                        }
                        $score = 0;
                        foreach($scores as $s) {
                            if($s->hole->id == $hole->id) {
                                $score = $s->shots;
                            }
                        }
                        $holes[] = [
                            'par'=>$hole->par,
                            'stroke'=>$hole->stroke,
                            'handicap'=>-$adjustment,
                            'score'=>$score
                        ];
                    }
                    echo CHtml::tag ( 'div', array (), 'Flighting: ' . $player->flighting->name );
                    echo CHtml::tag ( 'div', array (), 'Team: ' . $player->team->name );


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
                                <?php echo $handicap; ?>
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

                    if (isset($rounds['total']['player']) && isset($rounds['total']['player'][0])) {
                        echo CHtml::tag('div', array(), 'Gross total:' . $rounds['total']['player'][0]['gross']);
                        //echo CHtml::tag ( 'div', array (), 'Course par:' . $coursePar );
                        echo CHtml::tag('div', array(), 'Nett score:' . $rounds['total']['player'][0]['nett']);
                    }
                    echo CHtml::submitButton ( 'Submit', array (
                        'class' => 'btn btn-default','name'=>'submit'
                    ) );
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
