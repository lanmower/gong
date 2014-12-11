<?php
class GHtmlStripper {
	public static function truncate($text, $length, $suffix = '...', $isHTML = true) {
		$doc = new DOMDocument ();
		libxml_use_internal_errors ( TRUE );
		// $doc->loadHTML(substr($text, 0, $length). $suffix);
		$doc->loadHTML ( substr ( $text, 0, strrpos ( substr ( $text, 0, $length ), ' ' ) ) . $suffix );
		libxml_use_internal_errors ( FALSE );
		$doc->formatOutput = TRUE;
		return $doc->saveHTML ();
	}
	public static function removeTables($html) {
		$pattern [] = '%<table\b[^>]*+>(?:(?R)|[^<]*+(?:(?!</?table\b)<[^<]*+)*+)*+</table>%i';
		$replace [] = '';
		return preg_replace ( $pattern, $replace, $html );
	}
}

?>
