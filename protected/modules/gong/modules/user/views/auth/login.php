<div class="GContent">
    <?
    if (!isset($model))
        $model = new GUserLogin();

    $module = Gong::module();
    $this->pageTitle = G::t('Sign In');
    if (isset($this->title))
//$this->title = G::t('Sign In');
        $this->breadcrumbs = array(G::t('Login'));
    echo CHtml::openTag('div', array('style' => 'color:white;'));
    G::renderFlash();
    echo CHtml::closeTag('div');
    ?>
    <h2>Sign in</h2>
    <div class="form inline-form">
        <p>
<?
echo G::t(
        'Please fill out the following form with your login credentials:');
?>
        </p>

        <? echo CHtml::beginForm(array('login'), 'post'); ?>

        <?
        if (isset($_GET['action']))
            echo CHtml::hiddenField('returnUrl', urldecode($_GET['action']));
        ?>

        <? echo CHtml::errorSummary($model); ?>

        <div class="row">
            <?
            $label = '';
            if ($module->loginType & GongModule::LOGIN_BY_USERNAME) {
                $label = 'Username';
                if ($module->loginType & GongModule::LOGIN_BY_EMAIL)
                    $label .= ' / Email';
            }
            echo CHtml::label($label, 'GUserLogin[username]');
            echo CHtml::activeTextField($model, 'username')
            ?>
        </div>

        <div class="row">
            <? echo CHtml::activeLabelEx($model, 'password'); ?>
            <? echo CHtml::activePasswordField($model, 'password');
            ?>

        </div>

        <div class="row">
            <label></label><span class="hint">
                <?
                echo CHtml::link(G::t("Registration"), "registration/registration");
                echo ' | ';
                echo CHtml::link(G::t("Lost password?"), "registration/recovery");
                ?>
            </span>
        </div>

        <div class="row rememberMe">
            <?
                echo CHtml::checkBox('GUserLogin[rememberMe]', false, array('style' => 'display: inline;'));
                echo CHtml::label('Stay signed in', 'GUserLogin[rememberMe]');
            ?>
        </div>

        <div class="row submit">
            <? echo CHtml::submitButton(G::t('Login')); ?>
        </div>

        <? echo CHtml::endForm(); ?>
    </div> <!-- Form -->
</div>