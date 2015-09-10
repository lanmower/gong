<?php
class GScoreRankingFlighting extends GTag {
    public function init() {
        $this->script = '
						setTimeout("location.reload(true);", 240000);
					';
        if (isset ( $_GET ['scroll'] ))
            $this->script .= '$("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);
  var scrolltopbottom =  setInterval(function(){
    $("html, body").animate({ scrollTop: $(document).height() }, 120000, "linear");
    setTimeout(function() {
       $("html, body").animate({scrollTop:0}, 120000, "linear"); 
    },120000);

    },240000);
';
        parent::init ();
    }
    public function run()
    {
        $data = Yii::app()->cache->get('flightingRankingData');
        if ($data === false) {
            ScoreTools::processScores();
            $data = Yii::app()->cache->get('flightingRankingData');
        }
        echo "<table class='table'>";
        echo "<tr>";
        echo "<th class='th1'>POS</th>";
        echo "<th class='th2'>Player</th>";
        echo "<th class='th4'>Day 1</th>";
        echo "<th class='th4'>Day 2</th>";
        echo "<th class='th4'>Day 3</th>";
        echo "<th class='th4'>Score</th>";
        echo "</tr>";
        $pos = 0;
        $lastTotal = 0;
        $flightings = GSubmission::forForm ( 'Flighting' )->findAll ();
        foreach ($data as $key => $flighting) {
            $flighting = $flightings[$key];
            echo "<tr style='background:gray;'><th colspan='9'>Flighting: $flighting->name</th></tr>";
            foreach ($flighting as $playerData) {
                $player = $playerData ['player'];
                $total = $playerData ['total']['shots'];
                if($total == 0) continue;
                echo "<tr>";
                echo "<td>";
                ++$pos;
                if ($lastTotal != $playerData ['total'] ['shots']) {
                    echo $pos;
                }
                $lastTotal = $playerData ['total'] ['shots'];
                echo "</td>";
                echo "<td>";
                if (isset ($player->country)) {
                    echo CHtml::image(str_replace('protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission/', $player->country->flag));
                }
                echo $player ['name'];
                echo "</td>";
                echo CHtml::tag('td', array(), isset ($playerData ['total'] ['days'] [0]) ? $playerData ['total'] ['days'] [0] : "");
                echo CHtml::tag('td', array(), isset ($playerData ['total'] ['days'] [1]) ? $playerData ['total'] ['days'] [1] : "");
                echo CHtml::tag('td', array(), isset ($playerData ['total'] ['days'] [2]) ? $playerData ['total'] ['days'] [2] : "");
                //echo CHtml::tag('td', array(), isset ($playerData ['total'] ['days'] [3]) ? $playerData ['total'] ['days'] [3] : "");
                //echo CHtml::tag('td', array(), isset ($playerData ['total'] ['days'] [4]) ? $playerData ['total'] ['days'] [4] : "");
                echo CHtml::tag('td', array(), $total);
                echo "</tr>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }
}

?>
