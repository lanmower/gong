<?php
class GActiveHasAll extends GField {
	public $formName;
	public function getRelations() {
		if (!isset ( $this->formName )) return array();
		$ret = array(
				$this->name => array('formName'=>$this->formName, 'type'=>"HasAllRelation")
		);
		return $ret;
	}
	
}

?>