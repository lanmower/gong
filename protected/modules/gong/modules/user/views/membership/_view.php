<div class="view">

	<h2> <?php echo $data->role->description; ?> </h2>

<?php
echo G::t ( 'Order number' ) . ': ' . $data->id . '<br />';
if ($data->role->price != 0)
	if ($data->payment_date == 0)
		echo G::t ( 'Membership has not been payed yet' );
	else {
		echo G::t ( 'Membership payed at: {date}', array (
				'{date}' => date ( 'd. m. Y', $data->payment_date ) 
		) );
		echo '<br />';
		echo G::t ( 'Membership ends at: {date} ', array (
				'{date}' => date ( 'd. m. Y', $data->end_date ) 
		) );
		echo '<br />';
	}
?>

<?php if($data->role->price != 0) { ?>
<br /> 
<?php echo G::t('Ordered at') . ': '; ?>
<?php echo date('d. m. Y', $data->order_date); ?> 
<br /> 
<?php echo G::t('Payment type') . ': '; ?>
<?php if(isset($data->payment)) echo $data->payment->title . '<br />'; ?>
<?php } ?>

<?php
if ($data->end_date != 0)
	echo G::t ( 'This membership is still active {days} days', array (
			'{days}' => $data->daysLeft () 
	) );
?>


<?php if($data->isActive()) { ?>
<?php CHtml::beginForm(array('//membership/membership/extend')); ?>
<p> <?php G::t('When the membership expires'); ?>: </p>
<?php
	$options = array (
			0 => G::t ( 'Automatically extend subscription' ),
			'cancel' => G::t ( 'Cancel Subscription' ) 
	);
	foreach ( $data->getPossibleExtendOptions ( 'downgrade' ) as $key => $option )
		$options [$key] = $option;
	foreach ( $data->getPossibleExtendOptions ( 'upgrade' ) as $key => $option )
		$options [$key] = $option;
	
	echo CHtml::hiddenField ( 'roleId', $data->id );
	echo CHtml::dropDownList ( 'subscription', $data->subscribed == - 1 ? 'cancel' : $data->subscribed, $options );
	echo CHtml::submitButton ( G::t ( 'Save' ) );
	?>
	<?php CHtml::endForm(); ?>
<?php } ?>
</div>
