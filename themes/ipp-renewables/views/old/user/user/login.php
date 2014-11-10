<?

if(!isset($model)) 
	$model = new GongUserLogin();

$module = Gong::module();
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
echo CHtml::openTag('div', array('class' => 'GContent'));
$this->pageTitle = Gong::t('Sign In');
if(isset($this->title))
//$this->title = Gong::t('Sign In');
$this->breadcrumbs=array(Gong::t('Login'));

Gong::renderFlash();
?>
    <h2>Sign in</h2>
<div class="form inline-form">
<p>
<? 
echo Gong::t(
		'Please fill out the following form with your login credentials:'); ?>
</p>

<? echo CHtml::beginForm(array('login'), 'post');  ?>

<?
if(isset($_GET['action']))
	echo CHtml::hiddenField('returnUrl', urldecode($_GET['action']));
?>

<? echo CHtml::errorSummary($model); ?>
	
	<div class="row">
		<? 
		if($module->loginType & GongModule::LOGIN_BY_USERNAME)
		if($module->loginType & GongModule::LOGIN_BY_EMAIL)
			printf ('<label for="GongUserLogin_username">%s <span class="required">*</span></label>', Gong::t('Username')); 
?>

		<? echo CHtml::activeTextField($model,'username') ?>
	</div>
	
	<div class="row">
		<? echo CHtml::activeLabelEx($model,'password'); ?>
		<? echo CHtml::activePasswordField($model,'password');
 ?>
		
	</div>
	
	<div class="row">
            <label></label><span class="hint">
	<? 
	echo CHtml::link(Gong::t("Registration"),
			"/gong/registration/registration");
	echo ' | ';
	echo CHtml::link(Gong::t("Lost password?"),
			"/gong/registration/recovery");
	?>
</span>
	</div>

<div class="row rememberMe">
    <label></label>
<? echo CHtml::activeCheckBox($model,'rememberMe', array('style' => 'display: inline;')); ?>
<? echo CHtml::activeLabelEx($model,'rememberMe', array('style' => 'display: inline;')); ?>
</div>

<div class="row submit">
<? echo CHtml::submitButton(Gong::t('Login')); ?>
</div>

<? echo CHtml::endForm(); ?>
</div><!-- form -->

<?
$form = new CForm(array(
			'elements'=>array(
				'username'=>array(
					'type'=>'text',
					'maxlength'=>32,
					),
				'password'=>array(
					'type'=>'password',
					'maxlength'=>32,
					),
				'rememberMe'=>array(
					'type'=>'checkbox',
					)
				),

			'buttons'=>array(
				'login'=>array(
					'type'=>'submit',
					'label'=>'Login',
					),
				),
			), $model);
?>
</div>
