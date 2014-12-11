<?
echo CHtml::openTag('div', array('class' => 'form'));

$form = $this->beginWidget('CActiveForm', array(
    'id' => 'user-form',
    'enableAjaxValidation' => false, 'htmlOptions' => array(
        'class' => 'well')));
?>

<?
echo CHtml::openTag('div', array('class' => 'note text-info'));

    echo Gong::requiredFieldNote();

        $models = array($model, $passwordform);
        if (isset($profile) && $profile !== false)
            $models[] = $profile;
        echo CHtml::errorSummary($models);

echo CHtml::closeTag('div');
echo CHtml::openTag('div', array('class' => 'pull-right alert alert-info'));
  
echo CHtml::openTag('div', array('class' => 'row'));

        echo $form->labelEx($model, 'Super User');
        echo $form->dropDownList($model, 'superuser', GongUser::itemAlias('AdminStatus'), array('class' => 'short'));
        echo $form->error($model, 'superuser');
        
    echo CHtml::closeTag('div');

echo CHtml::openTag('div', array('class' => 'row'));

        echo $form->labelEx($model, 'status');
        echo $form->dropDownList($model, 'status', GongUser::itemAlias('UserStatus'), array('class' => 'short'));
        echo $form->error($model, 'status');

    echo CHtml::closeTag('div');

        echo CHtml::openTag('div');
            echo CHtml::openTag('label');
            echo Gong::t('User belongs to these roles'); 
       echo CHtml::closeTag('label'); ?>

            <?
            $this->widget('GongModule.components.Relation', array(
                'model' => $model,
                'relation' => 'roles',
                'style' => 'dropdownlist',
                'fields' => 'title',
                'showAddButton' => false));
            


        echo CHtml::closeTag('div');

echo CHtml::closeTag('div');

    echo $form->labelEx($model, 'username');
    echo $form->textField($model, 'username');
    echo $form->error($model, 'username');
?>


<p class="text-info"> Leave password <em> empty </em> to 
<?
echo $model->isNewRecord ? 'generate a random Password' : 'keep it <em> unchanged </em>';
?> </p>

    <? $this->renderPartial('/user/passwordfields', array(
        'form' => $passwordform));
    ?>

<?
if (Gong::hasModule('profile'))
    $this->renderPartial('gong.views.profile._form', array(
        'profile' => $profile));

echo CHtml::openTag('div', array('class' => 'row buttons short'));    

    echo CHtml::submitButton($model->isNewRecord ? Gong::t('Create') : Gong::t('Save'));
    
echo CHtml::closeTag('div');

    $this->endWidget(); 

echo CHtml::closeTag('div');

echo CHtml::tag('div', array('class'=>'clearfix'),false);
 ?>
