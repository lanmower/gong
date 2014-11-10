<?php

class GInvoiceController extends GModelController {
    public function accessRules() {
        return array(
            array('allow',
                'actions' => array('delete', 'list', 'view', 'createInvoice', 'send', 'setPaid'),
                'expression' => array('GInvoiceController', 'canUpdate'),
            ),
            array('deny',
                'users' => array('*'),
            )
        );
    }
    
    public function actionSend($id) {
        $model = $this->loadModel($id);
        $model->sent = true;
        $body = $this->render('mail', array('model'=>$model), true);
        Mailer::mail("jvos@lando.co.za", $model->user->profile->email, $body, G::t('invoice subject'));
        $model->saveAttributes(array('sent'));
        $this->setVar();

        $this->render("sent", array('invoice'=>$model, 'invoice-data'=>array(
            array('item'=>"Data usage: $model->sizeHr at $model->rate ZAR / MB", 'price'=>$model->total)),
            array('item'=>"Total", 'price'=>$model->total)
                ));
    }
    
    public function actionView($id) {
        $model = $this->loadModel($id);
        $dataProvider = null;
        $relations = $model->relations();
        if(isset($relations['children'])) {
            $className = $this->modelClassname;
            $criteria = new CDbCriteria(array('condition'=>"t.`parentId` = ".PseudoCrypt::unhash($id)));
            $defaultOrder = null;
            if(isset($className::model()->childModel->defaultOrder)) {
                $defaultOrder = $className::model()->childModel->defaultOrder;
            }
            $dataProvider = new CActiveDataProvider($className::model()->childModel, array('criteria' => $criteria,'sort'=>array('defaultOrder'=>$defaultOrder), 'pagination'=>array('pageSize'=>999)));
        }
        $this->render("view", array('invoice'=>$model, 'invoice-data'=>array(
            array('id'=>$id++, 'item'=>"Data usage: $model->sizeHr at $model->rate ZAR / MB", 'price'=>$model->total),
            array('id'=>$id++, 'item'=>"Total", 'price'=>$model->total))
                ));
    }
    
    
    public function actionSetPaid($id, $paid) {
        $model = $this->loadModel($id);
        $model->paid = $paid;
        $model->saveAttributes(array('paid'));
        $this->render("paidSet", array('model'=>$model));
    }
    
    public function actionCreateInvoice($accountId) {
        $account = GAccount::model()->findByPk(PseudoCrypt::unhash($accountId));
        if(isset($account)) {
            if(isset($_POST['rate'])) {
                if(isset($account)) {
                    $invoice = new GInvoice();
                    $invoice->rate = $_POST['rate'];
                    $invoice->size = $account->size;
                    $invoice->userId = $account->userId;
                    if($invoice->save()) {
                        $account->size = 0;
                        $account->save();
                        $this->render("createDone", array('model'=>$invoice));
                    }
                }
            }
            
            $this->render("create", array('model'=>$account));
        }
    }


}

?>
