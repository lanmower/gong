<?php

class RfriForms extends GBaseWidget {
    
    public function run() {
        $columns = "";
        $this->tag = 'div';
        $this->htmlOptions = array('class' => 'well');
        $this->content = '<h4>Completed RFRI Forms</h4>';
        $columns .= '<th width="25">#</th>';
        $columns .= '<th width="50%">Project Name</th>';
        $columns .= '<th width="74">Summary</th>';
        $columns .= '<th width="74">Print</th>';
        $this->content .= '<table class="jtable rfriDashboard rfriForm"><thead><tr class="jtable-column-header">'.$columns.'</tr></thead><tbody>';
        $forms = RfriForm::model()->findAll("userId = ".Yii::app()->user->id." AND done = 'true'");       
        foreach($forms as $form) {
            if($form->isComplete()) $this->content .= "<tr class='jtable-data-row jtable-row-even'>
                <td class='tableGrid'>" . $form->id . "</td>
                <td class='tableGrid'>" . $form->projectName . "</td>
                <td class='tableGrid'>".
                CHtml::link(
                    '<i class="icon-list-alt"></i>', '/rfri/printSimplified/id/'.$form->id, array('class'=>'nohijack', 'target'=>'_blank', 'style' => 'display: block;text-align: center;')
                        )."</td>
                <td class='tableGrid'>".
                CHtml::link(
                    '<i class="icon-print"></i>', '/rfri/print/id/'.$form->id, array('class'=>'nohijack', 'target'=>'_blank', 'style' => 'display: block;text-align: center;')
                        )."</td></tr>";
                
            
        }
        
        $this->content .= '</tbody></table>';
        parent::run();
    }
}

?>
