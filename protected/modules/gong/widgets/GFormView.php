<?php
class GFormView extends GTag {
	public $formId = null;
	public $actions = true;
	public $saveAction = true;
	public $clearAction = true;
	public $resetAction = true;
	public function init() {
		$this->script = '$("html, body").animate({scrollTop: $("#' . $_GET ['scroll'] . '").offset().top}, 250);';
		parent::init ();
	}
	public function run() {
		$form = GForm::model ()->findByPk ( 'formId' );
		foreach ( $form->pages as $page ) {
			$pageForm = $this->beginWidget ( 'CActiveForm', array (
					'id' => 'FormPage-' . $page->name 
			) );
			echo $pageForm->errorSummary ( $data, "", "", $htmlOptions = array (
					'class' => 'errorSummary alert alert-danger' 
			) );
			$page->formWidget = $pageForm;
			$page->formData = $data;
			$page->mode = 'form';
			echo $page->html;
			if ($this->actions) {
				echo CHtml::openTag ( 'div', array (
						'class' => 'form-actions' 
				) );
				if ($this->saveAction)
					echo CHtml::button ( 'Save', array (
							'type' => 'submit',
							'class' => 'btn btn-large btn-primary' 
					) );
				if ($this->resetAction)
					echo CHtml::resetButton ( 'Restore', array (
							'class' => 'btn btn-large btn-primary' 
					) );
				if ($this->clearAction)
					echo CHtml::ajaxButton ( 'Clear', '#', array (), array (
							'class' => 'btn btn-large btn-primary clear',
							'onclick' => '$("GForm form").clearForm();' 
					) );
				echo CHtml::closeTag ( 'div' );
			}
			$this->endWidget ();
		}
		parent::run ();
	}
}

?>
