<?
//CAll Widget ID echo GDrawWidget::drawWidgetByPk('widgetForm-815');
//echo GDrawWidget::drawWidgetByPk(1805, false, false);

/*$this->widget('bootstrap.widgets.TbNavbar', array(
	'brand' => 'CMS Menu',
       'fixed' => false,
	'items' => array(
		array(
			'class' => 'bootstrap.widgets.TbMenu',
			'items' => array(
				array('label'=>'Actions', 'items'=> array(
				     array('label'=>'Admin', 'url'=>'/cms/action/admin'),
                                    array('label'=>'Create', 'url'=>'/cms/action/create')
				)),
                                
                                array('label'=>'Membership', 'url' => '/cms/membership/admin'),
                                
                                array('label'=>'Permission', 'items'=> array(
				     array('label'=>'Admin', 'url'=>'/permission/admin'),
                                    array('label'=>'Create', 'url'=>'/cms/permission/create')
				)),
                                
                                array('label'=>'Role', 'items'=> array(
				     array('label'=>'Admin', 'url'=>'/cms/role/admin'),
                                    array('label'=>'Create', 'url'=>'/cms/role/create')
				)),
                                
                                array('label'=>'Users', 'url'=> '/cms/user/admin')
                            
			)
		)
          
	), 'htmlOptions' => array('class' => 'navCMS')
));*/


echo CHtml::openTag('div', array('class' => 'GContent'));
?>


<h1> <? echo Gong::t('Manage Roles'); ?></h1>


<?
$this->breadcrumbs=array(
	Gong::t('Roles')=>array('index'),
	Gong::t('Manage'),
);

?>

<? $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$dataProvider,
	'columns'=>array(
		array(
			'name' => 'title',
			'type' => 'raw',
			'value'=> 'CHtml::link(CHtml::encode($data->title),
				array(Gong::route("role/view"),"id"=>$data->id))',
		),
		'price',
		'membership_priority',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>

<?

$this->widget('bootstrap.widgets.TbButton',array(
	'label' => 'Create Role',
	'size' => 'small',
        'url' => '/cms/role/create',
        'htmlOptions' => array('class' => '')
));

echo CHtml::closeTag('div'); ?>
