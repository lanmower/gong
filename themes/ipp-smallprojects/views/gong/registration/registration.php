<?php
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class'=>'GContent')); 
$this->breadcrumbs = array(Gong::t('Registration')); ?>
<h2> <?php echo Gong::t('Registration'); ?> </h2>


<div class="form inline-form">
    <?php
    $activeform = $this->beginWidget('CActiveForm', array(
        'id' => 'registration-form',
        //'htmlOptions' => array('class' => 'nohijack'),
        'enableAjaxValidation' => true,
        'enableClientValidation' => true,
        'focus' => array($form, 'username'),
            ));
    ?>

    <?php echo Gong::requiredFieldNote(); ?>
<?php echo CHtml::errorSummary(array($form, $profile)); ?>

    <div class="row"> <?php
echo $activeform->labelEx($form, 'username');
echo $activeform->textField($form, 'username');
?> </div>

    <div class="row"> <?php
echo $activeform->labelEx($profile, 'email');
echo $activeform->textField($profile, 'email');
?> </div>  

    <div class="row"> <?php
echo $activeform->labelEx($profile, 'firstname');
echo $activeform->textField($profile, 'firstname');
?> </div>  

    <div class="row"> <?php
echo $activeform->labelEx($profile, 'lastname');
echo $activeform->textField($profile, 'lastname');
?> </div>  

    <div class="row"> <?php
echo $activeform->labelEx($profile, 'company_name');
echo $activeform->textField($profile, 'company_name');
?> </div>  

    <div class="row"> <?php
echo $activeform->labelEx($profile, 'telephone');
echo $activeform->textField($profile, 'telephone');
?> </div>  
    <div class="row">
        <?php
        echo $activeform->labelEx($profile, 'nature_of_interest');
        echo $activeform->checkBoxList($profile, 'nature_of_interest', array('Developer'=>'Developer', 'Equipment/Technology Supplier'=>'Equipment/Technology Supplier', 'Financier'=>'Financier', 'Civils Contractor'=>'Civils Contractor', 'Legal/Financial/Technical Advisor'=>'Legal/Financial/Technical Advisor', 'Municipality'=>'Municipality', 'Government'=>'Government'));
        echo CHtml::tag('span', array('style'=>'display:none', 'class'=>'technology'), CHtml::label('Technology','GProfile_technology').CHtml::checkBoxList('GProfile[technology][]', array(), array('Onshore wind'=>'Onshore wind','Solar photovoltaic'=>'Solar photovoltaic','Biomass'=>'Biomass','Biogas'=>'Biogas','Landfill gas'=>'Landfill gas')));
        
        $cs = Yii::app()->clientscript;
        $cs->registerScript("hideMenu", '
            $("#GProfile_nature_of_interest_1").click(function() {
                if($("#GProfile_nature_of_interest_0").is(":checked") ||
                    $("#GProfile_nature_of_interest_1").is(":checked")) {
                        $(".technology").show();
                } else {
                        $(".technology").hide();
                    $("#GProfile_technology input").removeAttr("checked");
                }
            });
            ');
        ?>
        <br>
    </div>


    <div class="row">
        <?php echo $activeform->labelEx($form, 'password'); ?>
<?php echo $activeform->passwordField($form, 'password'); ?>
    </div>

    <div class="row">
        <?php echo $activeform->labelEx($form, 'verifyPassword'); ?>
<?php echo $activeform->passwordField($form, 'verifyPassword'); ?>
    </div>

  <?php
        if (extension_loaded('gd')):
            ?>
            <div class="row">
                    <?php echo CHtml::activeLabelEx($form, 'verifyCode'); ?>
                <div class="clearfix"></div>
                <div class="capatcha">
                    <?php $this->widget('CCaptcha'); ?>
                    <?php echo CHtml::activeTextField($form, 'verifyCode'); ?>
                
                <p class="hint">
    <?php echo Gong::t('Please enter the letters as they are shown in the image above.'); ?>
                    <br/><?php echo Gong::t('Letters are not case-sensitive.'); ?></p>
                </div>
            </div>
<?php endif; ?>

    <div class="row submit">
    <?php echo CHtml::submitButton(Gong::t('Registration')); ?>
    </div>

<?php $this->endWidget(); ?>
</div><!-- form -->
</div>
<?php echo CHtml::closeTag('div'); ?>