<?php
Yii::import("gong.modules.file.models.GFileImage");
Yii::import("gong.modules.file.models.GFileAudio");
Yii::import("gong.modules.file.models.GFileVideo");

class GFile extends GActiveRecord {
    public $error;
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    public function tableName() {
        return '{{file}}';
    }

    public function behaviors() {
        return array(
            'Timestamp' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => 'created',
                'updateAttribute' => 'modified',
            ),
            'Ownership' => array(
                'class' => 'GOwnershipBehavior',
                'attributes'=> array('userId')
            ),
            'Permissions' => array(
                'class' => 'GPermissionsBehavior',
            ),
            'DeleteChildren' => array(
                'class' => 'GDeleteChildrenBehavior',
                'childAttributes' => array('audio', 'images')
            )
        );
    }


    public function getPath() {
        return dirname(Yii::app()->request->scriptFile) . DIRECTORY_SEPARATOR . "protected" . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "files" . DIRECTORY_SEPARATOR .md5($this->id);
    }

    public function rules() {
        return array(
            array('filename, created, modified, filename, type', 'safe'),
        );
    }

    public function relations() {
        return array(
            'audio' => array(self::HAS_ONE, 'GFileAudio', 'fileId', 'together'=>true),
            'video' => array(self::HAS_ONE, 'GFileVideo', 'fileId', 'together'=>true),
            'images' => array(self::HAS_MANY, 'GFileImage', 'fileId'),
            'user' => array(self::BELONGS_TO, 'GUser', 'userId'), 
        );
    }
    
    public function getImage($type = 'l') {
        return GFileImage::model()->find('fileId = :id AND type = :type', array(':id'=>$this->id, ':type'=>$type));
    }

    public function beforeDelete() {
        deleteFile($this->path);
        return parent::beforeDelete();
    }

    protected function afterSave() {
        parent::afterSave();
    }
    
}