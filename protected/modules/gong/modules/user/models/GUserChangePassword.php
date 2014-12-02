<?php
class GUserChangePassword extends GFormModel {
	public $password;
	public $verifyPassword;
	public $currentPassword;
	public function addError($attribute, $error) {
		parent::addError ( $attribute, G::t ( $error ) );
	}
	public function rules() {
		$passwordRequirements = G::module ()->passwordRequirements;
		$passwordrule = array_merge ( array (
				'password',
				'GPasswordValidator' 
		), $passwordRequirements );
		$rules [] = $passwordrule;
		$rules [] = array (
				'currentPassword',
				'safe' 
		);
		$rules [] = array (
				'currentPassword',
				'required',
				'on' => 'user_request' 
		);
		$rules [] = array (
				'password, verifyPassword',
				'required' 
		);
		$rules [] = array (
				'password',
				'compare',
				'compareAttribute' => 'verifyPassword',
				'message' => G::t ( 'Retyped password is incorrect' ) 
		);
		
		return $rules;
	}
	public function attributeLabels() {
		return array (
				'password' => G::t ( 'New password' ),
				'verifyPassword' => G::t ( 'Retype your new password' ),
				'currentPassword' => G::t ( 'Your current password' ) 
		);
	}
	public static function createRandomPassword() {
		$lowercase = G::module ()->passwordRequirements ['minLowerCase'];
		$uppercase = G::module ()->passwordRequirements ['minUpperCase'];
		$minnumbers = G::module ()->passwordRequirements ['minDigits'];
		$max = G::module ()->passwordRequirements ['maxLen'];
		
		$chars = "abcdefghijkmnopqrstuvwxyz";
		$numbers = "1023456789";
		srand ( ( double ) microtime () * 1000000 );
		$i = 0;
		$current_lc = 0;
		$current_uc = 0;
		$current_dd = 0;
		$password = '';
		while ( $i <= $max ) {
			if ($current_lc < $lowercase) {
				$charnum = rand () % 22;
				$tmpchar = substr ( $chars, $charnum, 1 );
				$password = $password . $tmpchar;
				$i ++;
			}
			
			if ($current_uc < $uppercase) {
				$charnum = rand () % 22;
				$tmpchar = substr ( $chars, $charnum, 1 );
				$password = $password . strtoupper ( $tmpchar );
				$i ++;
			}
			
			if ($current_dd < $minnumbers) {
				$charnum = rand () % 9;
				$tmpchar = substr ( $numbers, $charnum, 1 );
				$password = $password . $tmpchar;
				$i ++;
			}
			
			if ($current_lc == $lowercase && $current_uc == $uppercase && $current_dd == $numbers && $i < $max) {
				$charnum = rand () % 22;
				$tmpchar = substr ( $chars, $charnum, 1 );
				$password = $password . $tmpchar;
				$i ++;
				if ($i < $max) {
					$charnum = rand () % 9;
					$tmpchar = substr ( $numbers, $charnum, 1 );
					$password = $password . $tmpchar;
					$i ++;
				}
				if ($i < $max) {
					$charnum = rand () % 22;
					$tmpchar = substr ( $chars, $charnum, 1 );
					$password = $password . strtoupper ( $tmpchar );
					$i ++;
				}
			}
		}
		return $password;
	}
}
