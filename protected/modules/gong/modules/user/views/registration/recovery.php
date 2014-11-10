<? 
$this->pageTitle = G::t('Password recovery');

$this->breadcrumbs=array(
	G::t('Login') => "auth/login",
	G::t('Restore'));

?>
<? if(G::hasFlash()) {
echo '<div class="alert alert-success">';
echo G::getFlash(); 
echo '</div>';
} else {
echo '<h2>'.G::t('Password recovery').'</h2>';
?>

<div class="form">
<? echo CHtml::beginForm(); ?>

	<? echo CHtml::errorSummary($form); ?>
	
	<div class="row">
		<? echo CHtml::activeLabel($form,'login_or_email'); ?>
		<? echo CHtml::activeTextField($form,'login_or_email') ?>
		<p class="hint"><? echo G::t("Please enter your user name or email address."); ?></p>
	</div>
	
	<div class="row submit">
		<? echo CHtml::submitButton(G::t('Restore')); ?>
	</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->
<? } ?>
