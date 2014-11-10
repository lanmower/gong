<?
$this->title = Gong::t('Confirm deletion');

$this->breadcrumbs = array(
	Gong::t('Delete account'));

printf('<h2>%s</h2>', Gong::t('Are you really sure you want to delete your Account?'));

printf('<p>%s</p>', Gong::t('Please enter your password to confirm deletion:'));

echo CHtml::form(array('delete'));
echo CHtml::passwordField('confirmPassword') . "<br />";
echo CHtml::linkButton(Gong::t('Cancel deletion'), array(
			'submit' => array('profile')));
echo CHtml::submitButton(Gong::t('Confirm deletion'));
echo CHtml::endForm();
?>
