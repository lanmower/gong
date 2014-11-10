<?
echo '<h1>' . G::t('Create Role'). '</h1>';

$this->breadcrumbs=array(
	G::t('Roles')=>array('index'),
	G::t('Create'));

?>

<?
$model = new $this->modelClassname;
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'roleCreate',
            'action' =>$this->createUrl('create')
        ));
echo $this->renderPartial('_form', array('model'=>$model));
echo CHtml::submitButton();
$this->endWidget();
?>
