<?php
$cs = new CClientScript ();
Yii::app ()->clientScript->registerScript ( "membership", "
            $('#membership').jtable({
				title: 'Memberships',
				actions: {
					listAction: '/gong/user/membership/list',
					//createAction: '/gong/user/membership/create',
					//updateAction: '/gong/user/membership/update',
					deleteAction: '/gong/user/membership/delete'
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
                                        companyName: {
                                                title: 'Company Name',
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
                                                if(data.record.memberships == '') return '<a href=\"/gong/user/membership/update/id/'+data.record.id+'\">Confirm</a>';
                                            }
					},
                                }
			});
			$('#membership').jtable('load');
", CClientScript::POS_READY );
?>
<div id="membership"></div>
