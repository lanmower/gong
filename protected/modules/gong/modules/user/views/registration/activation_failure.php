<h2> <? echo G::t('Activation did not work'); ?> </h2>

<? if($error == -1) echo G::t('The user is already activated'); ?>
<? if($error == -2) echo G::t('Wrong activation Key'); ?>
<? if($error == -3) echo G::t('Profile found, but no associated user. Possible database inconsistency. Please contact the System administrator with this error message, thank you'); ?>
