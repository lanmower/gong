<?
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->title = Gong::t('Manage users');

$this->breadcrumbs = array(
	Gong::t('Users') => array('index'),
	Gong::t('Manage'));

echo Gong::renderFlash();

$this->widget('GongModule.components.CsvGridView', array(
	'dataProvider'=>$model->search(),
	'filter' => $model,
		'columns'=>array(
			array(
				'name'=>'id',
				'filter' => false,
				'type'=>'raw',
				'value'=>'CHtml::link($data->id,
				array("//user/user/update","id"=>$data->id))',
				),
			array(
				'name'=>'username',
				'type'=>'raw',
				'value'=>'CHtml::link(CHtml::encode($data->username),
				array("//user/user/view","id"=>$data->id))',
			),
			array(
				'name'=>'createtime',
				'filter' => false,
				'value'=>'date(GongModule::$dateFormat,$data->createtime)',
			),
			array(
				'name'=>'lastvisit',
				'filter' => false,
				'value'=>'date(GongModule::$dateFormat,$data->lastvisit)',
			),
			array(
				'name'=>'status',
				'filter' => false,
				'value'=>'GongUser::itemAlias("UserStatus",$data->status)',
			),
			array(
				'name'=>Gong::t('Roles'),
				'type' => 'raw',
				'visible' => Gong::hasModule('role'),
				'filter' => false,
				'value'=>'$data->getRoles()',
			),
			array(
				'class'=>'application.modules.haw.widgets.HawButtonColumn',
			),
))); ?>

<? echo CHtml::link(Gong::t('Create new User'), array(
			'//user/user/create')); 

echo CHtml::closeTag('div');
?>

