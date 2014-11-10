<?php
$this->widget("GTable", array(
            'columns'=>array(
                array("id"=>"id", "name"=>"id", "field"=>"id", 'display'=>false),
                array("id"=>"name", "name"=>"Name", "field"=>"user.username", "width"=>220),
                array("id"=>"organisation", "name"=>"Organisation", 'width'=>270, "field"=>"user.profile.organisation"),
                array("id"=>"email", "name"=>"Email", 'width'=>350, "field"=>"user.profile.email"),
                array("id"=>"activate", "name"=>"Activate", "field"=>"activateLink", "width"=>60, "formatter"=>"Raw"),
                ),
            'data'=>$data->getData(),
        'width'=>"100%",
        'parentField'=>'parentId',
        //'options' => array('forceFitColumns' => true),
        'selectionModel'=>'row'
            )
        );
