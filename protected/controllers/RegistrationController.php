<?php

Yii::import('gong.modules.user.controllers.GRegistrationController');

class RegistrationController extends GRegistrationController {
    

    public function beforeAction($action) {
        if (isset($_POST['GProfile']['nature_of_interest']) && is_array($_POST['GProfile']['nature_of_interest']))
            $_POST['GProfile']['nature_of_interest'] =
                    implode(', ', $_POST['GProfile']['nature_of_interest']);
        
        if (isset($_POST['GProfile']['technology']) && is_array($_POST['GProfile']['technology']))
            $_POST['GProfile']['nature_of_interest'] .=
                    ' Technologies: ' .
                    implode(', ', $_POST['GProfile']['technology']);
        
        return parent::beforeAction($action);
    }

}

?>