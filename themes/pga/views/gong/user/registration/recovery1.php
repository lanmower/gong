<? 
$this->pageTitle = G::t('Password recovery');

$this->breadcrumbs=array(
	G::t('Login') => "/gong/user/auth/login",
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
<? echo CHtml::beginForm('', 'post', array('class'=>'targetForm', 'data-target'=>'#tab_4')); ?>

	<? echo CHtml::errorSummary($form); ?>
	
	<div class="row">
		<? echo CHtml::activeLabel($form,'login_or_email'); ?>
		<? echo CHtml::activeTextField($form,'login_or_email') ?>
	</div>
	
	<div class="row submit">
		<? echo CHtml::submitButton(G::t('Restore Password'), $htmlOptions = array('class'=>'btn btn-primary')); ?>
	</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->
<? } ?>
