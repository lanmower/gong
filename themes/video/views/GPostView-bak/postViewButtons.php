<?php

$controller = Yii::app()->controller;

if (!$published) {
    echo CHtml::openTag('span', array('class' => 'controls well'));

    echo BsHtml::button(' Publish', array('class' => 'glyphicon glyphicon-thumbs-up btn btn-success publishBtn',
        'onclick' => '
                    $.ajax({
                        type: "GET",
                        url: "' . $controller->createUrl('/gong/post/post/publish/id/' . $model->hash . '/level/*') . '",
                        success: function(input) {
                            $(".searchTab").animateHighlight("#FFFF9C", 5000);
                        }
                    });

                '));

    echo CHtml::link(' Remove', $controller->createUrl('/gong/post/post/delete', array('id' => $model->hash)), array('id' => $model->hash, 'class' => 'nohash glyphicon glyphicon-remove btn btn-danger prompt removeBtn'));
    $this->widget('GFileUploadButton', array('id' => $id . '-uploader', 'url' => $controller->createUrl('/gong/post/file/upload/postId/' . $model->hash)));
    echo CHtml::closeTag('span');

    echo '<br>';
} else {
    echo CHtml::openTag('span', array('class' => 'controls well'));
    echo BsHtml::button(' Unpublish', array('class' => 'glyphicon glyphicon-thumbs-down btn btn-error unpublishBtn',
        'onclick' => '
                    $.ajax({
                        type: "GET",
                        url: "' . $controller->createUrl('/gong/post/post/publish/id/' . $model->hash . '/level/P"') . ',
                        success: function(input) {
                            $(".uploadTab").click().animateHighlight("#FFFF9C", 5000);
                        }
                    });
                '));
    echo CHtml::closeTag('span');
}
?>
