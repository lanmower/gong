<h2> <?php echo Gong::t('Activation did not work'); ?> </h2>

<?php if($error == -1) echo Gong::t('The user is already activated'); ?>
<?php if($error == -2) echo Gong::t('Wrong activation Key'); ?>
<?php if($error == -3) echo Gong::t('Profile found, but no associated user. Possible database inconsistency. Please contact the System administrator with this error message, thank you'); ?>
