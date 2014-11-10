<?php
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class'=>'GContent'));  ?>

<h2> <?php echo Gong::t('Your IPP Projects account has been activated.  Please use your username to sign in and not your email. Thank you for registering.'); ?> </h2>

<p> <?php Gong::t('Click {here} to go to the login form', array(
			'{here}' => CHtml::link(Gong::t('here'), "/gong/auth/login"
				))); ?> </p>
<?php echo CHtml::closeTag('div'); ?>