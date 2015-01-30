<?php
if (count ( $this->model->videoFiles )) {
	echo CHtml::openTag ( 'table', array (
					'class' => 'GPostVideoFiles table' 
					) );
					echo CHtml::openTag ( 'tr' );
					echo CHtml::Tag ( 'th', array (), 'Title' );
					echo CHtml::closeTag ( 'tr' );
					foreach ( $this->model->videoFiles as $file ) {
						$fileId = 'GPostFile-' . $file->hash;
						echo CHtml::openTag ( 'tr', array (
						'class' => $fileId 
						) );
						echo $this->render ( 'gong.modules.post.views.file._video', array (
						'file' => $file,
						'post' => $this->model 
						), true );
						echo CHtml::closeTag ( 'tr' );
					}
					echo CHtml::closeTag ( 'table' );
}
?>
