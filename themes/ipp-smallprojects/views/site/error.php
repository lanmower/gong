<?php
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
$this->pageTitle=Yii::app()->name . ' - Error';
$this->breadcrumbs=array(
	'Error',
);
?>
<div class="GContent">
<h2>Error <?php echo $code; ?></h2>

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
</div>