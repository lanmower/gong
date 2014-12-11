<?php
class GMembership extends GActiveRecord {
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function tableName() {
		return '{{membership}}';
	}
	public function isActive() {
		return $this->end_date > time () && $this->payment_date < time ();
	}
	public function daysLeft() {
		if ($this->end_date == 0 || $this->end_date < time ())
			return 0;
		$difference = abs ( $this->end_date - time () );
		return sprintf ( '%d', ( int ) $difference / 86400 + 1 );
	}
	public function beforeValidate() {
		/*
		 * if ($this->isNewRecord) {
		 * $this->userId = Yii::app()->user->id;
		 * $this->order_date = time();
		 * }
		 */
		return parent::beforeValidate ();
	}
	public function scopes() {
		return array (
				'lastFirst' => array (
						'order' => 'id DESC' 
				) 
		);
	}
	public function afterSave() {
		return parent::afterSave ();
	}
	public function primaryKey() {
		return 'id';
	}
	public function getActivateLink() {
		return CHtml::link ( "<i class='glyphicon glyphicon-thumbs-up'></i>", 'membership/update/id/' . $this->id );
	}
	public function timeLeft() {
		if ($this->end_date < time ())
			return G::t ( 'Expired' );
		
		$seconds = time () - $this->end_date;
		
		$delay = array ();
		
		foreach ( array (
				86400,
				3600,
				60 
		) as $increment ) {
			$difference = abs ( round ( $seconds / $increment ) );
			$seconds %= $increment;
			
			$delay [] = $difference;
		}
		
		$timeleft = G::t ( '{days} D, {hours} H, {minutes} M', array (
				'{days}' => $delay [0],
				'{hours}' => $delay [1],
				'{minutes}' => $delay [2] 
		) );
		
		// Mark memberships that expire in less than 30 days red
		if ($delay [0] < 30)
			return '<div style="background-color: red;margin: 2px;">' . $timeleft . '</div>';
		else
			return $timeleft;
	}
	public function rules() {
		return array (
				array (
						'roleId, userId, payment_id, order_date',
						'required' 
				),
				array (
						'end_date',
						'default',
						'setOnEmpty' => true,
						'value' => null 
				),
				array (
						'roleId, userId, payment_id, order_date, end_date, payment_date, subscribed',
						'numerical',
						'integerOnly' => true 
				),
				array (
						'id, roleId, userId, payment_id, order_date, end_date, payment_date',
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
				'role' => array (
						self::BELONGS_TO,
						'GRole',
						'roleId' 
				),
				'payment' => array (
						self::BELONGS_TO,
						'GPayment',
						'payment_id' 
				) 
		);
	}
	public function attributeLabels() {
		return array (
				'id' => G::t ( 'Order number' ),
				'roleId' => G::t ( 'Membership' ),
				'userId' => G::t ( 'User' ),
				'payment_id' => G::t ( 'Payment' ),
				'order_date' => G::t ( 'Order date' ),
				'end_date' => G::t ( 'End date' ),
				'payment_date' => G::t ( 'Payment date' ) 
		);
	}
	public function sendPaymentConfirmation() {
		$return = GMessage::write ( $this->user, 1, G::t ( 'Payment received' ), strtr ( 'The payment of order {id} has been received on {payment_date}', array (
				'{payment_date}' => date ( G::module ()->dateTimeFormat, $this->payment_date ),
				'{id}' => $this->id 
		) ) );
		return $return;
	}
	public function confirmPayment() {
		$this->payment_date = time ();
		$this->end_date = $this->payment_date + ($this->role->duration * 86400);
		if ($this->save ( false, array (
				'payment_date',
				'end_date' 
		) )) {
			return $this->sendPaymentConfirmation ();
		} else
			return false;
	}
	public function search() {
		$criteria = new CDbCriteria ();
		
		$criteria->compare ( 't.id', $this->id );
		$criteria->compare ( 'roleId', $this->roleId );
		$criteria->compare ( 'userId', $this->userId );
		$criteria->compare ( 'payment_id', $this->payment_id );
		$criteria->compare ( 'order_date', $this->order_date );
		
		if ($this->payment_date == 'not_payed')
			$criteria->addCondition ( 'payment_date is null' );
		
		$criteria->with = array (
				'user',
				'role',
				'payment' 
		);
		
		return new CActiveDataProvider ( get_class ( $this ), array (
				'criteria' => $criteria 
		) );
	}
	
	// Call this function once in a request to check if a membership is expiring
	public static function syncMemberships() {
		if (! Yii::app ()->user->isGuest) {
			foreach ( GMembership::model ()->findAll ( 'userId = :uid and end_date != 0 and end_date < :date', array (
					':uid' => Yii::app ()->user->id,
					':date' => time () 
			) ) as $membership ) {
				if ($membership->subscribed != - 1) { // renew membership
					$new_membership = new GMembership ();
					
					$new_membership->userId = Yii::app ()->user->id;
					$new_membership->payment_id = $membership->payment_id;
					$new_membership->payment_date = time ();
					
					// the user has choosen to up/downgrade to another membership
					if ($membership->subscribed > 0)
						$new_membership->roleId = $membership->subscribed;
					else
						$new_membership->roleId = $membership->roleId;
					
					$role = GRole::model ()->findByPk ( $new_membership->roleId );
					$new_membership->end_date = time () + ($role->duration * 86400);
					
					$new_membership->save ();
				}
				$membership->end_date = 0;
				$membership->save ();
			}
		}
	}
}
