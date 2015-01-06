<?php
Yii::import ( 'gong.modules.file.models.GFile' );
Yii::import ( 'gong.modules.file.models.GFileImage' );
Yii::import ( 'gong.modules.file.models.GFileVideo' );
abstract class GFileController extends GModelController {
	protected $uploads = null;
	protected $json = null;
	public function accessRules() {
		return array (
				array (
						'allow',
						'actions' => array (
								'delete',
								'upload',
								'download',
								'downloadImage',
								'details' 
						),
						'users' => array (
								'@' 
						) 
				),
				array (
						'deny', // deny all users
						'users' => array (
								'*' 
						) 
				) 
		);
	}
	protected function makeTemp() {
		if (isset ( $_SERVER ["CONTENT_LENGTH"] )) {
			$inputSize = ( int ) $_SERVER ["CONTENT_LENGTH"];
		} else {
			throw new Exception ( 'Getting content length is not supported.' );
		}
		
		$input = fopen ( "php://input", "r" );
		$tmpfname = tempnam ( "/tmp", "tmp" );
		$temp = fopen ( $tmpfname, 'w' );
		$fileSize = stream_copy_to_stream ( $input, $temp );
		fclose ( $input );
		fclose ( $temp );
		
		if ($fileSize != $inputSize) {
			unlink ( $tmpfname );
			return false;
		}
		return $tmpfname;
	}
	protected function moveTmp($tmpfname, $path) {
		try {
			if (rename ( $tmpfname, $path )) {
				return true;
			}
			return false;
		} catch ( Exception $e ) {
			return false;
		}
	}
	public function handleFormUpload($file) {
		try {
			
			// Undefined | Multiple Files | $_FILES Corruption Attack
			// If this request falls under any of them, treat it invalid.
			if (! isset ( $_FILES [$file] ['error'] ) || ! is_array ( $_FILES [$file] ['error'] )) {
				throw new CHttpException ( 500, 'Invalid parameters.' . CVarDumper::dumpAsString ( $_FILES [$file] ) );
			}
			
			switch ($_FILES [$file] ['error'] [0]) {
				case UPLOAD_ERR_OK :
					break;
				case UPLOAD_ERR_NO_FILE :
					throw new CHttpException ( 500, 'No file sent.' );
				case UPLOAD_ERR_INI_SIZE :
				case UPLOAD_ERR_FORM_SIZE :
					throw new CHttpException ( 500, $_SERVER ['CONTENT_LENGTH'] . 'Exceeded filesize limit of.' . ini_get ( 'post_max_size' ) );
				default :
					throw new CHttpException ( 500, 'Unknown errors.' . $_FILES [$file] ['error'] [0] );
			}
		} catch ( CHttpException $e ) {
			die ( CVarDumper::dump ( $e ) );
		}
	}
	public function actionUpload() {
		$this->json = array ();
		$this->json ['files'] = array ();
		if (isset ( $_FILES ) && ! empty ( $_FILES )) {
			foreach ( $_FILES as $key => $value ) {
				$this->handleFormUpload ( $key );
				$upload = $value;
			}
		} else {
			$upload = array ();
			$upload ['tmp_name'] = array (
					$this->makeTemp () 
			);
			$upload ['name'] = array (
					'' 
			);
			// upload['name'] = $this->makeTemp();
		}
		if (isset ( $upload ) && is_array ( $upload ['tmp_name'] )) {
			// param_name is an array identifier like "files[]",
			// $_FILES is a multi-dimensional array:
			foreach ( $upload ['tmp_name'] as $index => $value ) {
				$this->json = $this->save ( $upload, $index );
			}
		} else {
			// param_name is a single object identifier like "file",
			// $_FILES is a one-dimensional array:
			$this->json = $this->save ( $upload, 0 );
		}
	}
	public function actionProcess() {
		self::process ();
	}
	protected function save($upload, $index) {
		$filename = $upload ['name'] [$index];
		$file = new GFile ();
		$file->filename = $filename;
		
		Yii::import ( 'application.vendors.getid3' );
		require_once ('getid3/getid3.php');
		$getID3 = new getID3 ();
		getid3_lib::IncludeDependency ( 'protected/vendors/getid3/write.php', __FILE__, true );
		$fileInfo = $getID3->analyze ( $upload ['tmp_name'] [$index] );
		if (isset ( $fileInfo ['video'] )) { // has video
			if ($fileInfo ['video'] ['dataformat'] == 'jpg' || $fileInfo ['video'] ['dataformat'] == 'gif' || $fileInfo ['video'] ['dataformat'] == 'png' || $fileInfo ['video'] ['dataformat'] == 'bmp')
				$file->type = 'image';
			else
				$file->type = 'video';
		} else if (isset ( $fileInfo ['audio'] )) { // has no video, has audio
			$file->type = 'audio';
		} else {
			$file->type = 'data';
		}
		
		if (isset ( $file->type )) {
			if (! $file->save ())
				throw new CHttpException ( 500, "error saving file data " . CHtml::errorSummary ( $file ) );
			if (! $this->moveTmp ( $upload ['tmp_name'] [$index], $file->path ))
				throw new CHttpException ( 400, "moving {$upload['tmp_name'][$index]} to $filename failed" );
			$this->uploads [] = $file;
			if ($file->type == 'image') {
				$result = 0;
				$image = new GFileImage ();
				$image->fileId = $file->id;
				$image->width = 128;
				$image->height = 128;
				$image->type = 's';
				$result |= $image->save ();
				$image = new GFileImage ();
				$image->fileId = $file->id;
				$image->width = 300;
				$image->height = 300;
				$image->type = 'm';
				$result |= $image->save ();
				$image = new GFileImage ();
				$image->fileId = $file->id;
				$image->width = 600;
				$image->height = 600;
				$image->type = 'l';
				$result |= $image->save ();
				$image = new GFileImage ();
				$image->fileId = $file->id;
				$image->width = 1024;
				$image->height = 768;
				$image->type = 'v';
				$result |= $image->save ();
				if (! $result)
					throw new CHttpException ( 500, CHtml::errorSummary ( $image ) );
				else {
					$file->processed = 1;
					if (! $file->save ())
						throw new CHttpException ( 500, CHtml::errorSummary ( $file ) );
				}
			}
			
			return array (
					'success' => true 
			);
		}
	}
	public static function consoleOut($line) {
		$handle = fopen ( Yii::app ()->basePath . '/runtime/conversion.log', 'w+' );
		fwrite ( $handle, $line );
		fclose ( $handle );
	}
	public static function process() {
		$files = GFile::model ()->findAll ( 'processed = 0' );
		self::consoleOut ( "JOBS " . sizeof ( $files ) );
		$job = 1;
		
		foreach ( $files as $file ) {
			try {
				if ($file->type == 'video') {
					$video = new GFileVideo ();
					$video->fileId = $file->id;
					if (! $video->save ())
						self::consoleOut ( CHtml::errorSummary ( $video ) );
					else {
						$file->processed = 1;
						if (! $file->save ())
							self::consoleOut ( CHtml::errorSummary ( $file ) );
					}
					// $file->video = $video;
				}
				if ($file->type == 'audio') {
					$audio = new GFileAudio ();
					$audio->fileId = $file->id;
					$audio->readTags ();
					if (empty ( $id3->title ))
						$audio->title = $file->filename;
					if (empty ( $id3->artist ))
						$audio->artist = 'Unknown Artist';
					if (empty ( $id3->album ))
						$audio->album = 'Unknown Album';
					if (! $audio->save ())
						self::consoleOut ( CHtml::errorSummary ( $audio ) );
					else {
						$file->processed = 1;
						if (! $file->save ())
							self::consoleOut ( CHtml::errorSummary ( $file ) );
					}
					// $file->audio = $audio;
				}
				$line = 'echo JOBSDONE ' . $job ++ . ' | tee -a ' . Yii::app ()->basePath . '/runtime/conversion.log';
				exec ( $line );
			} catch ( CException $e ) {
				echo "ERROR:";
				echo $e->getMessage ();
				echo $e->getTraceAsString ();
			}
		}
		Yii::app ()->end ();
	}
	public function actionDownload($id) {
		Yii::app ()->session->close ();
		$file = $this->loadModel ( $id );
		if (! file_exists ( $file->file->path ) || ! is_file ( $file->file->path )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		$file->file->user->addToAccount ( $file->file->size );
		GDownloadHelper::download ( $file->file->path, null, $file->id );
	}
	public function actionDownloadOgg($id) {
		Yii::app ()->session->close ();
		$file = $this->loadModel ( $id );
		if (! file_exists ( $file->file->audio->oggPath ) || ! is_file ( $file->file->audio->oggPath )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		$file->file->user->addToAccount ( $file->file->size );
		GDownloadHelper::download ( $file->file->audio->oggPath, 'audio/ogg', $file->file->id . '.ogg' );
	}
	public function actionDownloadMp3($id) {
		Yii::app ()->session->close ();
		$file = $this->loadModel ( $id );
		if (! file_exists ( $file->file->path ) || ! is_file ( $file->file->path )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		$file->file->user->addToAccount ( $file->file->size );
		GDownloadHelper::download ( $file->file->path, $file->file->mime, $file->file->id . '.mp3' );
	}
	public function actionDownloadM4v($id) {
		Yii::app ()->session->close ();
		$file = $this->loadModel ( $id );
		if (! file_exists ( $file->file->video->path ) || ! is_file ( $file->file->video->path )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		$file->file->user->addToAccount ( $file->file->size );
		GDownloadHelper::download ( $file->file->video->path, $file->file->mime, $file->file->id . '.m4v' );
	}
	public function actionDownloadM4a($id) {
		Yii::app ()->session->close ();
		$file = $this->loadModel ( $id );
		if (! file_exists ( $file->file->audio->path ) || ! is_file ( $file->file->audio->path )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		$file->file->user->addToAccount ( $file->file->size );
		GDownloadHelper::download ( $file->file->video->path, $file->file->mime, $file->file->id . '.m4a' );
	}
	public function actionDownloadImage($type, $id) {
		Yii::app ()->session->close ();
		$id = PseudoCrypt::unhash ( $id );
		$image = GFileImage::model ()->find ( "`fileId` = \"$id\" AND `type` = \"$type\"" );
		
		if (! file_exists ( $image->path ) || ! is_file ( $image->path )) {
			throw new CHttpException ( 400, 'The requested file does not exist.' );
		}
		
		GDownloadHelper::download ( $image->path, $image->file->mime, $image->file->filename );
	}
	public function actionDetails($id) {
		$file = $this->loadModel ( $id );
		$this->render ( 'details', array (
				'file' => $file 
		) );
	}
}

?>
