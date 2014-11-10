<h2>Link users:</h2>
<?php
$lines = array();
if (Yii::app()->user->can('Reporter'))
    $lines[] = 'you get access to their exclusive posts';
if (Yii::app()->user->can('Producer'))
    $lines[] = 'they get access to your exclusive posts';
echo CHtml::tag('p', array(), 'When you are linked to a user ' . implode(' and ', $lines) . '.');
echo CHtml::form(array('invite'), 'GET');
echo CHtml::openTag('div', array('class' => 'inline well'));
echo 'Link with a new user';
echo CHtml::errorSummary($model);
echo CHtml::error($model, 'friendId');
echo CHtml::tag('br');
echo CHtml::label('User ID', 'friendId');
echo CHtml::textField('friendId');
echo CHtml::tag('br');
echo CHtml::submitButton('Submit');
echo CHtml::closeTag('div');
echo CHtml::endForm();

if (!empty($all)) {
        echo CHtml::label('All users:', 'all');
        $this->widget("GTable", array(
            'columns' => array(
                array("id" => "id", "name" => "id", "field" => "id", 'display' => false),
                array("id" => "hash", "name" => "User id", "field" => "hash", "width" => 80),
                array("id" => "firstname", "name" => "First Name", "field" => "profile.firstname", "width" => 150),
                array("id" => "lastname", "name" => "Last Name", "field" => "profile.lastname", "width" => 150),
                array("id" => "company", "name" => "Company", "field" => "profile.company", "width" => 200),
                array("id" => "message", "name" => "Link", "field" => "inviteLink", "width" => 100, 'formatter' => 'Raw')
            ),
            'data' => $all,
            'delete' => false,
            'controllerUrl' => $this->createUrl('user/') . '/',
                )
        );
} else {
    if (!empty($reporters)) {
            echo CHtml::label('Reporters:', 'reporters');
            $this->widget("GTable", array(
                'columns' => array(
                    array("id" => "id", "name" => "id", "field" => "id", 'display' => false),
                    array("id" => "hash", "name" => "User id", "field" => "hash", "width" => 80),
                    array("id" => "firstname", "name" => "First Name", "field" => "profile.firstname", "width" => 150),
                    array("id" => "lastname", "name" => "Last Name", "field" => "profile.lastname", "width" => 150),
                    array("id" => "company", "name" => "Company", "field" => "profile.company", "width" => 200),
                    array("id" => "message", "name" => "Link", "field" => "inviteLink", "width" => 100, 'formatter' => 'Raw')
                ),
                'data' => $reporters,
                'delete' => false,
                'controllerUrl' => $this->createUrl('user/') . '/',
                    )
            );
        }
}
?>
