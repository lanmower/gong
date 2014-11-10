<?php
Yii::import('gong.modules.widget.models.File');
Yii::import('gong.modules.widget.models.Image');
class GFileGroup extends GTag {

    public $model, $hideContent, $listOptions, $headerOptions, $lazyLoad;
    
    public function init() {
        $this->listOptions['class'] = 'GFileGroupList';
        if ($this->hideContent) {
            if (isset($this->listOptions['style']))
                $this->listOptions['style'] .= ';display:none;';
            else
                $this->listOptions['style'] = 'display:none;';
        }
        $this->headerOptions = array();
        $this->headerOptions['class'] = 'GFileGroupHeader';

        $this->htmlOptions['id'] = $this->hash;

        echo CHtml::tag('h2', $this->headerOptions, $this->model->title);
        echo $this->text;
    }

    public function run() {
        echo CHtml::openTag('ul', $this->listOptions);
        foreach ($this->model->files as $file) {
            if (Yii::app()->user->can($file->view)) {
                echo CHtml::openTag('li');
                echo CHtml::link($file->description, $file->fileUrl, array('class' => 'nohijack'));
                if ($file->image)
                    echo CHtml::image($file->fileUrl . '/e/i');
                echo CHtml::closeTag('li');
            }
        }
        echo '<li>' . CHtml::tag('small', array('class' => 'muted small'), sizeof($this->model->files) . " Files") . '</li>';
        echo CHtml::closeTag('ul', $this->listOptions);
        echo $this->suffixContent;
    }

}

?>
