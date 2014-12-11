<?php
$this->pageTitle = Yii::app()->name . ' - Suppliers';
$this->breadcrumbs = array(
    'Suppliers',
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
  
<div class="row center">
         
      <h2>South Africa Suppliers</h2>
      <p>Suppliers who wish to add their names to the Local Suppliers List can <?php echo CHtml::link("Submit", $this->createUrl("/site/page/view/ipp_supplier_form")); ?>.</p>
      <table class="table table-striped table-bordered table-condensed">
        <thead>
          <tr>
            <th>Technology</th>
            <th>Company</th>
            <th>Component</th>
            <th>Contact</th>
            <!-- IF ADMIN <th>Pending</th>-->
          </tr>
        </thead>
        <tbody>

          <tr>
            <td>Solar PV</td>
            <td>Tellumat</td>
            <td>Inverters/PV panels/Smart Meters</td>
            <td><p>(021) 710 2911</p></td>
            <!--<td><p><a href="javascript:;">Accept</a> <a href="javascript:;">Reject</a></p></td>-->
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>ArcelorMittal</td>
            <td>Plate &amp; Hot Rolled steel</td>
            <td><p>016 889 8802/0834681525</p></td>
            <!--<td><p><a href="javascript:;">Accept</a> <a href="javascript:;">Reject</a></p></td>-->
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Robor</td>
            <td>Pipe Systems</td>
            <td><p>011 971 4300</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Tellumat</td>
            <td>Instrumentation &amp; Electronics</td>
            <td><p>(021) 710 2911</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Controllec</td>
            <td>Instrumentation &amp; Control System Design</td>
            <td><p>(011) 468 3065</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>CBI Electric</td>
            <td>cabling</td>
            <td><p>(016) 430 6000</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>General Cable</td>
            <td>cabling</td>
            <td><p>(011) 824 4747</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Chopper Worx</td>
            <td>cabling</td>
            <td><p>(011) 021 9414</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Industrial Cables (South Africa)</td>
            <td>cabling</td>
            <td><p>(011) 683 3203/4/5/6</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Semikron South Africa</td>
            <td>IGBT Stacks</td>
            <td><p>(012) 3456060</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Melex Industrial CC</td>
            <td>Enclosures and sheet metal</td>
            <td><p>(021) 712-9284</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Joffe sheet metal</td>
            <td>Enclosures and sheet metal</td>
            <td><p>(021) 534 8819</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Calculus</td>
            <td>Enclosures and sheet metal</td>
            <td><p>(021) 873 3372</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>CDE</td>
            <td>Enclosures and sheet metal</td>
            <td><p>(021) 510 7040</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Eloff transformers</td>
            <td>Transformers and inductors</td>
            <td><p>(021) 552 6800</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Associated Tranformer</td>
            <td>Transformers and inductors</td>
            <td><p>(021) 949 0186</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Ingeteam</td>
            <td>Full Converter</td>
            <td><p>(021) 421 9764; (+27) 766 124 221</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>AEG</td>
            <td>Full Converter</td>
            <td><p>21</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>MLT Drives</td>
            <td>Full Converter</td>
            <td><p>(021) 674 2823</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>SolaireDirect</td>
            <td>Crystalline Module</td>
            <td><p>(021) 763 5901</p></td>
          </tr> 
          

          <tr>
            <td>Solar PV</td>
            <td>Tenesol</td>
            <td>Crystalline Module</td>
            <td><p>(021) 9536000</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ArcelorMittal</td>
            <td>Plate &amp; Hot Rolled steel</td>
            <td><p>016 889 8802/0834681525</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Robor</td>
            <td>Pipe Systems</td>
            <td><p>011 971 4300</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Wind Towers Africa</td>
            <td>Towers</td>
            <td><p>011 306 8000/082 651 5362</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>GasCon</td>
            <td>Towers</td>
            <td><p>(021) 590 5280</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>DCD-Dorbyl</td>
            <td>Flanges/Towers</td>
            <td><p>(016) 428 0185</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Isivunguvungu Wind Energy Convert (iWEC)</td>
            <td></td>
            <td><p>(021) 418 2682</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>LM Blades</td>
            <td>Blades</td>
            <td><p>+31 (0) 20 3043 739</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>SAERTEX South Africa (Pty) Ltd</td>
            <td>Nacelle Housing</td>
            <td><p>(021) 862 7790</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ABB (SA)</td>
            <td>Cooling System</td>
            <td><p>(010) 202 5000</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ABB (SA)</td>
            <td>Yaw System</td>
            <td><p>(010) 202 5000</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Drive And Gear Engineering cc</td>
            <td></td>
            <td><p>(021) 593 3290</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>CME Precision (Pty) Ltd</td>
            <td></td>
            <td><p>(021) 505 9600</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Hansen Transmissions (SA)</td>
            <td></td>
            <td><p>(011) 397 2495</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ZF Auto Industrial Brakes and Chassis(SA)</td>
            <td>Gearbox</td>
            <td><p>(011) 9225600</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Hawker Siddeley Electric Africa</td>
            <td></td>
            <td><p>(011) 827 3458/9</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Mega Volt Loden</td>
            <td></td>
            <td><p>(012) 803 4456</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Trans Electron Transformers</td>
            <td></td>
            <td><p>(011) 873 1016</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Reliable Transformers</td>
            <td></td>
            <td><p>(011) 421 2333</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Transformer Manufacturers Pty Ltd (JHB)</td>
            <td></td>
            <td><p>(011) 873 9801/6</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ABB South Africa (JHB)</td>
            <td></td>
            <td><p>(010) 202 6061</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Eloff Transformers (CT)</td>
            <td></td>
            <td><p>(021) 552 6800</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Powertech Transformers</td>
            <td>Transformer</td>
            <td><p>(021) 534 2681</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>CBI electric</td>
            <td></td>
            <td><p>(016) 430 6000</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>General Cable</td>
            <td></td>
            <td><p>(011) 824 4747</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Chopper Worx</td>
            <td></td>
            <td><p>(011) 021 9414</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Industrial Cables (South Africa)</td>
            <td>Power Cable</td>
            <td><p>(011) 683 3203/4/5/6</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>ABB (SA)</td>
            <td>Generator</td>
            <td><p>(010) 202 5000</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>MLT Drives</td>
            <td>Converter</td>
            <td><p>(021) 674 2823</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Controllec</td>
            <td></td>
            <td><p>(011) 468 3065</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Denyl Dynamics</td>
            <td></td>
            <td><p>(012) 671 1001</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Feedback Electronics</td>
            <td></td>
            <td><p>(031) 579 2008</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>AGE Technologies</td>
            <td></td>
            <td><p>(011) 869 3925</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Fox Controls</td>
            <td></td>
            <td><p>(011) 886 3466</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Optimal Energy</td>
            <td></td>
            <td><p>(021) 462 7804</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Beckhoff</td>
            <td></td>
            <td><p>(021) 526 0373</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>SA Power</td>
            <td></td>
            <td><p>(021) 794 5682</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Tellumat</td>
            <td>Control System</td>
            <td><p>(021) 710 2911</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Cape Cables</td>
            <td></td>
            <td><p>(021) 555 2222</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Marine Electrical Supplies</td>
            <td></td>
            <td><p>(021) 511 6128</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Stamcor Electric</td>
            <td></td>
            <td><p>(021) 511 8143</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Power Cable Supplies (SA)</td>
            <td>Cables (Inside Nacelle)</td>
            <td><p>(021) 551 3090</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Legrand</td>
            <td></td>
            <td><p>(011) 444 7971</p></td>
          </tr> 
          

          <tr>
            <td>Wind</td>
            <td>Cabstrut</td>
            <td>Cable Trays</td>
            <td><p>(021) 531 0950/1</p></td>
          </tr> 
          

        </tbody>
      </table>

   </div>