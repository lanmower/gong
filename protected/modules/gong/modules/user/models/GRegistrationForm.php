<?

/**
 * RegistrationForm class.
 * RegistrationForm is the data structure for keeping
 * user registration form data. It is used by the 'registration' action of 
 * 'GRegistrationController'.
 * @package Gong.models
 */
class GRegistrationForm extends GUser {

    public $email;
    public $newsletter;
    public $username;
    public $password;
    public $street;
    public $city;
    public $telephone;
    public $verifyPassword;
    public $verifyCode; // Captcha

    public function rules() {
        $rules = parent::rules();

        /* FIXME: As soon as i grasp how i can dynamically add variables to a 
          class in PHP, i will enable this code snippet for flexibility:

          $profile = new GProfile;
          $profile_rules = $profile->rules();
          foreach($profile_rules as $rule)
          if(isset($rule[0]) && is_string($rule[0]))
          $this->${$rule[0]} = '';

          $rules = array_merge($rules, $profile->rules()); */

        $rules[] = array('username', 'required');
        $rules[] = array('password, verifyPassword', 'required');
        $rules[] = array('password', 'compare',
            'compareAttribute' => 'verifyPassword',
            'message' => G::t("Retype password is incorrect."));
        $rules[] = array('verifyCode', 'captcha',
            'allowEmpty' => CCaptcha::checkRequirements());

        return $rules;
    }

    public static function genRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
        $string = array();
        for ($p = 0; $p < $length; $p++) {
            $string[] = $characters[mt_rand(0, strlen($characters) - 1)];
        }
        return implode($string);
    }

}
