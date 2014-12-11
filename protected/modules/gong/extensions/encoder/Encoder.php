<?php
class Encoder extends CApplicationComponent {
	private function rstr($data) { // Random String Function
	                               // echo $data;
		return sprintf ( "%u", crc32 ( $data ) );
	}
	public function enjumble($data, $key = null) { // Custom Encoding + Base64 + gzinflate()
		if ($key == null)
			$key = str_pad ( $_SERVER ['SERVER_NAME'], strlen ( $v ), $_SERVER ['SERVER_NAME'] );
		$l = strlen ( $key );
		for($i = 0; $i < strlen ( $data ); $i ++) {
			$data [$i] = $data [$i] ^ $key [$i % $l];
		}
		$v = base64_encode ( gzdeflate ( $data, 9 ) );
		return $v;
	}
	private function striptag($in) { // Remove '<?php' from initial code
		$pos = strpos ( $in, "<?php" ) || strpos ( $in, "<?" ); // to do: add support for short_tags
		if (is_numeric ( $pos )) {
			for($i = $pos; $i <= $pos + 4 && strlen ( $in ) >= 5; $i ++) {
				$in [$i] = ' ';
			}
			return $in;
		} else {
			return $in;
		}
	}
	public function encode($str, $origKey = false) {
		$str = $this->enjumble ( '?>' . $this->striptag ( $str ), $origKey );
		// $pieces = str_split($str, 80);
		// $str = implode("\".\n\"", $pieces);
		return "<?php\n" . "// Copyright (c) Almagest Fraternite.\n" . "// almagestfraternite@gmail.com\n" . "eval(dec(\"$str\"));?>";
	}
}

?>