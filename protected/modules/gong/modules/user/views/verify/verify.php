<h2> <?php echo G::t('User Verification'); ?> </h2>

<?php $this->breadcrumbs = array(G::t('User Verification')); ?>

<div class="form">
    <?php
    $activeform = $this->beginWidget('CActiveForm', array(
        'id' => 'registration-form',
        'action' => 'profile/update'
            ));
    ?>

    <?php echo G::requiredFieldNote(); ?>
    <?php echo CHtml::errorSummary(array($profile)); ?>

    <?php
    foreach ($profile->loadProfileFields() as $field) {
        echo CHtml::openTag('div', array('class' => 'row'));

        if ($field->hint)
            echo CHtml::tag('div', array('class' => 'hint'), $field->hint, true);

        echo CHtml::activeLabelEx($profile, $field->varname);
        if ($field->field_type == 'BOOLEAN') {
            echo CHtml::activeCheckBox($profile, $field->varname);
        } else
        if ($field->field_type == "TEXT") {
            echo CHtml::activeTextArea($profile, $field->varname, array('rows' => 6, 'cols' => 50));
        } else if ($field->field_type == "DROPDOWNLIST") {
            if($field->items) echo CHtml::activeDropDownList($profile, $field->varname, unserialize($field->items));
        } else if ($field->field_type == "CHECKBOXLIST") {
            if($field->items) echo CHtml::activeCheckBoxList($profile, $field->varname, unserialize($field->items));
        } else if ($field->field_type == "LISTBOX") {
            if($field->items) echo CHtml::activeListBox($profile, $field->varname, unserialize($field->items));
        } else if ($field->field_type == "RADIOBUTTONLIST") {
            if($field->items) echo CHtml::activeListBox($profile, $field->varname, unserialize($field->items));
        } else {
            echo CHtml::activeTextField($profile, $field->varname, array('size' => (($field->field_size_min) ? $field->field_size_min : 25), 'maxlength' => (($field->field_size) ? $field->field_size : 255)));
        }
        echo CHtml::error($profile, $field->varname);
        echo CHtml::closeTag('div');
    }
    ?>


    <div class="row">
    <?php /*
    echo $activeform->labelEx($profile, 'nature_of_interest');
    echo $activeform->checkBoxList($profile, 'nature_of_interest', array('Developer' => 'Developer', 'Equipment/Technology Supplier' => 'Equipment/Technology Supplier', 'Financier' => 'Financier', 'Civils Contractor' => 'Civils Contractor', 'Legal/Financial/Technical Advisor' => 'Legal/Financial/Technical Advisor', 'Municipality' => 'Municipality', 'Government' => 'Government'));
    echo CHtml::label('Technology', 'GProfile_technology');
    echo CHtml::checkBoxList('GProfile[technology][]', array(), array('Onshore wind' => 'Onshore wind', 'Solar photovoltaic' => 'Solar photovoltaic', 'Biomass' => 'Biomass', 'Biogas' => 'Biogas', 'Landfill gas' => 'Landfill gas'));
    $this->beginWidget('onclick', array('target' => '#GProfile_nature_of_interest_1'));
    echo 'if($("#GProfile_nature_of_interest_1").is(":checked") ||
                 $("#GProfile_nature_of_interest_2").is(":checked")) {
                     $("#GProfile_technology").show();
                     $("label[for=GProfile_technology]").show();
              } else {
                 $("#GProfile_technology").hide();
                 $("label[for=GProfile_technology]").hide();
                 $("#GProfile_technology input").removeAttr("checked");
              }';
    $this->endWidget(); */
    ?>
    </div>

    <div class="row submit">
        <?php echo CHtml::submitButton(G::t('Registration')); ?>
    </div>

        <?php $this->endWidget(); ?>
</div><!-- form -->
