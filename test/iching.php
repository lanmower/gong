<?php
$hexagrams = array(
    array(1, 34, 5, 26, 11, 8, 14, 43),
    array(25, 51, 3, 27, 24, 42, 21, 17),
    array(6, 40, 29, 4, 7, 59, 64, 47),
    array(33, 62, 39, 52, 15, 53, 56, 31),
    array(12, 16, 8, 23, 2, 20, 35, 45),
    array(44, 32, 48, 18, 46, 57, 50, 28),
    array(13, 55, 63, 22, 36, 37, 30, 49),
    array(10, 54, 60, 41, 19, 61, 38, 58),
);
$lines = array('000'=>0, '110'=>1, '101'=>2, '011'=>3, '111'=>4, '001'=>5, '010'=>6, '100'=>7);
$casts = array();
$hexes = '';
$change = '';
if(isset($_POST['coin'])) {
    for($x = 0; $x < 6; $x++) {
        $yang = 0;
        for($y = 0; $y < 3; $y++) {
            if(isset($_POST['coin'][$x][$y])) {
                $yang++;
            }
        }
        $casts[] = $yang;
    }
}
foreach($casts as $cast) {
    $hexes .= ($cast>1)?'1':'0';
    if($cast == 3) $change .= 0;
    else if($cast == 0) $change .= 1;
    else $change .= ($cast>1)?'1':'0';
}
$upper = substr($hexes, 0, 3);
$lower = substr($hexes, 3, 3);
$changeUpper = substr($change, 0, 3);
$changeLower = substr($change, 3, 3);
echo "<a href='http://deoxy.org/iching/{$hexagrams[$lines[$lower]][$lines[$upper]]}'>Read Current</a>";
echo "<a href='http://deoxy.org/iching/{$hexagrams[$lines[$changeLower]][$lines[$changeUpper]]}'>Read Change</a>";
echo '<form method="post">';
for($x = 0; $x < 6; $x++) {
    for($y = 0; $y < 3; $y++) {
        if(isset($_POST['coin'][$x][$y])) 
            echo "<input type='checkbox' name='coin[$x][$y]' checked>";
        else echo "<input type='checkbox' name='coin[$x][$y]'>";
    }
    echo '<br/>';
}
echo '<input type="submit"/>';
echo '</form>';

?>
