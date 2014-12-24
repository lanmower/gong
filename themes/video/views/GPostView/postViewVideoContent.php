<?php
foreach ($this->model->videoFiles as $video) {
	echo CHtml::tag('div', array(), $video->filename);
}
?>
