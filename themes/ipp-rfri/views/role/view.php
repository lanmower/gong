<?
//echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
?>

<h1><? echo Gong::t('View {role} Role', array(
			'{role}' => $model->title)); ?></h1>
<?

$this->breadcrumbs=array(
	Gong::t('Roles')=>array('index'),
	Gong::t('View'),
	$model->title
);

echo $model->description;


 ?>

<br />
<? echo Gong::p('These users have been assigned to this role'); ?> 

<? 
if($assignedUsers);
$this->widget('zii.widgets.grid.CGridView', array(
    'dataProvider'=>$assignedUsers,
    'columns'=>array(
        'username',          
        'status',          
    ),
));
?>
<br />

<?
if(Gong::hasModule('membership') && $model->membership_priority) {
		echo Gong::t('Membership priority') . ': '. $model->membership_priority . '<br />';
		echo Gong::t('Membership price') . ': '. $model->price . '<br />';
		echo Gong::t('Membership duration') . ': '. $model->duration . '<br />';

		echo Gong::p('These users have a ordered memberships of this role'); 

		if($activeMemberships)
			$this->widget('zii.widgets.grid.CGridView', array(
						'dataProvider'=>$activeMemberships,
						'columns'=>array(
							'id',
							'user.username',
							array(
								'name'=>'order_date',
								'value' =>'date("Y. m. d G:i:s", $data->order_date)'),
							array(
								'name'=>'end_date',
								'value' =>'date("Y. m. d G:i:s", $data->end_date)'),
							array(
								'name'=>'payment_date',
								'value' =>'date("Y. m. d G:i:s", $data->payment_date)'),
							'role.price',
							'payment.title',
							),
						));

	}

if(Yii::app()->user->isAdmin())
	echo CHtml::Button(Gong::t('Update role'), array(
				'submit' => array(
					'role/update', 'id' => $model->id)));

?>
<?php echo CHtml::closeTag('div'); ?>
