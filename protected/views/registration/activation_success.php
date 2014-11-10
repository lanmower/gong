<h2> <? echo Gong::t('Your account has been activated'); ?> </h2>

<p> <? Gong::t('Click {here} to go to the login form', array(
			'{here}' => CHtml::link(Gong::t('here'), Yii::app()->user->loginUrl
				))); ?> </p>
