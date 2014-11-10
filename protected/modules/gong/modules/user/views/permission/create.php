<?
echo '<h1>' . G::t('Create Permission'). '</h1>';

$this->breadcrumbs=array(
	G::t('Permissions')=>array('index'),
	G::t('Create'));

?>

<?
$model = new $this->modelClassname;
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'permissionCreate',
            'action' =>$this->createUrl('create')
        ));
echo $this->renderPartial('_form', array('model'=>$model));
echo CHtml::submitButton();
$this->endWidget();
?>
