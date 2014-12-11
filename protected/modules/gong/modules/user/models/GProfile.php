<?php
class GProfile extends GActiveRecord {
	const PRIVACY_PRIVATE = 'private';
	const PRIVACY_PUBLIC = 'public';
	
	/**
	 *
	 * @var array of GProfileFields
	 */
	static $fields = null;
	public function init() {
		parent::init ();
		// load profile fields only once
		$this->loadProfileFields ();
	}
	public function afterSave() {
		if ($this->isNewRecord)
			Yii::log ( G::t ( 'A profile been created: {profile}', array (
					'{profile}' => CJavaScript::jsonEncode ( $this->attributes ) 
			) ) );
		else
			Yii::log ( G::t ( 'A profile been update: {profile}', array (
					'{profile}' => CJavaScript::jsonEncode ( $this->attributes ) 
			) ) );
		
		return parent::afterSave ();
	}
	public function recentComments($count = 3) {
		$criteria = new CDbCriteria ();
		$criteria->condition = 'id = ' . $this->id;
		$criteria->order = 'createtime DESC';
		$criteria->limit = $count;
		return GProfileComment::model ()->findAll ( $criteria );
	}
	public function beforeValidate() {
		if ($this->isNewRecord)
			$this->timestamp = time ();
		return parent::beforeValidate ();
	}
	
	/**
	 *
	 * @param string $className        	
	 * @return GProfile
	 */
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	
	// All fields that the user has activated in his privacy settings will
	// be obtained and returned for the use in the profile view
	public function getPublicFields() {
		$fields = array ();
		
		if ($privacy = GUser::model ()->cache ( 500 )->with ( 'privacy' )->findByPk ( $this->userId )->privacy->public_profile_fields) {
			$i = 1;
			foreach ( GProfileField::model ()->cache ( 3600 )->findAll () as $field ) {
				if ((($i & $privacy) && $field->visible != GProfileField::VISIBLE_HIDDEN) || $field->visible == GProfileField::VISIBLE_PUBLIC)
					$fields [] = $field;
				$i *= 2;
			}
		}
		return $fields;
	}
	public function tableName() {
		return '{{profile}}';
	}
	public function rules() {
		$required = array ();
		$numerical = array ();
		$rules = array ();
		$safe = array ();
		
		foreach ( self::$fields as $field ) {
			$field_rule = array ();
			
			if ($field->required == 1)
				array_push ( $required, $field->varname );
			
			if ($field->field_type == 'int' || $field->field_type == 'FLOAT' || $field->field_type == 'INTEGER' || $field->field_type == 'BOOLEAN')
				array_push ( $numerical, $field->varname );
			
			if ($field->field_type == 'DROPDOWNLIST')
				array_push ( $safe, $field->varname );
			
			if ($field->field_type == 'VARCHAR' || $field->field_type == 'TEXT') {
				$field_rule = array (
						$field->varname,
						'length',
						'max' => $field->field_size,
						'min' => $field->field_size_min 
				);
				
				if ($field->error_message)
					$field_rule ['message'] = G::t ( $field->error_message );
				
				array_push ( $rules, $field_rule );
			}
			
			if ($field->match) {
				$field_rule = array (
						$field->varname,
						'match',
						'pattern' => $field->match 
				);
				
				if ($field->error_message)
					$field_rule ['message'] = G::t ( $field->error_message );
				
				array_push ( $rules, $field_rule );
			}
			
			if ($field->range) {
				// allow using commas and semicolons
				$range = explode ( ';', $field->range );
				if (count ( $range ) === 1)
					$range = explode ( ',', $field->range );
				$field_rule = array (
						$field->varname,
						'in',
						'range' => $range 
				);
				
				if ($field->error_message)
					$field_rule ['message'] = G::t ( $field->error_message );
				array_push ( $rules, $field_rule );
			}
			
			if ($field->other_validator) {
				$field_rule = array (
						$field->varname,
						$field->other_validator 
				);
				
				if ($field->error_message)
					$field_rule ['message'] = G::t ( $field->error_message );
				array_push ( $rules, $field_rule );
			}
		}
		
		array_push ( $rules, array (
				implode ( ',', $required ),
				'required' 
		) );
		array_push ( $rules, array (
				implode ( ',', $numerical ),
				'numerical',
				'integerOnly' => true 
		) );
		array_push ( $rules, array (
				implode ( ',', $safe ),
				'safe' 
		) );
		
		$rules [] = array (
				'allow_comments, show_friends',
				'numerical' 
		);
		$rules [] = array (
				'email',
				'unique' 
		);
		/* $rules[] = array('email', 'CEmailValidator'); */
		$rules [] = array (
				'privacy',
				'safe' 
		);
		
		return $rules;
	}
	public function relations() {
		$relations = array (
				'user' => array (
						self::BELONGS_TO,
						'GUser',
						'userId' 
				),
				'comments' => array (
						self::HAS_MANY,
						'GProfileComment',
						'profile_id' 
				) 
		);
		
		$fields = Yii::app ()->db->cache ( 3600 )->createCommand ( "select * from " . GProfileField::model ()->tableName () . " where field_type = 'DROPDOWNLIST'" )->queryAll ();
		
		foreach ( $fields as $field ) {
			$relations [ucfirst ( $field ['varname'] )] = array (
					self::BELONGS_TO,
					ucfirst ( $field ['varname'] ),
					$field ['varname'] 
			);
		}
		
		return $relations;
	}
	
	// Retrieve a list of all users that have commented my profile
	// Do not show my own profile visit
	public function getProfileCommentators() {
		$commentators = array ();
		foreach ( $this->comments as $comment )
			if ($comment->userId != Yii::app ()->user->id)
				$commentators [$comment->userId] = $comment->user;
		
		return $commentators;
	}
	public function getProfileFields() {
		$fields = array ();
		
		if (self::$fields)
			foreach ( self::$fields as $field ) {
				$varname = $field->varname;
				$fields [$varname] = G::t ( $varname );
			}
		return $fields;
	}
	public function name() {
		return sprintf ( '%s %s', $this->firstname, $this->lastname );
	}
	public function attributeLabels() {
		$labels = array (
				'id' => G::t ( 'Profile ID' ),
				'userId' => G::t ( 'User ID' ),
				'privacy' => G::t ( 'Privacy' ),
				'show_friends' => G::t ( 'Show friends' ),
				'allow_comments' => G::t ( 'Allow profile comments' ) 
		);
		
		if (self::$fields)
			foreach ( self::$fields as $field )
				$labels [$field->varname] = G::t ( $field->title );
		
		return $labels;
	}
	
	/**
	 * Load profile fields.
	 * Overwrite this method to get another set of fields
	 * Makes use of cache so the amount of sql queries per request is reduced
	 * 
	 * @since 0.6
	 * @return array of GProfileFields or empty array
	 */
	public function loadProfileFields() {
		if (self::$fields === null) {
			self::$fields = GProfileField::model ()->cache ( 3600 )->findAll ();
			if (self::$fields == null)
				self::$fields = array ();
		}
		return self::$fields;
	}
}
