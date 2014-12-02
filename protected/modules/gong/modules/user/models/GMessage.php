<?php
Yii::import ( 'gong.modules.gong.modules.user.models.*' );

/**
 * This is the model class for the Message subsystem of the Yii User
 * Management module
 */
class GMessage extends GActiveRecord {
	const MSG_NONE = 'None';
	const MSG_PLAIN = 'Plain';
	const MSG_DIALOG = 'Dialog';
	
	// set $omit_mail to true to avoid e-mail notification of the
	// received message. It is mainly user for the privacy settings
	// (receive profile comment email/friendship request email/...)
	public $omit_mail = false;
	public function behaviors() {
		return array (
				'Timestamp' => array (
						'class' => 'zii.behaviors.CTimestampBehavior',
						'createAttribute' => 'created',
						'updateAttribute' => 'modified' 
				) 
		);
	}
	
	/**
	 *
	 * @param string $className        	
	 * @return GMessage
	 */
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function beforeValidate() {
		if (parent::beforeValidate ()) {
			
			$to_user = GUser::model ()->findByPk ( $this->toUserId );
			if ($to_user && isset ( $to_user->privacy )) {
				if (in_array ( $this->from_user->username, $to_user->privacy->getIgnoredUsers () ))
					$this->addError ( 'toUserId', G::t ( 'One of the recipients ({username}) has ignored you. Message will not be sent!', array (
							'{username}' => $to_user->username 
					) ) );
			}
			return true;
		}
		return false;
	}
	public function beforeSave() {
		if ($this->isNewRecord) {
			// If the user has activated email receiving, send a email
			if ($this->to_user->privacy && $this->to_user->privacy->message_new_message) {
				G::log ( G::t ( 'Message id {id} has been sent from user {fromUserId} to user {toUserId}', array (
						'{id}' => $this->id,
						'{fromUserId}' => $this->fromUserId,
						'{toUserId}' => $this->toUserId 
				) ) );
				
				$mail = array (
						'from' => G::module ( 'registration' )->registrationEmail,
						'to' => $this->to_user->profile->email,
						'subject' => $this->subject,
						'body' => $this->message 
				);
				Mailer::mail ( $mail ['from'], $mail ['to'], $mail ['body'], $mail ['subject'] );
			}
		}
		return parent::beforeSave ();
	}
	
	// Small wrapper function to quickly send messages from inside the workflow
	// $to - recipient of the message. either the uid, the username or an
	// GUser object instance
	// $from - Who wrote the message? Again, uid, username or GUser object
	// $subject - Subject
	// $body - The message
	// $mail - Should the mail also be send by email, defaults to true
	//
	// Example usage: GMessage::write(1, 2, 'Hello', 'Body');
	// Will write a message from admin to demo
	public static function write($to, $from, $subject, $body, $mail = true) {
		$message = new GMessage ();
		
		if (! $mail)
			$message->omit_mail = true;
		
		if (is_object ( $from ))
			$message->fromUserId = ( int ) $from->id;
		else if (is_numeric ( $from ))
			$message->fromUserId = $from;
		else if (is_string ( $from ) && $user = GUser::model ()->find ( "username = '{$from}'" ))
			$message->fromUserId = $user->id;
		else
			throw new CHttpException ( 'No from for message' );
		
		if (is_object ( $to ))
			$message->toUserId = ( int ) $to->id;
		else if (is_numeric ( $to ))
			$message->toUserId = $to;
		else if (is_string ( $to ) && $user = GUser::model ()->find ( "username = '{$to}'" ))
			$message->toUserId = $user->id;
		else
			throw new CHttpException ( 'No to for message' );
		
		$message->subject = $subject;
		$message->message = $body;
		return $message->save ();
	}
	
	/**
	 * Returns resolved table name (incl.
	 * table prefix when it is set in db configuration)
	 * Following algorith of searching valid table name is implemented:
	 * - try to find out table name stored in currently used module
	 * - if not found try to get table name from UserModule configuration
	 * - if not found user default {{message}} table name
	 * 
	 * @return string
	 */
	public function tableName() {
		return '{{message}}';
	}
	public function rules() {
		return array (
				array (
						'fromUserId, toUserId, subject',
						'required' 
				),
				array (
						'fromUserId, draft, read, answered',
						'numerical',
						'integerOnly' => true 
				),
				array (
						'subject',
						'length',
						'max' => 255 
				),
				array (
						'message',
						'safe' 
				) 
		);
	}
	public function defaultScope() {
		return array (
				'order' => 'created DESC' 
		);
	}
	public function scopes() {
		$id = Yii::app ()->user->id;
		return array (
				'all' => array (
						'condition' => "toUserId = {$id} or fromUserId = {$id}" 
				),
				'read' => array (
						'condition' => "toUserId = {$id} and `read` = 1" 
				),
				'unread' => array (
						'condition' => "toUserId = {$id} and `read` = 0" 
				),
				'sent' => array (
						'condition' => "fromUserId = {$id}" 
				),
				'received' => array (
						'condition' => "toUserId = {$id}" 
				),
				'answered' => array (
						'condition' => "toUserId = {$id} and answered > 0" 
				) 
		);
	}
	public function limit($limit = 10) {
		$this->getDbCriteria ()->mergeWith ( array (
				'limit' => $limit 
		) );
		return $this;
	}
	public function beforeDelete() {
		if ($this->toUserId != Yii::app ()->user->id && $this->fromUserId != Yii::app ()->user->id)
			throw new CHttpException ( 403 );
		return parent::beforeDelete ();
	}
	public function relations() {
		return array (
				'from_user' => array (
						self::BELONGS_TO,
						'GUser',
						'fromUserId' 
				),
				'to_user' => array (
						self::BELONGS_TO,
						'GUser',
						'toUserId' 
				) 
		);
	}
}
