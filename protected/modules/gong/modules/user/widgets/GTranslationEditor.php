<?php
Yii::import ( 'gong.modules.user.models.GTranslation' );
class GTranslationEditor extends GTag {
	public $message = true;
	public $model = null;
	public function init() {
		if ($this->model == null) {
			$this->text .= BsHtml::labelBs ( $this->message );
			$this->model = GTranslation::model ()->find ( '`message` = :message', array (
					':message' => $this->message 
			) );
		} else {
			$this->text .= BsHtml::labelBs ( $this->model->message );
		}
		$this->text .= $this->widget ( 'GInlineEditable', array_merge ( array (
				'htmlOptions' => $this->htmlOptions 
		), array (
				'htmlOptions' => array (
						'id' => $this->id . '-editable' 
				),
				'pk' => $this->model->id,
				'url' => '/gong/user/translation/inlineUpdate',
				'name' => "translation",
				'value' => $this->model->translation,
				'type' => 'editor' 
		)
		 ), true );
		parent::init ();
	}
}

?>
