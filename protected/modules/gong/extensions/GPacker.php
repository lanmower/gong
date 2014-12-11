<?php
Yii::import ( 'application.modules.gong.extensions.encoder.Encoder' );
class GPacker extends CApplicationComponent {
	public $path, $encoder = true, $dest, $key;
	function __construct() {
		$this->encoder = new Encoder ();
	}
	public function make($src, $exclude) {
		$src = is_array ( $src ) ? $src : array (
				$src 
		);
		foreach ( $src as $item )
			if (file_exists ( $item )) {
				$this->addItem ( realpath ( dirname ( $item . '../' ) ) . '/', realpath ( $item ) . '/', $exclude );
			}
		return true;
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
		foreach ( $excl as $exclude ) {
			if ($this->startsWith ( "protected/{$this->path}{$file}", $exclude )) {
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
		fclose ( $fp );
		$dest = $this->dest . $this->path . $file;
		echo "Writing $dest";
		if (! file_exists ( dirname ( $dest ) ))
			mkdir ( dirname ( $dest ), 0777, true );
		$fp = fopen ( $dest, 'w' );
		fwrite ( $fp, $data );
		fflush ( $fp );
		fclose ( $fp );
		
		echo "\n";
	}
	private function addItem($racine, $dir, $exclude) {
		$conv = str_replace ( $racine, '', $dir ) . "\n";
		if (is_dir ( $dir )) {
			$lst = scandir ( $dir );
			array_shift ( $lst );
			array_shift ( $lst );
			foreach ( $lst as $item ) {
				$this->addItem ( $racine, $dir . $item . (is_dir ( $dir . $item ) ? '/' : ''), $exclude );
			}
		} elseif (is_file ( $dir )) {
			$this->queue ( $dir, str_replace ( $racine, '', $dir ), $exclude );
		}
	}
}

?>