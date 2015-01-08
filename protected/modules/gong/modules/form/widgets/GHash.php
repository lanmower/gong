<?php
class GHash extends GField {
	public function init() {
	}
	public function run() {
		echo PseudoCrypt::hash($this->submission->id);
		parent::run ();
	}
	public function getCell($value) {
		return PseudoCrypt::hash($this->submission->id);
	}
	public function getGridColumns() {
		return array (
				array (
						'name' => $this->name,
						'class' => 'GDataColumn'
				)
		);
	}
	public function getRules() {
		$rules = $this->_rules;
		// if ($this->required)
		// $rules = array_merge($rules, array('required'));
		$rules = array_merge ( $rules, array (
				'safe' 
		) );
		return $rules;
	}
	}

?>
