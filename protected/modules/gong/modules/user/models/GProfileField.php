<?php
/**
 * This is the model class for table profile field table
 *
 * All available profile fields for the application are stored in this
 * table. Please make sure to add additional fields by the gong profile
 * field admin backend to ensure that the profile columns and the profile
 * field table is in sync.
 */
class GProfileField extends GActiveRecord
{
	const VISIBLE_HIDDEN=0;
	const VISIBLE_ONLY_OWNER=1;
	const VISIBLE_REGISTER_USER=2;
	const VISIBLE_USER_DECISION=3;
	const VISIBLE_PUBLIC=4; // Field is public even if the user decides to hide it

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className
	 * @return GProfileField
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function isPublic($user = null) {
		if($user == null)
			$user = Yii::app()->user->id;

		if(!$this->visible)
			return false;

		if($privacy = GUser::model()->findByPk($user)->privacy) {
			if($privacy->public_profile_fields & pow(2, $this->id))
				return true;
		}

		return false;
	}

	public function tableName()
	{
		return '{{profile_field}}';
	}

	public function scopes()
	{
		return array(
				'forAll'=>array(
					'condition'=>'visible='.self::VISIBLE_PUBLIC,
					),
				'forUser'=>array(
					'condition'=>'visible>='.self::VISIBLE_REGISTER_USER,
					),
				'forOwner'=>array(
					'condition'=>'visible>='.self::VISIBLE_ONLY_OWNER,
					),
				);
	}

	public static function itemAlias($type, $code = NULL) {
		$_items = array(
				'field_type' => array(
					'INTEGER' => G::t('INTEGER'),
					'VARCHAR' => G::t( 'VARCHAR'),
					'TEXT'=> G::t( 'TEXT'),
					'DATE'=> G::t( 'DATE'),
					'FLOAT'=> G::t('FLOAT'),
					'BOOL'=> G::t('BOOL'),
					'BLOB'=> G::t('BLOB'),
					'BINARY'=> G::t('BINARY'),
					'FILE'=> 'FILE',
					),
				'required' => array(
					'0' => G::t('No'),
					'1' => G::t('Yes'),
					),
				'visible' => array(
					self::VISIBLE_PUBLIC => G::t('For all'),
					self::VISIBLE_USER_DECISION => G::t('Let the user choose in privacy settings'),
					self::VISIBLE_REGISTER_USER => G::t('Registered users'),
					self::VISIBLE_ONLY_OWNER => G::t('Only owner'),
					self::VISIBLE_HIDDEN => G::t('Hidden'),
					),
				);
		if (isset($code))
			return isset($_items[$type][$code]) ? $_items[$type][$code] : false;
		else
			return isset($_items[$type]) ? $_items[$type] : false;
	}
}
?>
