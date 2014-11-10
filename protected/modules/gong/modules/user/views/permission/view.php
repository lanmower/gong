<?

if (isset($actions))
    foreach ($actions as $action) {
        printf('<h2>%s</h2>', $action->title);
        echo G::t('The following users have permission to perform the action {action}:', array(
            '{action}' => $action->title));
        if ($action->permissions) {
            foreach ($action->permissions as $permission) {
                echo '<ul>';
                $role = GRole::model()->findByPk($permission->roleId);
                echo '<li>' . CHtml::link($role->title, array('/role/view', 'id' => $user->id)) . '</li>';
                echo '</ul>';
            }
        }
    } else
echo G::t('No user has this permission');
?>

