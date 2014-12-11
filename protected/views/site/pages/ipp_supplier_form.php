<?php
$this->pageTitle = Yii::app()->name . ' - Supplier Form';
$this->breadcrumbs = array(
    'Supplier Form',
);
        $cs = Yii::app()->getClientScript();
        $imgDirectory = $cs->getCoreScriptUrl().'/images/ipp/';?>

<?php ob_start(); ?>
    <nav>
        <ul>
          <li><?php echo CHtml::link("Bidder Dashboard", $this->createUrl("/site/page/view/dashboard")); ?></li>
          <li><?php echo CHtml::link("Local Suppliers", $this->createUrl("/site/page/view/ipp_suppliers")); ?></li>
        </ul>
      </nav>
<?php $this->billboard = ob_get_clean(); ?>
  
<div class="row">
      <div class="span12">      
        <h2>Local Supplier submission</h2>
        <p>Suppliers who wish to add their names to the Local Suppliers List can submit:</p>
        <form id="freeform" name="a" method="post" action="javascript:;">
                 
          <p><label for="Name">Name:</label> <input type="text" name="name"></p>
          <p><label for="Company">Company:</label> <input type="text" name="company"></p>
          <p><label for="from">Email:</label> <input type="text" id="from" name="from" size="40" maxlength="35"></p>
          <p><label for="subject">Subject:</label> <input type="text" id="subject" name="subject" size="40"></p>
          <p><label for="phone1">Phone:</label> <input type="text" id="phone1" name="phone1" size="40"></p>

          <p>
            <label for="technology">Technology:</label> 
            <select name="technologye" id="technology">
                            <option value="Biogas">Biogas</option>
                            <option value="Biomass">Biomass</option>
                            <option value="Landfill Gas">Landfill Gas</option>
                            <option value="Small Hydro">Small Hydro</option>
                            <option value="Solar PV">Solar PV</option>
                            <option value="Solar CSP">Solar CSP</option>
                            <option value="Wind">Wind</option>
            </select>
          </p>

          <p><label for="component">Components:</label><textarea id="component" class="textarea" name="component" rows="18" cols="40">Please provide keywords</textarea></p>

          <p><input name="submit" class="submit_button btn" type="submit" value="Submit"></p>

        </form> 
      </div>
    </div>