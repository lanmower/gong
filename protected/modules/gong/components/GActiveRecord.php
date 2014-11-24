<?php

abstract class GActiveRecord extends CActiveRecord {

    public $_behaviors;

    public function getDeleteRedirect() {
        return $this->backLink;
    }

    public function getCreateRedirect() {
        return $this->backLink;
    }

    public function getUpdateRedirect() {
        return $this->backLink;
    }

    public function getBackLink() {
        if (isset($this->parentClass))
            return array($this->parent->controllerId . '/view', 'id' => CHtml::value($this, 'parent.hash'));
        return 'list';
    }
    
    public function getModelClassName() {
        return get_class($this);
    }
    public function getModelLabel() {
        return G::splitCamelCase($this->controllerId);
    }
    public function getControllerId() {
        return lcfirst(str_replace($this->prefix, '', $this->modelClassName));
    }
    public function getPrefix() {
        $id = str_replace(G::getPath(), '', Yii::app()->controller->module->id);
        return G::getPrefix().ucfirst($id);
    }
    
    public function attachBehavior($name, $behavior) {
        return $this->_behaviors[$name] = parent::attachBehavior($name, $behavior);
    }

    public function getBehaviors() {
        return $this->_behaviors;
    }

    public function limit($limit = 10) {
        $this->getDbCriteria()->mergeWith(array(
            'limit' => $limit,
        ));
        return $this;
    }

    public function order($order = 'id') {
        $this->getDbCriteria()->mergeWith(array(
            'order' => $order,
        ));
        return $this;
    }

    public function getHash($attribute = null) {
        if (!isset($attribute))
            return PseudoCrypt::hash($this->getPrimaryKey());
        else
            return PseudoCrypt::hash($this->getAttribute($attribute));
    }

    /**
     * @return CActiveRecordMetaData the meta for this AR class.
     */
    public function getMetaData() {
        $md = parent::getMetaData();
        if ($this->getScenario() === 'search') {
            $md->attributeDefaults = array();
        }
        return $md;
    }
    public function relations() {
        $rel = array();
        if(isset($this->parentClass)) $rel['parent'] = array(self::BELONGS_TO, $this->parentClass, 'parentId');
        if(isset($this->childClass)) $rel['children'] = array(self::HAS_MANY, $this->childClass, 'parentId', 'order' => 'children.weight ASC');
        return $rel;
    }

}

?>
