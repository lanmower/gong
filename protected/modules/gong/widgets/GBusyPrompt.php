<?php
class GBusyPrompt extends GTag {
	public $loadingImage, $savingImage;
	public $loadingText = 'Receiving. . .';
	public $savingText = 'Sending. . .';
	public $loading;
	public $saving;
	public function init() {
		if (isset ( $this->loadingImage ))
			$this->loadingImage = CHtml::image ( $this->loadingImage, 'loadingImage' );
		if (isset ( $this->savingImage ))
			$this->savingImage = CHtml::image ( $this->savingImage, 'savingImage' );
		$this->append ( 'loadingImage', $loading );
		$this->append ( 'loadingText', $loading );
		$this->append ( 'savingImage', $saving );
		$this->append ( 'savingText', $saving );
		if (! empty ( $loading )) {
			echo CHtml::tag ( 'div', array (
					'class' => 'Loading' 
			), $loading );
		}
		if (! empty ( $saving )) {
			echo CHtml::tag ( 'div', array (
					'class' => 'Saving' 
			), $saving );
		}
		parent::init ();
	}
	public function run() {
		parent::run ();
	}
}

?>
