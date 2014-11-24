<html><body><?php
$session = Yii::app()->session;
$hashChange = $session['hashChange'];

if(isset($hashChange)) {
    echo CHtml::tag('div', array('class'=>'hashChange', 'target'=>$hashChange));
    unset(Yii::app()->session['hashChange']);
}
Yii::import('gong.models.*');
echo G::renderFlash().$content;
?>
</body></html>
