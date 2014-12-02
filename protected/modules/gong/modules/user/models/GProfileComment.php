<?php
class GProfileComment extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function tableName() {
		return '{{profile_comment}}';
	}
	public function rules() {
		return array (
				array (
						'userId, profile_id, comment, createtime',
						'required' 
				),
				array (
						'userId, profile_id, createtime',
						'numerical',
						'integerOnly' => true 
				),
				array (
						'id, userId, profile_id, comment, createtime',
						'safe',
						'on' => 'search' 
				) 
		);
	}
	public function relations() {
		return array (
				'user' => array (
						self::BELONGS_TO,
						'GUser',
						'userId' 
				),
				'profile' => array (
						self::BELONGS_TO,
						'GProfile',
						'profile_id' 
				) 
		);
	}
	public function beforeValidate() {
		parent::beforeValidate ();
		$this->userId = Yii::app ()->user->id;
		$this->createtime = time ();
		return true;
	}
	public function afterSave() {
		// If the user has activated email receiving, send a email
		if ($user = $this->profile->user) {
			if ($user->privacy && $user->privacy->message_new_profilecomment) {
				GMessage::write ( $user, $this->userId, G::t ( 'New profile comment from {username}', array (
						'{username}' => $this->user->username 
				) ), strtr ( 'A new profile comment has been made from {username}: {message} <br /> <a href="{link_profile}">to my profile</a>', array (
						'{username}' => $this->user->username,
						'{message}' => $this->comment,
						'{link_profile}' => Yii::app ()->controller->createUrl ( '//profile/profile/view' ) 
				) ) );
			}
		}
		return parent::afterSave ();
	}
	
	// How many profile comments have been written in month $month of year $year?
	public static function countWritten($month = null, $year = null) {
		$timestamp = mktime ( 0, 0, 0, $month, 1, $year );
		$timestamp2 = mktime ( 0, 0, 0, $month + 1, 1, $year );
		if ($month === null) {
			$timestamp = 0;
			$timestamp2 = time ();
		}
		
		$sql = "select count(*) from profile_comment where createtime > {$timestamp} and createtime < {$timestamp2}";
		$result = Yii::app ()->db->createCommand ( $sql )->queryAll ();
		return $result [0] ['count(*)'];
	}
	public function attributeLabels() {
		return array (
				'id' => G::t ( 'ID' ),
				'userId' => G::t ( 'Written from' ),
				'profile_id' => G::t ( 'Profile' ),
				'comment' => G::t ( 'Comment' ),
				'createtime' => G::t ( 'Written at' ) 
		);
	}
	public function search() {
		$criteria = new CDbCriteria ();
		
		$criteria->compare ( 'id', $this->id );
		$criteria->compare ( 'userId', $this->userId );
		$criteria->compare ( 'profile_id', $this->profile_id );
		$criteria->compare ( 'comment', $this->comment, true );
		$criteria->compare ( 'createtime', $this->createtime );
		
		return new CActiveDataProvider ( get_class ( $this ), array (
				'criteria' => $criteria 
		) );
	}
}
