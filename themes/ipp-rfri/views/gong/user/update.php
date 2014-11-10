<?
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
echo CHtml::tag('h2', array(), 'Edit User Management', true);
if(empty($tabularIdx))
{
	$this->title=Gong::t('Update user')." ".$model->id;

	$this->breadcrumbs = array(
			Gong::t('Users')=>array('index'),
			$model->username=>array('view','id'=>$model->id),
			Gong::t('Update'));
}

echo $this->renderPartial('/user/_form', array(
			'model'=>$model,
			'passwordform'=>$passwordform,
			'changepassword' => isset($changepassword) ? $changepassword : false,
			'profile'=>$profile,
			'tabularIdx'=> isset($tabularIdx) ? $tabularIdx : 0)
		);
echo CHtml::closeTag('div');
?>
