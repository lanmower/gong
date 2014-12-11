<?php
echo GDrawWidget::drawWidgetByName('CMSMENU');

$this->menu=array(
	array('label'=>'Create Options','url'=>array('create')),
	array('label'=>'Manage Options','url'=>array('admin')),
);
?>


<?php
        $assetsUrl = Yii::app()->assetManager->publish('protected/modules/gong/modules/haw/assets', false, -1, YII_DEBUG);
        Yii::app()->clientScript->registerScriptFile($assetsUrl.'/js/lib/jquery.jtable.js', CClientScript::POS_BEGIN);
        Yii::app()->clientScript->registerCssFile($assetsUrl.'/css/jtable/jtable_basic.min.css');
        $cs = new CClientScript();
        Yii::app()->clientScript->registerScript("options", "
            $('#options').jtable({
				title: 'Memberships',
				actions: {
					listAction: '/cms/membership/list',
					//createAction: '/cms/options/create',
					//updateAction: '/cms/membership/update',
					deleteAction: '/cms/membership/delete'
				},
				fields: {
                                        id: {
                                                key: true,
                                                create: false,
						edit: false,
						list: false
                                        },
                                        firstName: {
                                                title: 'Fist Name',
                                                create: false,
						edit: false,
						list: true
					},
                                        lastName: {
                                                title: 'Last Name',
                                                create: false,
						edit: false,
						list: true
					},
                                        confirm: {
                                        display: function (data) {
                                            return '<a href=\"#cms/membership/update/id/'+data.record.id+'\">Confirm</a>';
                                        }
					},
                                }
			});
			$('#options').jtable('load');
", CClientScript::POS_READY);
?>
<div id="options"></div>
<?php /*$this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); */?>
