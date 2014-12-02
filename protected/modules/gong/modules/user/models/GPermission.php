<?php
class GPermission extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function tableName() {
		return "{{permission}}";
	}
	public function rules() {
		return array (
				array (
						'roleId, type, action, template',
						'required' 
				),
				array (
						'roleId, action, template',
						'numerical',
						'integerOnly' => true 
				),
				array (
						'type',
						'length',
						'max' => 4 
				),
				array (
						'roleId, type, action, template, comment',
						'safe' 
				) 
		);
	}
	public function relations() {
		return array (
				'role' => array (
						self::BELONGS_TO,
						'GRole',
						'roleId' 
				),
				'action' => array (
						self::BELONGS_TO,
						'GAction',
						'actionId' 
				) 
		);
	}
	public function attributeLabels() {
		return array (
				'roleId' => G::t ( 'Principal' ),
				'type' => G::t ( 'Type' ),
				'action' => G::t ( 'Action' ),
				'template' => G::t ( 'Grant permission to new users' ),
				'comment' => G::t ( 'Comment' ) 
		);
	}
}

?>
