<?
echo GDrawWidget::drawWidgetByName('CMSMENU');
echo CHtml::openTag('div', array('class' => 'GContent'));

echo '<h1>' . Gong::t('Manage Permissions'). '</h1>';


$this->widget('zii.widgets.grid.CGridView', array(
			'id'=>'action-grid',
			'dataProvider'=>$model->search(),
			'filter'=>$model,
			'columns' => array(
				array(
					'name' => 'type',
					'value' => '$data->type',
					'filter' => array(
						'type' => Gong::t('User'),
						'role' => Gong::t('Role'),
						)
					),
				array(
					'filter' => false,
					'name' => 'principal',
					'value' => '$data->type == "user" ? $data->principal->username : @$data->principal_role->title'
					), 
				'Action.title',
				'Action.comment',
			array(
					'class'=>'CButtonColumn',
					'template' => '{delete}',
					),
				),

			)
		); 

echo CHtml::closeTag('div');
?>
