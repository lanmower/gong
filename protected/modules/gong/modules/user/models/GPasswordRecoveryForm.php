<?php

/**
 * PasswordRecoveryForm class.
 * PasswordRecoveryForm is the data structure for keeping the
 * password recovery form data. It is used by the 'recovery' action 
 * of the Registration Module
 */
class GPasswordRecoveryForm extends GFormModel {
	public $login_or_email;

	// $user will be poupulated with the user instance, if found
	public $user;
	
	public function rules()
	{
		$rules = array(
				// username and password are required
				array('login_or_email', 'required'),
				array('login_or_email', 'checkexists'),
				);

		if(G::module('registration')->validEmailPattern) 
			$rules[] =	array('login_or_email', 'email');

		return $rules;

	}

	public function attributeLabels()
	{
		return array(
			'login_or_email'=>G::t('Email address'),
		);
	}
	
	public function checkexists($attribute, $params) {
		$user = null;

		// we only want to authenticate when there are no input errors so far
		if(!$this->hasErrors()) {
			if (strpos($this->login_or_email,"@")) {
				$profile = GProfile::model()->findByAttributes(array(
							'email'=>$this->login_or_email));
                                if(isset($profile))
                                    $this->user = $profile->user instanceof GUser ? $profile->user : null;
                                if(!$this->user instanceof GUser) $this->addError($attribute, "this email is not registered on this site.");
                                return $this->user instanceof GUser;
			} else {
				$this->user = GUser::model()->findByAttributes(array(
							'username'=>$this->login_or_email));
                                if(!$this->user instanceof GUser) $this->addError($attribute, "this user name is not registered on this site.");
                                return $this->user instanceof GUser;
                        }
                                                    

		}
                return false;
	}
}
