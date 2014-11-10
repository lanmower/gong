<?php

/**
 * This is the model class for table "{{bid3}}".
 *
 * The followings are the available columns in table '{{bid3}}':
 * @property integer $id
 * @property string $firstName
 * @property string $lastName
 * @property string $email
 * @property string $projectName
 * @property string $projectCompanyName
 * @property string $projectCompanyNumber
 * @property string $submissionWindow
 * @property string $projectCapacity
 * @property string $projectTechnology
 * @property string $siteLong
 * @property string $siteLat
 * @property string $siteProvince
 * @property string $nameDis
 * @property string $locationDis
 * @property string $interLocation
 * @property string $substationLong
 * @property string $substationLat
 * @property string $created
 * @property string $modified
 */
class BidWindowThree extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return BidWindowThree the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{bid3}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('firstName, lastName, email, projectName, projectCompanyName, projectCompanyNumber, submissionWindow, projectCapacity, projectTechnology, siteLongDD, siteLongMM, siteLongSS, siteLatDD, siteLatMM, siteLatSS, siteProvince, nameDis, locationDis, interLocation, substationLongDD, substationLongMM, substationLongSS, substationLatDD, substationLatMM, substationLatSS', 'required'),
            array('firstName, lastName, email, projectName, projectCompanyName, projectCompanyNumber, submissionWindow, projectCapacity, projectTechnology, siteLongDD, siteLongMM, siteLongSS, siteLatDD, siteLatMM, siteLatSS, siteProvince, nameDis, locationDis, interLocation, substationLongDD, substationLongMM, substationLongSS, substationLatDD, substationLatMM, substationLatSS', 'length', 'max' => 255),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, firstName, lastName, email, projectName, projectCompanyName, projectCompanyNumber, submissionWindow, projectCapacity, projectTechnology, siteLongDD, siteLongMM, siteLongSS, siteLatDD, siteLatMM, siteLatSS, siteProvince, nameDis, locationDis, interLocation, substationLongDD, substationLongMM, substationLongSS, substationLatDD, substationLatMM, substationLatSS', 'safe', 'on' => 'search'),
        );
    }

    public function beforeSave() {
        $this->userId = Yii::app()->user->id;
        return parent::beforeSave();
    }

    public function behaviors() {
        return array(
            'CTimestampBehavior' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => 'created',
                'updateAttribute' => 'modified',
            ),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'firstName' => 'Lead Contact First Name',
            'lastName' => 'Lead Contact Surname',
            'email' => 'Lead contact Email',
            'projectName' => 'Project Name',
            'projectCompanyName' => 'Name of Bidder or Project Company',
            'projectCompanyNumber' => 'Project Company Registration Number',
            'submissionWindow' => 'Submission Window',
            'projectCapacity' => 'Project Capacity (Net at delivery point)',
            'projectTechnology' => 'Project Technology',
            'siteLong' => 'Site Longitude (East)',
            'siteLat' => 'Site Latitude (South)',
            'siteProvince' => 'Site Province',
            'nameDis' => 'Name of Distributor',
            'locationDis' => 'Location of Distributor',
            'interLocation' => 'Interconnection Location',
            'substationLong' => 'Substation Longitude (East)',
            'substationLat' => 'Substation Latitude (South)',
            'created' => 'Created',
            'modified' => 'Modified',
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('firstName', $this->firstName, true);
        $criteria->compare('lastName', $this->lastName, true);
        $criteria->compare('email', $this->email, true);
        $criteria->compare('projectName', $this->projectName, true);
        $criteria->compare('projectCompanyName', $this->projectCompanyName, true);
        $criteria->compare('projectCompanyNumber', $this->projectCompanyNumber, true);
        $criteria->compare('submissionWindow', $this->submissionWindow, true);
        $criteria->compare('projectCapacity', $this->projectCapacity, true);
        $criteria->compare('projectTechnology', $this->projectTechnology, true);
        $criteria->compare('siteLong', $this->siteLongDD, true);
        $criteria->compare('siteLong', $this->siteLongMM, true);
        $criteria->compare('siteLong', $this->siteLongSS, true);
        $criteria->compare('siteLat', $this->siteLatDD, true);
        $criteria->compare('siteLat', $this->siteLatMM, true);
        $criteria->compare('siteLat', $this->siteLatSS, true);
        $criteria->compare('siteProvince', $this->siteProvince, true);
        $criteria->compare('nameDis', $this->nameDis, true);
        $criteria->compare('locationDis', $this->locationDis, true);
        $criteria->compare('interLocation', $this->interLocation, true);
        $criteria->compare('substationLong', $this->substationLongDD, true);
        $criteria->compare('substationLong', $this->substationLongMM, true);
        $criteria->compare('substationLong', $this->substationLongSS, true);
        $criteria->compare('substationLat', $this->substationLatDD, true);
        $criteria->compare('substationLat', $this->substationLatMM, true);
        $criteria->compare('substationLat', $this->substationLatSS, true);
        $criteria->compare('created', $this->created, true);
        $criteria->compare('modified', $this->modified, true);

        return new CActiveDataProvider($this, array(
                    'criteria' => $criteria,
                ));
    }

}