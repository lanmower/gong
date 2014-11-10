<h2> <? echo G::t('Your account has been activated'); ?> </h2>

<p> <? G::t('Click {here} to go to the login form', array(
			'{here}' => CHtml::link(G::t('here'), Yii::app()->user->loginUrl
				))); ?> </p>
