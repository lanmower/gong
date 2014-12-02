<?php
Yii::import ( 'gong.modules.haw.extensions.encoder.Encoder' );
class FtpFile extends CModel {
	public $path;
	public $data;
	public static function model($className = __CLASS__) {
		return parent::model ( $className );
	}
	public function attributeNames() {
		return array ();
	}
}
class EFtp extends CApplicationComponent {
	public $username, $password, $path, $encoder = true, $domain, $key;
	private $threads;
	function __construct() {
		$this->encoder = new Encoder ();
		$this->threads = array ();
	}
	public function makeFtp($src, $exclude) {
		$src = is_array ( $src ) ? $src : array (
				$src 
		);
		foreach ( $src as $item )
			if (file_exists ( $item )) {
				$this->addFtpItem ( realpath ( dirname ( $item . '../' ) ) . '/', realpath ( $item ) . '/', $exclude );
			}
		return true;
	}
	public function updateFtp($src, $exclude) {
		foreach ( $src as $item ) {
			if ($this->startsWith ( $item, 'A' ) || $this->startsWith ( $item, 'M' )) {
				$item = '../' . substr ( $item, 2 );
				$this->upload ( $item, str_replace ( '../', '', $item ), true );
			}
			if ($this->startsWith ( $item, 'R' )) {
				$this->delete ( $item );
			}
		}
	}
	function fpfilesize(&$fp) {
		$stat = fstat ( $fp );
		return $stat ["size"];
	}
	function startsWith($haystack, $needle) {
		$length = strlen ( $needle );
		return (substr ( $haystack, 0, $length ) === $needle);
	}
	function delete($file) {
		echo "Deleting: ";
		$ch = curl_init ();
		$this->setUrl ( $file, $ch );
		curl_setopt ( $ch, CURLOPT_QUOTE, array (
				"DELE $file" 
		) );
		curl_exec ( $ch );
		$this->curl_error ( $ch );
	}
	function endsWith($haystack, $needle) {
		return (strpos ( strrev ( $haystack ), strrev ( $needle ) ) === 0);
	}
	function queue($local, $file, $excl) {
		foreach ( $excl as $excl ) {
			if ($this->startsWith ( $file, $excl )) {
				return;
			}
		}
		$fp = fopen ( $local, 'r' );
		if ($this->fpfilesize ( $fp ) > 0)
			$data = fread ( $fp, $this->fpfilesize ( $fp ) );
		else
			$data = '';
		$encode = ($this->encoder && $this->endsWith ( $local, '.php' ) /*&& $this->startsWith($file, 'protected/modules')*/);
		if ($encode) {
			echo "Encoding: $file\n";
			$data = $this->encoder->encode ( $data, $this->key );
		}
		$ftp = new FtpFile ();
		$ftp->path = "ftp://{$this->path}{$file}";
		$ftp->data = $data;
		$fp = tmpfile ();
		fwrite ( $fp, $ftp->data );
		fflush ( $fp );
		rewind ( $fp );
		// fclose($fp);
		$this->upload ( $fp, $ftp->path, $encode );
	}
	function upload($fp, $path, $encode) {
		$error_no = 1;
		while ( $error_no ) {
			// echo CVarDumper::dump($path);
			$ch = curl_init ();
			echo "Uploading: $path\n";
			curl_setopt ( $ch, CURLOPT_URL, $path );
			curl_setopt ( $ch, CURLOPT_UPLOAD, 1 );
			curl_setopt ( $ch, CURLOPT_INFILE, $fp );
			curl_setopt ( $ch, CURLOPT_INFILESIZE, $this->fpfilesize ( $fp ) );
			curl_setopt ( $ch, CURLOPT_FTP_CREATE_MISSING_DIRS, true );
			curl_setopt ( $ch, CURLOPT_USERPWD, "$this->username:$this->password" );
			if ($this->endsWith ( $path, '.php' ))
				curl_exec ( $ch );
			$error_no = curl_errno ( $ch );
			curl_close ( $ch );
			if ($error_no != 0) {
				$message = "Error: $error_no.\n";
				echo "$message\n Retrying...\n";
				sleep ( 1 );
			}
		}
		fclose ( $fp );
	}
	private function addFtpItem($racine, $dir, $exclude) {
		$conv = str_replace ( $racine, '', $dir ) . "\n";
		if (is_dir ( $dir )) {
			$lst = scandir ( $dir );
			array_shift ( $lst );
			array_shift ( $lst );
			foreach ( $lst as $item ) {
				$this->addFtpItem ( $racine, $dir . $item . (is_dir ( $dir . $item ) ? '/' : ''), $exclude );
			}
		} elseif (is_file ( $dir )) {
			$this->queue ( $dir, str_replace ( $racine, '', $dir ), $exclude );
		}
	}
}

?>