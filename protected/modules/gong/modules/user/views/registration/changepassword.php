<?php
$this->pageTitle = G::t ( "change password" );
echo '<h2>' . G::t ( 'change password' ) . '</h2>';

$this->breadcrumbs = array (
		G::t ( "Change password" ) 
);

if (isset ( $expired ) && $expired)
	$this->renderPartial ( 'password_expired' );
?>

<div class="form">
<?php echo CHtml::beginForm(); ?>
	<?php echo G::requiredFieldNote(); ?>
	<?php echo CHtml::errorSummary($form); ?>

	<?php
	
if (! Yii::app ()->user->isGuest) {
		echo '<div class="row">';
		echo CHtml::activeLabelEx ( $form, 'currentPassword' );
		echo CHtml::activePasswordField ( $form, 'currentPassword' );
		echo '</div>';
	}
	?>

<?php

$this->renderPartial ( 'GongModule.modules.user.views.user.passwordfields', array (
		'form' => $form 
) );
?>

	<div class="row submit">
	<?php echo CHtml::submitButton(G::t("Save")); ?>
	</div>

<?php echo CHtml::endForm(); ?>
</div>
<!-- form -->
