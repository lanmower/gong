<?php

class GVerifyController extends GController {

    public $defaultAction = 'verify';

    public function accessRules() {
        return array(
            array('allow',
                'actions' => array('verify'),
                'users' => array('@'),
            ),
            /*array('allow',
                'actions' => array('list', 'activateUser'),
                'expression' => 'Yii::app()->user->can("user_activate")'
            ),*/
            array('deny',
                'users'=>array('*'))
        );
    }
    
    /*public function actionList() {
        $data = new CActiveDataProvider(GUser::model());
        $data->setKeys(array('username'));
        $data->setCriteria(array('condition'=>'status != 1'));
        $data->setPagination(false);
        $this->render('list', array('data'=>$data));
        //CVarDumper::dump($data->getData());
    }
    
    public function actionActivateUser($id) {
        $user = GUser::model()->findByPk($id);
        $user->activationKey = $user->generateActivationKey(true);
        $user->status = GUser::STATUS_ACTIVE;        
        if ($user->save(false, array('activationKey', 'status'))) {
            $this->redirect('verify/list');
        }
    }*/

    public function actionVerify() {
        if (isset(Yii::app()->user->data->profile))
            $profile = Yii::app()->user->data->profile;
        else {
            $profile = new GProfile();
            $profile->timestamp = time();
            $profile->firstname = Yii::app()->user->id;
            $profile->lastname = Yii::app()->user->id;
            $profile->privacy = 'protected';
            $profile->save(false);
        }
        $this->redirect('/page/profile');
        /*if(isset($_POST['GProfile'])) $profile->attributes = $_POST['GProfile'];
        if ($profile->validate() && $profile->save()) {
            $this->redirect('/');
        }*/
        /*$this->render('verify', array(
            'profile' => $profile,
        ));*/
    }

}
