<?php

class GFriendshipWidget extends GTag {

    public function init() {
        $this->addclass('inline alert alert-info ');
        parent::init();
    }

    public function run() {
        $links = Yii::app()->user->data->getApprovedFriendships();
        if (!empty($links))
            echo count($links);
        echo CHtml::openTag('i', array('class' => 'glyphicon glyphicon-link glyphicon-2x')) . CHtml::closeTag('i');

        $invitations = Yii::app()->user->data->getPendingInvitations();
        echo CHtml::link('Link with users', '/gong/user/friendship/invite', array('class' => 'btn btn-default'));
        if (!empty($invitations)) {
            echo CHtml::link(count($invitations) . ' Pending link invitations', '/gong/user/friendship/approve', array('class' => 'btn btn-default'));
        }
        if (!empty($links)) {
            echo CHtml::link(count($links) . ' Linked users', '/gong/user/friendship/listApproved', array('class' => 'btn btn-info'));
        }
        parent::run();
    }

}

?>
