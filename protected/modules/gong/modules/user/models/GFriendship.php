<?php
class GFriendship extends GActiveRecord {
	const STATUS_INACTIVE = 0;
	const STATUS_PENDING = 1;
	const STATUS_APPROVED = 2;
	public function tableName() {
		return '{{friendship}}';
	}
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function behaviors() {
		return array (
				'Timestamp' => array (
						'class' => 'zii.behaviors.CTimestampBehavior',
						'createAttribute' => 'created',
						'updateAttribute' => 'modified' 
				) 
		);
	}
	public function rules() {
		return array (
				array (
						'inviterId, friendId, status, created, modified, message',
						'safe' 
				),
				array (
						'inviterId',
						'unique',
						'criteria' => array (
								'condition' => '`friendId`=:friendId',
								'params' => array (
										':friendId' => $this->friendId 
								) 
						),
						'message' => 'Friendship already requested for this user.' 
				) 
		);
	}
	public function getApprovalLink() {
		return CHtml::link ( "<i class='glyphicon glyphicon-thumbs-up'></i>", '/gong/user/friendship/approve/id/' . $this->getHash ( 'id' ) );
	}
	
	// possible relations are cached because they depend on the active submodules
	// and it takes many expensive milliseconds to evaluate them all the time
	public function relations() {
		return array (
				'inviter' => array (
						self::BELONGS_TO,
						'GUser',
						'inviterId' 
				),
				'friend' => array (
						self::BELONGS_TO,
						'GUser',
						'friendId' 
				) 
		);
	}
}

?>
