<?php
echo GDrawWidget::drawWidget(new WidgetArrayField('GBillboard'));
$assetsUrl = Yii::app()->assetManager->publish('protected/modules/gong/modules/haw/assets', false, -1, YII_DEBUG);
Yii::app()->clientScript->registerScriptFile($assetsUrl . '/js/lib/jquery.jtable.js', CClientScript::POS_BEGIN);
Yii::app()->clientScript->registerCssFile($assetsUrl . '/css/jtable/jtable_basic.min.css');
$cs = new CClientScript();
Yii::app()->clientScript->registerScript("membership", "
            $('#membership').jtable({
				title: 'Memberships',
				actions: {
					listAction: '/gong/membership/list',
					//createAction: '/gong/membership/create',
					//updateAction: '/gong/membership/update',
					deleteAction: '/gong/membership/delete'
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
                                        organisation: {
                                                title: 'Organisation',
                                                create: false,
						edit: false,
						list: true
					},
                                        memberships: {
                                                title: 'Active Roles',
                                                create: false,
						edit: false,
						list: true
					},
                                        confirm: {
                                            display: function (data) {
                                                if(data.record.memberships == '') return '<a href=\"/gong/membership/update/id/'+data.record.id+'\">Confirm</a>';
                                            }
					},
                                }
			});
			$('#membership').jtable('load');
", CClientScript::POS_READY);
?>
<div id="membership"></div>
