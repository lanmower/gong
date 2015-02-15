<?php
/*class PseudoCrypt {
	
	private static $golden_primes = array (
			'1' => '1',
			'41' => '59',
			'2377' => '1677',
			'147299' => '187507',
			'9132313' => '5952585',
			'566201239' => '643566407',
			'35104476161' => '22071637057',
			'2176477521929' => '294289236153',
			'134941606358731' => '88879354792675',
			'8366379594239857' => '7275288500431249',
			'518715534842869223' => '280042546585394647' 
	);
	
	private static $chars62 = array (
			0 => 48,
			1 => 49,
			2 => 50,
			3 => 51,
			4 => 52,
			5 => 53,
			6 => 54,
			7 => 55,
			8 => 56,
			9 => 57,
			10 => 65,
			11 => 66,
			12 => 67,
			13 => 68,
			14 => 69,
			15 => 70,
			16 => 71,
			17 => 72,
			18 => 73,
			19 => 74,
			20 => 75,
			21 => 76,
			22 => 77,
			23 => 78,
			24 => 79,
			25 => 80,
			26 => 81,
			27 => 82,
			28 => 83,
			29 => 84,
			30 => 85,
			31 => 86,
			32 => 87,
			33 => 88,
			34 => 89,
			35 => 90,
			36 => 97,
			37 => 98,
			38 => 99,
			39 => 100,
			40 => 101,
			41 => 102,
			42 => 103,
			43 => 104,
			44 => 105,
			45 => 106,
			46 => 107,
			47 => 108,
			48 => 109,
			49 => 110,
			50 => 111,
			51 => 112,
			52 => 113,
			53 => 114,
			54 => 115,
			55 => 116,
			56 => 117,
			57 => 118,
			58 => 119,
			59 => 120,
			60 => 121,
			61 => 122 
	);
	public static function base62($int) {
		$key = "";
		while ( bccomp ( $int, 0 ) > 0 ) {
			$mod = bcmod ( $int, 62 );
			$key .= chr ( self::$chars62 [$mod] );
			$int = bcdiv ( $int, 62 );
		}
		return strrev ( $key );
	}
	public static function hash($num) {
		$ceil = bcpow ( 62, 5 );
		$primes = array_keys ( self::$golden_primes );
		$prime = $primes [5];
		$dec = bcmod ( bcmul ( $num, $prime ), $ceil );
		$hash = substr ( self::base62 ( $dec ), - 5 );
		return $hash;
	}
	public static function unbase62($key) {
		$int = 0;
		foreach ( str_split ( strrev ( $key ) ) as $i => $char ) {
			$dec = array_search ( ord ( $char ), self::$chars62 );
			$int = bcadd ( bcmul ( $dec, bcpow ( 62, $i ) ), $int );
		}
		return $int;
	}
	public static function unhash($hash) {
		$len = strlen ( $hash );
		$ceil = bcpow ( 62, $len );
		$mmiprimes = array_values ( self::$golden_primes );
		$mmi = $mmiprimes [$len];
		$num = self::unbase62 ( $hash );
		$dec = bcmod ( bcmul ( $num, $mmi ), $ceil );
		return $dec;
	}
	
}*/

class PseudoCrypt {

    //const $codeset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //readable character set excluded (0,O,1,l)
    const codeset = "23456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";

    static function hash($n){
        $base = strlen(self::codeset);
        $converted = '';

        while ($n > 0) {
            $converted = substr(self::codeset, bcmod($n,$base), 1) . $converted;
            $n = self::bcFloor(bcdiv($n, $base));
        }

        return $converted ;
    }

    static function unhash($code){
        $base = strlen(self::codeset);
        $c = '0';
        for ($i = strlen($code); $i; $i--) {
            $c = bcadd($c,bcmul(strpos(self::codeset, substr($code, (-1 * ( $i - strlen($code) )),1))
                    ,bcpow($base,$i-1)));
        }

        return bcmul($c, 1, 0);
    }

    static private function bcFloor($x)
    {
        return bcmul($x, '1', 0);
    }

    static private function bcCeil($x)
    {
        $floor = bcFloor($x);
        return bcadd($floor, ceil(bcsub($x, $floor)));
    }

    static private function bcRound($x)
    {
        $floor = bcFloor($x);
        return bcadd($floor, round(bcsub($x, $floor)));
    }
}
