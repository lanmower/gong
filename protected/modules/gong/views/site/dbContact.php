<?
Yii::app()->clientScript->registerScript("formPageScript-$page->id",
        isset($_GET['scroll'])?'$("html, body").animate({scrollTop: $("#'.$_GET['scroll'].'").offset().top}, 250);':
                                '$("html, body").animate({scrollTop: "0px"}, 250);');
$form=$this->beginWidget('CActiveForm', array(
    'id'=>'FormPage-'.$page->name,
    'htmlOptions'=>array(
    'class'=>'targetForm',
    'data-target'=>'.GContent'
        )
)); 
echo $form->errorSummary($data,"","", $htmlOptions=array('class'=>'errorSummary alert alert-danger'));
$page->formWidget = $form;
$page->formData = $data;
$page->mode = 'form';
echo $page->html;
echo CHtml::openTag('div', array('class'=>'form-actions'));
echo CHtml::button('Submit', array('type' => 'submit', 'class' => 'btn btn-large btn-primary'));
//echo CHtml::resetButton('Restore', array('class' => 'btn btn-large btn-primary'));
echo CHtml::ajaxButton('Clear', '#', array(), array('class' => 'btn btn-large btn-primary clear', 'onclick'=>'$("GForm form").clearForm();'));
echo CHtml::closeTag('div');
$this->endWidget();
?>