<?php
class GDumpColumn extends CDataColumn {
	protected function renderDataCellContent($row, $data) {
		echo CVarDumper::dump ( $data [$this->name], 10, true );
	}
}

?>
