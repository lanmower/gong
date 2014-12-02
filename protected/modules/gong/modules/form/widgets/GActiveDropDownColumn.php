<?php
class GActiveDropDownColumn extends CDataColumn {
	protected function renderDataCellContent($row, $data) {
		$field = $this->name;
		echo $data->getCell ( $field );
	}
}

?>
