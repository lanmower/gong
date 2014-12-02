<?php
class GFileVideo extends GActiveRecord {
	/**
	 * Returns the static model of the specified AR class.
	 * 
	 * @return Image the static model class
	 */
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	
	/**
	 *
	 * @return string the associated database table name
	 */
	public function tableName() {
		return '{{file_video}}';
	}
	public function rules() {
		return array (
				array (
						'fileId',
						'safe' 
				) 
		);
	}
	public function getPath() {
		// die(Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "videos" . DIRECTORY_SEPARATOR .md5($this->id).'.m4v');
		return Yii::app ()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "videos" . DIRECTORY_SEPARATOR . md5 ( $this->fileId ) . '.m4v';
	}
	public function getFilePath() {
		return Yii::app ()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR . "files" . DIRECTORY_SEPARATOR . md5 ( $this->fileId );
	}
	public function getFileUrl($action = "downloadImage", $additionals = array()) {
		return Yii::app ()->getController ()->createUrl ( "/gong/post/file/{$action}", array_merge ( array (
				'id' => $this->hash,
				$additionals 
		) ) );
	}
	protected function beforeSave() {
		$line = 'nice -n 10 ffmpeg -i "' . $this->filePath . '" -y -strict experimental -acodec aac -b:a 64k -vcodec libx264 -vprofile baseline "' . $this->path . '" 2>&1 | tee -a ' . Yii::app ()->basePath . '/runtime/conversion.log';
		$result = null;
		$status = null;
		exec ( $line, $result, $status );
		
		// CVarDumper::dump($line, 10);
		// CVarDumper::dump($result, 10);
		// CVarDumper::dump("STATUS:"+$status, 10);
		if ($status !== 0) {
			return false;
		} else {
			return parent::beforeSave ();
		}
	}
	public function relations() {
		return array (
				'file' => array (
						self::BELONGS_TO,
						'GFile',
						'fileId' 
				) 
		);
	}
	public function beforeDelete() {
		$filename = $this->path;
		deleteFile ( $filename );
		return parent::beforeDelete ();
	}
}