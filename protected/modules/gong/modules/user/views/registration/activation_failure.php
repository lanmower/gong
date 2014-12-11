<h2> <?php echo G::t('Activation did not work'); ?> </h2>

<?php if($error == -1) echo G::t('The user is already activated'); ?>
<?php if($error == -2) echo G::t('Wrong activation Key'); ?>
<?php if($error == -3) echo G::t('Profile found, but no associated user. Possible database inconsistency. Please contact the System administrator with this error message, thank you'); ?>
