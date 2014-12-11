<div class="container">
    <?php 
        $this->widget('zii.widgets.CBreadcrumbs', array(
            'links' => $this->breadcrumbs,
        ));
        echo $content;
    ?>
</div>
