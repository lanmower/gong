<div class="view">

<h2> <? echo $data->role->description; ?> </h2>

<?
echo G::t('Order number'). ': '.$data->id . '<br />';
if($data->role->price != 0)
	if($data->payment_date == 0) 
	echo G::t('Membership has not been payed yet');
	else {
		echo G::t('Membership payed at: {date}', array(
					'{date}' =>  date('d. m. Y', $data->payment_date)));
		echo '<br />';
		echo G::t('Membership ends at: {date} ', array(
					'{date}' =>  date('d. m. Y', $data->end_date)));  
		echo '<br />';
	}
?>

<? if($data->role->price != 0) { ?>
<br /> 
<? echo G::t('Ordered at') . ': '; ?>
<? echo date('d. m. Y', $data->order_date); ?> 
<br /> 
<? echo G::t('Payment type') . ': '; ?>
<? if(isset($data->payment)) echo $data->payment->title . '<br />'; ?>
<? } ?>

<?
if($data->end_date != 0)
	echo G::t('This membership is still active {days} days', array(
				'{days}' => $data->daysLeft()));
	?>


<? if($data->isActive()) { ?>
<?= CHtml::beginForm(array('//membership/membership/extend')); ?>
<p> <?= G::t('When the membership expires'); ?>: </p>
<?
$options = array(
		0 => G::t('Automatically extend subscription'),
		'cancel' => G::t('Cancel Subscription'));
foreach( $data->getPossibleExtendOptions('downgrade') as $key => $option)
	$options[$key] = $option;
foreach( $data->getPossibleExtendOptions('upgrade') as $key => $option)
	$options[$key] = $option;

echo CHtml::hiddenField('roleId', $data->id);
echo CHtml::dropDownList('subscription',
		$data->subscribed == -1 ? 'cancel' : $data->subscribed, $options); 
echo CHtml::submitButton(G::t('Save'));
?>
	<?= CHtml::endForm(); ?>
<? } ?>
</div>
