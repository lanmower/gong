<?php
class GModelView extends CAction {
	public function run($id) {
		$model = $this->controller->loadModel ( $id );
		$dataProvider = null;
		$relations = $model->relations ();
		if (isset ( $relations ['children'] )) {
			$className = $this->controller->modelClassname;
			$criteria = new CDbCriteria ( array (
					'condition' => "t.`parentId` = " . PseudoCrypt::unhash ( $id ) 
			) );
			$defaultOrder = null;
			if (isset ( $className::model ()->childModel->defaultOrder )) {
				$defaultOrder = $className::model ()->childModel->defaultOrder;
			}
			$dataProvider = new CActiveDataProvider ( $className::model ()->childModel, array (
					'criteria' => $criteria,
					'sort' => array (
							'defaultOrder' => $defaultOrder 
					),
					'pagination' => array (
							'pageSize' => 999 
					) 
			) );
		}
		$this->controller->render ( 'view', array (
				'model' => $model,
				'dataProvider' => $dataProvider 
		) );
	}
}
?>
