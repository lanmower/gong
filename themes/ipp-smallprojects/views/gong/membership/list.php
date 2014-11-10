<?php

$this->widget("GTable", array(
    'columns' => array(
        array("id" => "id", "name" => "id", "field" => "id", 'display' => false),
        array("id" => "name", "name" => "Name", 'width' => 220, "field" => "user.username"),
        array("id" => "company_name", "name" => "Company Name", 'width' => 270, "field" => "user.profile.company_name"),
        array("id" => "email", "name" => "Email", 'width' => 370, "field" => "user.profile.email"),
        array("id" => "activate", "name" => "Activate", "field" => "id", "formatter" => "Slick.Formatters.ActivationLinkFormatter"),
    ),
    'data' => $data->getData(),
    'script' => '$.extend(true, window, {
        "Slick": {
            "Formatters": {
                "ActivationLinkFormatter": function (row, cell, value, columnDef, dataContext) {
                    return "<a href=\"/gong/membership/update/id/"+dataContext.id+"\">Activate</a>";
                }                            
            }
        }
    });
    '
        )
);
