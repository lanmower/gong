<?php

class GModelList extends CAction {

    public function getCriteria() {
        $criteria = new CDbCriteria();
        $className = $this->controller->modelClassname;
        if (is_array($className::model()->getBehaviors()) && array_key_exists('OwnershipBehavior', $className::model()->getBehaviors())) {
            Yii::app()->user->isGuest ? null : $user = Yii::app()->user->id;
            if (isset($user)) {
                $criteria->addCondition("t.`userId` = $user");
            } else {
                $criteria->addCondition("t.`view` = \"*\"");
            }
        }
        return $criteria;
    }

    public function run() {
        $className = $this->controller->modelClassname;
        $defaultOrder = null;
        if(isset($className::model()->defaultOrder)) {
            $defaultOrder = $className::model()->defaultOrder;
        }
        
        $dataProvider = new CActiveDataProvider(
                $className, array('criteria' => $this->criteria,
                    'sort'=>array('defaultOrder'=>$defaultOrder)
                    )
                );
        $this->controller->render('list', array('data' => $dataProvider->getData(), 'dataProvider' => $dataProvider, 'model' => $className::model()));
    }

}

?>
