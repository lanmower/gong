<? 
$this->pageTitle = G::t("change password");
echo '<h2>'. G::t('change password') .'</h2>';

$this->breadcrumbs = array(
	G::t("Change password"));

if(isset($expired) && $expired)
	$this->renderPartial('password_expired');
?>

<div class="form">
<? echo CHtml::beginForm(); ?>
	<? echo G::requiredFieldNote(); ?>
	<? echo CHtml::errorSummary($form); ?>

	<? if(!Yii::app()->user->isGuest) {
		echo '<div class="row">';
		echo CHtml::activeLabelEx($form,'currentPassword'); 
		echo CHtml::activePasswordField($form,'currentPassword'); 
		echo '</div>';
	} ?>

<? $this->renderPartial(
		'/user/passwordfields', array(
			'form'=>$form)); ?>

	<div class="row submit">
	<? echo CHtml::submitButton(G::t("Save")); ?>
	</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->
