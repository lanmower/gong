<?php

Yii::import("gong.modules.user.models.GUser");

class GWebUser extends CWebUser {

    public $_data;
    public $_actions = array();
    public $_roles;

    public function loginRequired() {
        $app = Yii::app();
        $request = $app->getRequest();

        $session = Yii::app()->session;
        $session->open();
        if (!$request->isAjaxRequest)
            $this->setReturnUrl($request->getUrl());
        else
            $session['refresh'] = true;

        if (($url = $this->loginUrl) !== null) {
            if (is_array($url)) {
                $route = isset($url[0]) ? $url[0] : $app->defaultController;
                $url = $app->createUrl($route, array_splice($url, 1));
            }
            $request->redirect($url);
        }
        else
            throw new CHttpException(403, Yii::t('yii', 'Login Required'));
    }

    public function getData() {
        if ($this->_data instanceof GUser)
            return $this->_data;
        else if ($this->id && $this->_data = GUser::model()->findByPk($this->id))
            return $this->_data;
        else
            return $this->_data = new GUser();
    }

    private function setAction($action, $itemId, $value) {
        if(!isset($this->_actions[$action])) $this->_actions[$action] = array();
        return $this->_actions[$action][$itemId] = $value;
    }

    public function evaluate($action, $itemId) {
        
        
        $action = trim($action);
        if($action == 'disabled') return false;
        if(array_key_exists($action, $this->_actions))
        if(array_key_exists($itemId, $this->_actions[$action]))
            return $this->_actions[$action][$itemId];
        if ($action == '*') return $this->setAction($action, $itemId, true);
        if ($action == 'P' && Yii::app()->user->id == $itemId) {
            return true;
        }
        if ($action == 'g') {
            if (Yii::app()->user->isGuest)
                return $this->setAction($action, $itemId, true);
            else
                return $this->setAction($action, $itemId, false);
        }

        if ($action == '@' && !Yii::app()->user->isGuest)
            return $this->setAction($action, $itemId, true);

        if ($this->name == $action)
            return $this->setAction($action, $itemId, true);
        if ($this->name == 'admin')
            return $this->setAction($action, $itemId, true);

        if ($this->data->approved != 0) {
            if ($this->id == $action)
                return $this->setAction($action, $itemId, true);

            if ($this->hasRole($action))
                return $this->setAction($action, $itemId, true);

            foreach ($this->data->getPermissions() as $permission)
                if ($permission == $action)
                    return $this->setAction($action, $itemId, true);
        }
        return $this->setAction($action, $itemId, false);
    }

    public function can($actions, $itemId = null) {
        if (!$actions)
            return false;
        foreach (explode(",", $actions) as $action) {
            if ($this->evaluate($action, $itemId))
                return true;
        }

        return false;
    }

    public function getHash() {
        return $this->_data->hash;
    }

    /**
     * Checks if the user has the given Role
     * @mixed Role string or array of strings that should be checked
     * @int (optional) id of the user that should be checked 
     * @return bool Return value tells if the User has access or hasn't access.
     */
    public function hasRole($role) {
        // Check if a user has a active membership and, if so, add this
        // to the roles
        if(!is_array($role)) $role = array($role);
        $roles = $this->data->activeRoles;
        if (isset($roles))
            foreach ($roles as $roleobj) {
                if (in_array($roleobj->title, $role) ||
                        in_array($roleobj->id, $role))
                    return true;
            }

        return false;
    }

    public function loggedInAs() {
        if ($this->isGuest)
            return G::t('Guest');
        else
            return $this->data()->username;
    }

    /**
     * Return admin status.
     * @return boolean
     */
    public function isAdmin() {
        if ($this->isGuest)
            return false;
        else
            return Yii::app()->user->data->superuser;
    }

}

?>
