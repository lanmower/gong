<?php
class GExporter {
	static $init = 0;
	public $title = "";
	public $subject = "";
	public $description = "";
	public $sheets = array ();
	private static function bootstrap() {
		if (! self::$init) {
			Yii::import ( 'ext.yiiexcel.YiiExcel', true );
			Yii::registerAutoloader ( array (
					'YiiExcel',
					'autoload' 
			), true );
			PHPExcel_Shared_ZipStreamWrapper::register ();
			if (ini_get ( 'mbstring.func_overload' ) & 2) {
				throw new Exception ( 'Multibyte function overloading in PHP must be disabled for string functions (2).' );
			}
			PHPExcel_Shared_String::buildCharacterSets ();
			self::$init = 1;
		}
	}
	public function export() {
		$this->bootstrap ();
		$pe = new PHPExcel ();
		$prop = $pe->getProperties ();
		$prop->setCreator ( "Yii-Gong Excel Generator" );
		$prop->setLastModifiedBy ( "Yii-Gong Excel Generator" );
		$prop->setTitle ( $this->title );
		$prop->setSubject ( $this->subject );
		$prop->setDescription ( $this->description );
		$sheetIndex = 0;
		foreach ( $this->sheets as $sheetName => $sheetData ) {
			$pe->setActiveSheetIndex ( $sheetIndex ++ );
			$workSheet = $pe->getActiveSheet ();
			foreach ( $sheetData as $rowIndex => $rowData ) {
				foreach ( $rowData as $cellIndex => $cellData ) {
					$workSheet->setCellValueByColumnAndRow ( $cellIndex, $rowIndex + 1, $cellData );
				}
			}
			$pe->getActiveSheet ()->setTitle ( $sheetName );
		}
		$writer = new PHPExcel_Writer_Excel2007 ( $pe );
		$writer->save ( 'protected/data/test.xlsx' );
	}
}

?>
