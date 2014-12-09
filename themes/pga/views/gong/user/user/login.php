<div class="GContent">
    <?
    if (!isset($model))
        $model = new GUserLogin();

    $module = Gong::module();
    $this->pageTitle = G::t('Sign In');
    if (isset($this->title))
        $this->breadcrumbs = array(G::t('Login'));
    ?>
    <div class="form SignIn">

        <? echo CHtml::beginForm(array('login'), 'post', array('class'=>'nohijack')); ?>

        <?
        if (isset($_GET['action']))
            echo CHtml::hiddenField('returnUrl', urldecode($_GET['action']));
        ?>

        <? echo CHtml::errorSummary($model); ?>

        <div class="Block Inline">
            <?
            $label = '';
            if ($module->loginType & GongModule::LOGIN_BY_USERNAME) {
                $label = 'Username';
                if ($module->loginType & GongModule::LOGIN_BY_EMAIL)
                    $label .= ' / Email';
            }
            echo CHtml::label($label, 'GUserLogin[username]');
            echo CHtml::activeTextField($model, 'username', $htmlOptions = array('class' => 'form-control input-large'));
            ?>
        </div>

        <div class="Block Inline">
            <?
            echo CHtml::Label('Password', 'GUserLogin[password]');
            echo CHtml::activePasswordField($model, 'password', $htmlOptions = array('class' => 'form-control input-large'));
            ?>


        </div>

        <div class="Block SubmitBtn">
            <? echo CHtml::submitButton(G::t('Login'), $htmlOptions = array('class' => 'btn btn-large btn-info')); ?>

           <?
           
            echo BsHtml::button('Remember Me',array('toggle' => BsHtml::BUTTON_TOGGLE_CHECKBOX, 'color' => BsHtml::BUTTON_COLOR_INFO, 'class' => 'btn-large'));
            ?>
        </div>
        <div>
            <span class="hint">
                <?
                echo CHtml::openTag('span', array('class' => 'Left'));
                echo CHtml::link(G::t("Sign Up"), '/gong/user/registration/registration', $htmlOptions = array('class' => 'btn btn-large btn-success'));
                echo CHtml::closeTag('span');
                echo CHtml::openTag('span', array('class' => 'Right'));
                echo CHtml::link(G::t("Lost password?"), '/gong/user/registration/recovery', $htmlOptions = array('class' => 'btn btn-large btn-danger'));
                echo CHtml::closeTag('span');
                ?>
            </span>
        </div>




    </div> <!-- Inline Form -->
    <? echo CHtml::endForm(); ?>
</div>