<?php

Yii::import("gong.modules.site.models.GSitePage");
Yii::import("gong.modules.site.models.GSitePageElement");
Yii::import("gong.modules.site.models.GSiteTemplate");
Yii::import("gong.modules.site.models.GSiteTemplateElement");

class GElementRenderer {

    public static function startswith($haystack, $needle) {
        return substr($haystack, 0, strlen($needle)) === $needle;
    }

    public static function renderElement($model, $options = array()) {
        $return = array();
        //set ur error handle
        /* ob_start(function ($buffer) use ($model) {
          $error = error_get_last();
          if ($error['type'] == 1) {
          $errorOptions = array('class' => 'errorElement', 'data-errorlinktext' => '<label >Fatal Error </label>
          <ul>
          <li><b>Line</b> ' . $error['line'] . '</li>
          <li><b>Message</b> ' . $error['message'] . '</li>
          <li><b>File</b> ' . $error['file'] . '</li>
          </ul>');
          return CHtml::tag('div', $errorOptions, 'Error in ' . $model->name);
          }
          return $buffer;
          }); */
        if (isset($model->className)) {
            if (!class_exists($model->className)) {
                throw new CHttpException(500, "Classname $model->className does not exist for element name:$model->className");
            }
            if (isset($model->userAgentInclude)) {
                if (stristr($_SERVER['HTTP_USER_AGENT'], $model->userAgentInclude) == false) {
                    return;
                }
            }
            if (isset($model->userAgentExclude)) {
                if (stristr($_SERVER['HTTP_USER_AGENT'], $model->userAgentExclude) !== false) {
                    return;
                }
            }
            if (!Yii::app()->user->can($model->view))
                return;

            foreach ($model->fields as $key => $property) {
                if (property_exists($model->className, $key))
                    $options[$key] = $property;
                else if (YII_DEBUG) {
                    $errorOptions = array('class' => 'errorElement', 'data-errorlinktext' => "`$model->className` has no property like `$key`");
                    $return[] = CHtml::tag('div', $errorOptions, 'Error in ' . $model->name);
                }
            }
            if (property_exists($model->className, "model"))
                $options['model'] = $model;
            if (property_exists($model->className, "prefixContent"))
                $options['prefixContent'] = $model->prefixContent;
            if (property_exists($model->className, "suffixContent"))
                $options['suffixContent'] = $model->suffixContent;
            $options['id'] = $model->className . '-' . $model->hash;

            array_walk_recursive($options, function(&$value, $key) use ($model, $options) {
                        if (is_string($value)) {
                            if (self::startswith($value, 'translate:')) {
                                $exp = explode(':', $value);
                                $value = G::t($exp[1]);
                                return;
                            } else if (self::startswith($value, 'var:')) {
                                $exp = explode('var:', $value);
                                $value = Yii::app()->controller->getVar($exp[1]);
                                return;
                            } else if (self::startswith($value, 'url:')) {
                                $exp = explode('url:', $value);
                                $value = Yii::app()->controller->createUrl(CHtml::normalizeUrl($exp[1]));
                                return;
                            }
                            $value = preg_replace_callback('/{var:([\w,.]+)}/', function ($matches) use ($model, $options) {
                                        $var = Yii::app()->controller->getVar($matches[1]);
                                        if (isset($var) || is_null($var))
                                            return $var;
                                        else {
                                            $return[] = 'Variable:' . $matches[1] . ' not found in ' . $model->name;
                                            $return[] = CVarDumper::dump(Yii::app()->controller->vars, 3, true);
                                        }
                                    }, $value
                            );
                            $value = preg_replace_callback('/{translate:(.+)}/', function ($matches) {
                                        return G::t($matches[1]);
                                    }, $value
                            );
                            $value = preg_replace_callback('/{url:([\w,.\/]+)}/', function ($matches) {
                                        return Yii::app()->controller->createUrl(CHtml::normalizeUrl($matches[1]));
                                    }, $value
                            );
                        }
                    }
            );
            /* foreach ($options as $key => $value) {
              if (is_string($value)) {
              if (0 === strpos($value, 'translate:')) {
              $exp = explode(':', $value);
              $options[$key] = G::t($exp[1]);
              }
              if (0 === strpos($value, 'var:')) {
              $exp = explode(':', $value);
              $options[$key] = Yii::app()->controller->getVar($exp[1]);
              }
              }
              } */


            if (Yii::app()->user->can('ElementManager') && Yii::app()->user->can($model->edit)) {
                if (property_exists($model->className, "htmlOptions")) {
                    $html = "Name: $model->name<br/>";
                    $className = $model->className;
                    if (isset($className::$editorUrl)) {
                        $html .= CHtml::link('Edit', Yii::app()->controller->createUrl($className::$editorUrl, array('id' => $model->hash)), array('class' => 'editorLink'));
                    }
                    if (property_exists($model->className, "editContent"))
                        $options['editContent'] = CHtml::tag('div', array('class' => 'editlink'), CHtml::tag('div', array('class' => 'glyphicon glyphicon-wrench editlinkinner'), $html));
                }
            }
            if (property_exists($model->className, "htmlOptions")) {
                G::addClassToString($options['htmlOptions']['class'], $model->className . '-' . $model->hash);
                $options['htmlOptions']['id'] = $model->className . '-' . $model->hash;
                if (!empty($model->name))
                    G::addClassToString($options['htmlOptions']['class'], $model->name);
            }
            try {
                switch ($model->mode) {
                    case 1:
                        $return[] = Yii::app()->controller->widget($model->className, $options, true);
                        break;
                    case 2:
                        ob_start();
                        Yii::app()->controller->beginWidget($model->className, $options);
                        $return[] = ob_get_clean();
                        break;
                    case 3;
                        ob_start();
                        Yii::app()->controller->endWidget();
                        $return[] = ob_get_clean();
                        break;
                }
            } catch (CException $e) {
                if (YII_DEBUG) {
                    G::addClassToString($options['htmlOptions']['class'], 'errorElement');
                    $options['htmlOptions']['data-errorlinktext'] = 'Message:' . $e->getMessage() . "<br>";
                    $options['htmlOptions']['data-errorlinktext'] .= 'File:' . $e->getFile() . "<br>";
                    $options['htmlOptions']['data-errorlinktext'] .= 'Line:' . $e->getLine() . "<br>";
                    $options['htmlOptions']['data-errorlinktext'] .= 'Trace:' . $e->getTraceAsString();
                    $return[] = CHtml::tag('div', $options['htmlOptions'], 'Exception in ' . $model->className . ' name ' . $model->name);
                }
            }
        }
        return implode($return);
    }

    public static function render($model) {
        $ret = "";
        foreach ($model->children as $element) {
            $ret .= GElementRenderer::renderElement($element);
        }
        return $ret;
    }

}

?>
