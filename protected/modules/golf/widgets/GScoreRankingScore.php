<?php
class GScoreRankingScore extends GTag {
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
    public function run() {
        $d = isset ( $_GET ['debug'] );
        $data = Yii::app ()->cache->get ( 'playerRankingData' );
        if ($data === false || isset($_GET['nocache'])) {
            ScoreTools::processScores ();
            $data = Yii::app ()->cache->get ( 'playerRankingData' );
        }
        if($d) {
          CVarDumper::dump ( "Dumping cache", 1, true );
          CVarDumper::dump ( $data, 1, true );
        }
        usort ( $data, function ($a, $b) {
            return $a ['total']['parnett'] < $b ['total']['parnett'];
        } );
        echo "<table class='table'>";
        echo "<tr>";
        echo "<th class='th1'>POS</th>";
        echo "<th class='th2'>Player</th>";
        echo "<th class='th4'>Hole</th>";
        echo "<th class='th4'>Score</th>";
        echo "</tr>";
        $pos = 0;
        $lastTotal = 0;
        foreach ( $data as $playerData ) {
            $player = $playerData ['player'];
            $total = $playerData ['total'] ['parnett'];
            if($total == 0) continue;
            echo "<tr>";
            echo "<td>";
            ++ $pos;
            if ($lastTotal != $total) {
                echo $pos;
            }
            $lastTotal = $total;
            echo "</td>";
            echo "<td>";
            if (isset ( $player->country )) {
                echo CHtml::image ( str_replace ( 'protected/data/form_uploads/GSubmission/', '/protected/data/form_uploads/GSubmission/', $player->country->flag ) );
            }
            echo $player ['name'];
            echo "</td>";
            echo CHtml::tag ( 'td', array (), $playerData ['total'] ['hole'] );
            echo CHtml::tag ( 'td', array (), $total );
            echo "</tr>";
        }
        echo "</tr>";
        echo "</table>";
    }
}

?>
