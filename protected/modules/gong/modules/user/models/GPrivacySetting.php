<?

class GPrivacysetting extends GActiveRecord
{
	public static function model($className = __CLASS__)
	{
		return parent::model($className);
	}

	public function primaryKey()
	{
		return 'userId';
	}

	public function tableName()
	{
		return '{{privacysetting}}';
	}

	public function rules()
	{
		return array(
			array('userId, message_new_friendship, message_new_message, message_new_profilecomment', 'required'),
			array('appear_in_search, message_new_friendship, message_new_message, message_new_profilecomment, public_profile_fields, show_online_status, log_profile_visits', 'numerical', 'integerOnly' => true),
			array('userId', 'length', 'max' => 10),
			array('ignore_users', 'length', 'max' => 255),
			array('ignore_users', 'match', 'pattern' => '/^(\w)+(,\w+)*$/'),
			array('userId, message_new_friendship, message_new_message, message_new_profilecomment', 'safe', 'on' => 'search'),
		);
	}

	public function getIgnoredUsers()
	{
		return explode(',', $this->ignore_users);
	}

	public function relations()
	{
		return array(
			'user' => array(self::BELONGS_TO, 'GUser', 'userId')
		);
	}

	public function beforeValidate()
	{
		$this->ignore_users = trim(strtr($this->ignore_users, array(', ' => ',')));
		if (!isset($this->message_new_friendship) || is_null($this->message_new_friendship))
			$this->message_new_friendship = true;
		if (!isset($this->message_new_message) || is_null($this->message_new_message))
			$this->message_new_message = true;
		if (!isset($this->message_new_profilecomment) || is_null($this->message_new_profilecomment))
			$this->message_new_profilecomment = true;

		return parent::beforeValidate();
	}

	public function attributeLabels()
	{
		return array(
			'show_online_status' => G::t('Show online status'),
			'ignore_users' => G::t('Ignored users'),
			'userId' => G::t('User'),
			'appear_in_search' => G::t('Let me appear in the search'),
			'message_new_friendship' => G::t('Receive a Email for new Friendship request'),
			'message_new_message' => G::t('Receive a Email when new Message arrives'),
			'message_new_profilecomment' => G::t('Receive a Email when a new profile comment was made'),
			'log_profile_visits' => G::t('Profilbesuche preisgeben'),

		);
	}

	public function search()
	{
		$criteria = new CDbCriteria;

		$criteria->compare('userId', $this->userId, true);
		$criteria->compare('message_new_friendship', $this->message_new_friendship);
		$criteria->compare('message_new_message', $this->message_new_message);
		$criteria->compare('message_new_profilecomment', $this->message_new_profilecomment);

		return new CActiveDataProvider(get_class($this), array(
		                                                      'criteria' => $criteria,
		                                                 ));
	}
}
