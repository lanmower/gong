<?php
class GRole extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function tableName() {
		return '{{role}}';
	}
	public function rules() {
		return array (
				array (
						'title',
						'required' 
				),
				array (
						'price',
						'numerical' 
				),
				array (
						'duration',
						'numerical' 
				),
				array (
						'registration',
						'numerical' 
				),
				array (
						'title, description',
						'length',
						'max' => '255' 
				) 
		);
	}
	public function relations() {
		return array (
				'users' => array (
						self::MANY_MANY,
						'GUser',
						'{{user_role}}(roleId, userId)' 
				),
				'permissions' => array (
						self::HAS_MANY,
						'GPermission',
						'roleId' 
				),
				'memberships' => array (
						self::HAS_MANY,
						'GMembership',
						'roleId' 
				) 
		);
	}
	public function attributeLabels() {
		return array (
				'id' => G::t ( "#" ),
				'title' => G::t ( "Title" ),
				'description' => G::t ( "Description" ),
				'selectable' => G::t ( "Selectable on registration" ),
				'searchable' => G::t ( "Searchable" ),
				'price' => G::t ( "Price" ),
				'duration' => G::t ( "Duration in days" ) 
		);
	}
}
