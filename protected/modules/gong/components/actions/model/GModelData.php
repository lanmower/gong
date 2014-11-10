<?php

class GModelData extends CAction {

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

        $criteria = $this->criteria;

        if (isset($_REQUEST['sSearch']) && isset($_REQUEST['sSearch']{0})) {
            $criteria->addSearchCondition('', $_REQUEST['sSearch'], true);
        }

        $sort = new EDTSort($className, $_GET['sColumns']/* sortable columns array? */);
        $sort->defaultOrder = 'id';
        $pagination = new EDTPagination();

        $dataProvider = new CActiveDataProvider($className, array(
                    'criteria' => $criteria,
                    'pagination' => $pagination,
                    'sort' => $sort,
                ));

        $columns = array();
        foreach ($_GET['columns'] as $key => $column) {
            if (isset($column['name']) || isset($column['value']))
                $coumns[] = $column;
        }
        //die(CVarDumper::dump($_GET['columns'], 10, true));
        $widget = $this->controller->createWidget('ext.edatatables.EDataTables', array(
            'id' => 'products',
            'dataProvider' => $dataProvider,
            'ajaxUrl' => $this->controller->createUrl('data'),
            'columns' => $columns,
                ));
        foreach (Yii::app()->log->routes as $route) {
            if ($route instanceof CWebLogRoute || $route instanceof YiiDebugToolbarRoute) {
                $route->enabled = false; // disable any weblogroutes
            }
        }
        echo json_encode($widget->getFormattedData(intval($_REQUEST['sEcho'])));
        foreach (Yii::app()->log->routes as $route) {
            $route->enabled = false;
        }
        Yii::app()->end();
    }

}

?>
