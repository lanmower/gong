<?php

/**
 * @property string $title
 * @property string $artist
 * @property string $album
 * @property integer $year
 * @property string $comment
 * @property string $track
 * @property integer $genre
 */
class GFileAudio extends GActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return GFileAudio the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return '{{file_audio}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        return array(
            array('year', 'numerical', 'integerOnly' => true),
            array('title, artist, album, track', 'length', 'max' => 255),
            array('comment', 'length', 'max' => 4096),
            array('artist, album, year, comment, track, genre', 'safe'),
        );
    }

    private function writeTags() {
        Yii::import('application.vendors.getid3');
        require_once('getid3/getid3.php');
        getid3_lib::IncludeDependency(Yii::app()->basePath.'/vendors/getid3/write.php', __FILE__, true);

        $tagwriter = new getid3_writetags;
        $tagwriter->tagformats = array('id3v2');
        $tagwriter->overwrite_tags = true;
        $tagwriter->tag_encoding = 'UTF-8';
        $tagwriter->remove_other_tags = true;

        $TagData['title'][] = $this->title;
        $TagData['artist'][] = $this->artist;
        $TagData['album'][] = $this->album;
        $TagData['year'][] = $this->year;
        $TagData['comment'][] = $this->comment;
        $TagData['track'][] = $this->track;
        $TagData['genre'][] = $this->genre;
        $tagwriter->tag_data = $TagData;
        $tagwriter->FormatDataForID3v1();
        $tagwriter->WriteTags();
    }
    
    public function getPath() {
        return Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR ."files" . DIRECTORY_SEPARATOR .md5($this->fileId);
    }

    
    public function readTags() {
        Yii::import('application.vendors.getid3');
        require_once('getid3/getid3.php');
        $getID3 = new getID3;
        $fileInfo = $getID3->analyze($this->path);
        getid3_lib::CopyTagsToComments($fileInfo);
        if (!empty($fileInfo['comments_html']['title'][0]))
            $this->title = $fileInfo['comments_html']['title'][0];
        if (!empty($fileInfo['comments_html']['artist'][0]))
            $this->artist = $fileInfo['comments_html']['artist'][0];
        if (!empty($fileInfo['comments_html']['album'][0]))
            $this->album = $fileInfo['comments_html']['album'][0];
        if (!empty($fileInfo['comments_html']['year'][0]))
            $this->year = $fileInfo['comments_html']['year'][0];
        if (!empty($fileInfo['comments_html']['comment'][0]))
            $this->comment = $fileInfo['comments_html']['comment'][0];
        if (!empty($fileInfo['comments_html']['genre'][0]))
            $this->genre = $fileInfo['comments_html']['genre'][0];
        if (!empty($fileInfo['comments_html']['track'][0]))
            $this->track = $fileInfo['comments_html']['track'][0];
    }

    protected function beforeSave() {
        $this->writeTags();
        $line = 'nice -n 10 ffmpeg -i "'.$this->path.'" -c:a libvorbis -ac 1 -vn -aq 20 "'.$this->oggPath.'" 2>&1 | tee -a '.Yii::app()->basePath.'/runtime/conversion.log';
        $result = null;
        $status = null;
        exec($line, $result, $status);
        print_r($result);
        if($status !== 0) return false;
        else {
            $line = 'nice -n 10 ffmpeg -i "'.$this->path.'" -c:a alac -ab 96k -ar 48000 -ac 1 -y -vn "'.$this->m4aPath.'" 2>&1 | tee -a '.Yii::app()->basePath.'/runtime/conversion.log';
            $result = null;
            $status = null;
            exec($line, $result, $status);
            print_r($result);
            if($status !== 0) return false;
            else return parent::beforeSave();
        }
        
    }
    
    public function getOggPath() {
        return Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR ."ogg" . DIRECTORY_SEPARATOR .md5($this->fileId).'.ogg';
    }
    
    public function getM4aPath() {
        return Yii::app()->basePath . DIRECTORY_SEPARATOR . "data" . DIRECTORY_SEPARATOR ."m4a" . DIRECTORY_SEPARATOR .md5($this->fileId).'.m4a';
    }

    public function beforeDelete() {
        deleteFile($this->oggPath);
        deleteFile($this->m4aPath);
        return parent::beforeDelete();
    }
}
