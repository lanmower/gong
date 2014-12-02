<h2> <?php echo G::t('Your account has been activated'); ?> </h2>

<p> <?php

G::t ( 'Click {here} to go to the login form', array (
		'{here}' => CHtml::link ( G::t ( 'here' ), Yii::app ()->user->loginUrl ) 
) );
?> </p>
