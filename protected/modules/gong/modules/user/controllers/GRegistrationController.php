<?php

Yii::import('gong.modules.form.models.*');
Yii::import('gong.modules.form.widgets.*');
Yii::import('gong.modules.user.components.GUserIdentity');

class GRegistrationController extends GController {

    public function accessRules() {
        return array(
            array('allow',
                'actions' => array('index', 'registration', 'recovery', 'activation', 'resendactivation'),
                'users' => array('*'),
            ),
            array('allow',
                'actions' => array('captcha'),
                'users' => array('*'),
            ),
            array('deny', // deny all other users
                'users' => array('*'),
            ),
        );
    }

    public function actions() {
        return array(
            'captcha' => array(
                'class' => 'CCaptchaAction',
                'backColor' => 0xFFFFFF,
            ),
        );
    }

    public function actionRegistration() {
        $form = new GRegistrationForm;
        $profile = new GProfile;

        if (isset($_POST['GRegistrationForm'])) {
            $form->attributes = $_POST['GRegistrationForm'];
            $profile->attributes = $_POST['GProfile'];

            $form->validate();
            $profile->validate();

            if (!$form->hasErrors() && !$profile->hasErrors()) {
                $user = new GUser;
                $user->register($form->username, $form->password, $profile);
                $this->sendRegistrationEmail($user);
                G::setFlash('alert-info', 'Thank you for your registration. Please check your email.');
                $this->redirect("/gong/user/auth/login");
            }
        }
        $this->render('registration', array(
            'form' => $form,
            'model' => $profile,
                )
        );
    }

    /**
     * Password recovery routine. The User will receive an email with an
     * activation link. If clicked, he will be prompted to enter his new
     * password.
     */
    public function actionRecovery($email = null, $key = null) {
        $form = new GPasswordRecoveryForm;

        if ($email != null && $key != null) {
            $profile = GProfile::model()->find('email = :email', array(
                'email' => $email));
            if ($profile) {
                $user = $profile->user;
                if ($user->activationKey == $key) {
                    $passwordform = new GUserChangePassword;
                    if (isset($_POST['GUserChangePassword'])) {
                        $passwordform->attributes = $_POST['GUserChangePassword'];
                        if ($passwordform->validate()) {
                            if (!$user->salt)
                                $user->salt = GEncrypt::generateSalt();
                            $user->password = GEncrypt::encrypt($passwordform->password, $user->salt);
                            $user->activationKey = GEncrypt::encrypt(microtime() . $passwordform->password, $user->salt);
                            $user->save();
                            G::setFlash('alert-info', G::t('Your new password has been saved.'));
                            $this->redirect("/gong/user/auth/login");
                        }
                    }
                    $this->render(
                            '/registration/changepassword', array(
                        'form' => $passwordform));
                    Yii::app()->end();
                } else {
                    $form->addError('login_or_email', G::t('Invalid recovery key'));
                    G::log(G::t(
                                    'Someone tried to recover a password, but entered a wrong recovery key. Email is {email}, associated user is {username} (id: {uid})', array(
                                '{email}' => $email,
                                '{uid}' => $user->id,
                                '{username}' => $user->username)));
                }
            }
        } else {
            if (isset($_POST['GPasswordRecoveryForm'])) {
                $form->attributes = $_POST['GPasswordRecoveryForm'];

                if ($form->validate()) {
                    G::setFlash('alert-info', G::t('Instructions have been sent to you. Please check your email.'));

                    if ($form->user instanceof GUser) {
                        $form->user->generateActivationKey();
                        $recovery_url = CHtml::link('Click here', $this->createAbsoluteUrl(
                                "registration/recovery", array(
                            'key' => $form->user->activationKey,
                            'email' => $form->user->profile->email)));

                        G::log(G::t(
                                        '{username} successfully requested a new password in the password recovery form. A email with the password recovery url {recovery_url} has been sent to {email}', array(
                                    '{email}' => $form->user->profile->email,
                                    '{recovery_url}' => $recovery_url,
                                    '{username}' => $form->user->username)));
                        try {
                            $body = $this->renderPartial("recoveryMail", array('username'=>$form->user->username, 'recovery_url'=>$recovery_url));
                        } catch (Exception $e) {
                            $body = '';
                        }
                        try {
                            $subject = G::t('recoveryMailSubject');
                        } catch (Exception $e) {
                            $subject = '';
                        }
                        if (empty($body))
                            $body = "Hello ::username:: <br>Please click on the following link: ::recovery_url:: to change your password.";
                        if (empty($subject))
                            $subject = "Password change";
                        $mail = array(
                            'from' => G::module()->recoveryEmail,
                            'to' => $form->user->profile->email,
                            'subject' => $subject,
                            'body' => strtr(
                                    $body, array(
                                '::recovery_url::' => $recovery_url, '::username::' => $form->user->username)),
                        );
                        $sent = Mailer::mail($mail['from'], $mail['to'], $mail['body'], $mail['subject']);
                    } else
                        G::log(G::t(
                                        'A password has been requested, but no associated user was found in the database. Requested user/email is: {username}', array(
                                    '{username}' => $form->login_or_email)));
                    $this->redirect("/gong/user/auth/login");
                }
            }
        }
        $this->render("/registration/recovery", array(
            'form' => $form));
    }

    // Send the Email to the given user object. 
    // $user->profile->email needs to be set.
    public function sendRegistrationEmail($user) {
        if (!isset($user->profile->email))
            throw new CException(G::t('Email is not set when trying to send Registration Email'));

        $activation_url = $user->getActivationUrl();

        $body = strtr(
                'Hello, {username}. Please activate your account with this url: {activation_url}', array(
            '{username}' => $user->username,
            '{site_name}' => Yii::app()->name,
            '{activation_url}' => $activation_url));

        $mail = array(
            'from' => G::module('registration')->registrationEmail,
            'to' => $user->profile->email,
            'subject' => strtr(
                    'Please activate your account for {site_name}', array(
                '{site_name}' => Yii::app()->name)),
            'body' => $body,
        );
        $sent = Mailer::mail($mail['from'], $mail['to'], $mail['body'], $mail['subject']);

        return $sent;
    }

    /**
     * Activation of an user account. The Email and the Activation key send
     * by email needs to correct in order to continue. The Status will
     * be initially set to 1 (active - first Visit) so the administrator
     * can see, which accounts have been activated, but not yet logged in 
     * (more than once)
     */
    public function actionActivation($email, $key) {
        // If already logged in, we dont activate anymore
        if (!Yii::app()->user->isGuest) {
            G::setFlash('alert-info', 'You are already logged in, please log out to activate your account');
            $this->redirect(Yii::app()->user->returnUrl);
        }
        // If everything is set properly, let the model handle the Validation
        // and do the Activation
        $status = GUser::activate($email, $key);
        if ($status instanceof GUser) {
            $login = new GUserIdentity($status->username, false);
            $login->authenticate(true);
            Yii::app()->user->login($login);

            $this->render('activation_success');
        }
        else
            $this->render('activation_failure', array(
                'error' => $status));
    }

}

?>
