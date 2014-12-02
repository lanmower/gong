<?php
$this->pageTitle = G::t ( 'Password recovery' );

$this->breadcrumbs = array (
		G::t ( 'Login' ) => "auth/login",
		G::t ( 'Restore' ) 
);

?>
<?php


if (G::hasFlash ()) {
	echo '<div class="alert alert-success">';
	echo G::getFlash ();
	echo '</div>';
} else {
	echo '<h2>' . G::t ( 'Password recovery' ) . '</h2>';
	?>

<div class="form">
<?php echo CHtml::beginForm(); ?>

	<?php echo CHtml::errorSummary($form); ?>
	
	<div class="row">
		<?php echo CHtml::activeLabel($form,'login_or_email'); ?>
		<?php echo CHtml::activeTextField($form,'login_or_email')?>
		<p class="hint"><?php echo G::t("Please enter your user name or email address."); ?></p>
	</div>

	<div class="row submit">
		<?php echo CHtml::submitButton(G::t('Restore')); ?>
	</div>

<?php echo CHtml::endForm(); ?>
</div>
<!-- form -->
<?php } ?>
