<?php
$this->pageTitle=Yii::app()->name . ' - Error';
$this->breadcrumbs=array(
	'Error',
);
?>


    <?php 
    echo CHtml::image('/themes/m2m/images/error.png', "Broken Record", array('class' => 'pull-left'));
    echo CHtml::tag('h2', array(), 'Oops something is broken...');
    echo CHtml::link(BsHtml::icon('eject', array('class' => 'icon-2x')), '/', array('class' => 'btn btn-success nohijack pull-left', 'style' => 'margin: 0 15px;'));
    ?>
    <div class="error">
<?php
//echo $this->beginWidget('bootstrap.widgets.TbModal', array('autoOpen'=>true));
//echo $this->endWidget();
echo CHtml::encode($message);
echo CHtml::tag('br');
    if(YII_DEBUG) {
        echo CHtml::encode($type);
        echo CHtml::tag('br');
        echo CHtml::encode($message);
        echo CHtml::tag('br');
        echo CHtml::encode($file); 
        echo " Line: ";
        echo CHtml::encode($line); 
        echo CHtml::tag('br');
        echo CHtml::tag('pre', array(), $trace);
}
?>
    
</div>