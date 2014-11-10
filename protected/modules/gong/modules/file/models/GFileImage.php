<?php

class GFileImage extends GActiveRecord {
    private $heightBased = true;
    /**
     * Returns the static model of the specified AR class.
     * @return Image the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{file_image}}';
    }

    public function getPath() {
        return Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "files" . DIRECTORY_SEPARATOR .md5($this->fileId).'-'.$this->type;
    }

    public function getFilePath() {
        return Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "files" . DIRECTORY_SEPARATOR .md5($this->fileId);
    }

    public function getFileUrl($action = "downloadImage", $additionals = array()) {
        return Yii::app()->getController()->createUrl("/gong/post/file/{$action}", array_merge(array('id' => $this->hash, $additionals)));
    }

    public function beforeSave() {
        Yii::import('gong.modules.file.components.GImageCropper');
        $cropper = new GImageCropper();
        $cropper->load($this->filePath);
        if($this->heightBased) $cropper->resizeToHeight($this->width, $this->height);
        else $cropper->resizeToWidth($this->width, $this->height);
        $cropper->interlace();
        $cropper->save($this->path);
        $this->width = $cropper->image_info[0];
        $this->height = $cropper->image_info[1];
        
        if ($cropper->image_type == IMAGETYPE_JPEG) {
            $this->file->mime = 'image/jpg';
            $this->file->save('mime');
        } elseif ($cropper->image_type == IMAGETYPE_GIF) {
            $this->file->mime = 'image/gif';
            $this->file->save('mime');
        } elseif ($cropper->image_type == IMAGETYPE_PNG) {
            $this->file->mime = 'image/png';
            $this->file->save('mime');
        }
        return parent::beforeSave();
    }
    public function relations() {
        return array(
            'file' => array(self::BELONGS_TO, 'GFile', 'fileId'), 
        );
    }

    public function beforeDelete() {
        $filename = $this->path;
        deleteFile($filename);
        return parent::beforeDelete();
    }
}