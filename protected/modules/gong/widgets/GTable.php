<?php
class GTable extends GTag {
	public $columns = array ();
	public $data;
	public $options = array (
			"bPaginate" => false,
			"bLengthChange" => false,
			"bFilter" => false,
			"bSort" => false,
			"bInfo" => false,
			"bAutoWidth" => false 
	);
	public $dataTables = false;
	public $controllerUrl;
	public $updateAction;
	public $view = '*';
	public $delete = '*';
	public $fields = false;
	public $actions;
	public $tableOptions = array (
			'class' => 'table' 
	);
	public $importJsonEditor;
	public function imports() {
		if ($this->dataTables) {
			$this->core [] = array (
					'name' => 'jquery.ui' 
			);
			$this->core [] = array (
					'name' => 'jquery' 
			);
			$datatablesUrl = Yii::app ()->assetManager->publish ( 'protected/vendors/datatables', false, - 1, YII_DEBUG );
			if (YII_DEBUG)
				$this->js [] = array (
						'url' => $datatablesUrl . '/media/js/jquery.dataTables.min.js',
						CClientScript::POS_BEGIN 
				);
			else
				$this->js [] = array (
						'url' => $datatablesUrl . '/media/js/jquery.dataTables.js',
						CClientScript::POS_BEGIN 
				);
			// $this->js[] = array('url' => $datatablesUrl . '/media/bootstrap/3/dataTables.bootstrap.js', CClientScript::POS_BEGIN);
			// $this->css[] = array('url' => $datatablesUrl . '/media/css/jquery.dataTables.css', CClientScript::POS_HEAD);
			// $this->css[] = array('url' => $datatablesUrl . '/media/bootstrap/3/dataTables.bootstrap.css', CClientScript::POS_HEAD);
		}
	}
	public function init() {
		$this->imports ();
		
		if ($this->dataTables) {
			$options = CJavaScript::jsonEncode ( $this->options );
			$this->script = "$('.$this->id table').dataTable($options);";
		}
		if (is_string ( $this->data )) {
			$this->data = Yii::app ()->controller->getVar ( $this->data );
		}
		
		if (! isset ( $this->updateAction ))
			$this->updateAction = $this->controllerUrl . '/inlineUpdate';
		
		parent::init ();
	}
	public function stripData($data, $columns) {
		$dataOut = array ();
		foreach ( $data as $rowkey => $row ) {
			$dataOut [$rowkey] = array ();
			foreach ( $columns as $col ) {
				try {
					if (isset ( $col ['id'] ))
						$dataOut [$rowkey] [$col ['id']] = CHtml::value ( $row, $col ['field'] );
				} catch ( Exception $e ) {
					$errorOptions = array (
							'class' => 'errorElement',
							'data-errorlinktext' => "Error in GTable field {$col['name']}: {$e->getMessage()}" 
					);
					$dataOut [$rowkey] [$col ['field']] = CHtml::tag ( 'div', $errorOptions, 'Error' );
				}
			}
			if (isset ( $dataOut [$rowkey] ['id'] ))
				$dataOut [$rowkey] ['id'] = PseudoCrypt::hash ( $dataOut [$rowkey] ['id'] );
		}
		return $dataOut;
	}
	public function stripColumns($columns) {
		$columnsOut = array ();
		foreach ( $columns as $key => $col ) {
			if (isset ( $col ['id'] )) {
				if (! isset ( $col ['name'] ))
					$col ['name'] = ucfirst ( $col ['id'] );
				if (! isset ( $col ['field'] ))
					$col ['field'] = $col ['id'];
				$columnsOut [$col ['id']] = $col;
			} else {
				$columnsOut [] = $col;
			}
		}
		return $columnsOut;
	}
	public function run() {
		$columns = $this->stripColumns ( $this->columns );
		$data = $this->stripData ( $this->data, $columns );
		echo CHtml::openTag ( 'table', $this->tableOptions );
		$columnsHtml = '';
		foreach ( $columns as $column ) {
			if (! isset ( $column ['display'] ) || $column ['display']) {
				if (isset ( $column ['name'] )) {
					$columnsHtml .= CHtml::openTag ( 'th' );
					$columnsHtml .= $column ['name'];
					$columnsHtml .= CHtml::closeTag ( 'th' );
				}
			}
		}
		// print header row
		if (! empty ( $columnsHtml )) {
			echo CHtml::openTag ( 'thead' );
			echo CHtml::openTag ( 'tr' );
			echo $columnsHtml;
			echo CHtml::closeTag ( 'tr' );
			echo CHtml::closeTag ( 'thead' );
		}
		if (Yii::app ()->user->can ( $this->delete ))
			$this->actions [] = '<a class="prompt" href="' . $this->controllerUrl . '/delete/id/{child:id}"><i class=\'glyphicon glyphicon-trash\'></i></a>';
		if (Yii::app ()->user->can ( $this->view ))
			$this->actions [] = '<a href="' . $this->controllerUrl . '/view/id/{child:id}"><i class=\'glyphicon glyphicon-search\'></i></a>';
		if (Yii::app ()->user->can ( $this->fields )) {
			$this->actions [] = '<a href="' . $this->controllerUrl . '/update/id/{child:id}"><i class=\'glyphicon glyphicon-search\'></i></a>';
			$this->importJsonEditor = true;
		}
		// print data rows
		$purifier = new CHtmlPurifier ();
		foreach ( $data as $row ) {
			$updated = array ();
			echo CHtml::openTag ( 'tr' );
			foreach ( $columns as $column ) {
				if (! isset ( $column ['display'] ) || $column ['display']) {
					if (isset ( $column ['editor'] )) {
						switch ($column ['editor']) {
							case 'textarea' :
								$updated [$column ['id']] = $this->widget ( 'GInlineEditable', array (
										'pk' => PseudoCrypt::unhash ( CHtml::value ( $row, $columns ['id'] ['field'] ) ),
										'htmlOptions' => array (
												'id' => $this->id . $columns ['id'] ['field'] . '-editor',
												'class' => 'titleEditor' 
										),
										'url' => $this->updateAction,
										'name' => $column ['field'],
										'value' => CHtml::value ( $row, $column ['id'] ),
										'type' => 'text' 
								), true );
								break;
						}
					}
					echo CHtml::openTag ( 'td' );
					if (isset ( $column ['formatter'] ))
						switch ($column ['formatter']) {
							case 'Raw' :
								echo CHtml::value ( $row, $column ['id'] );
								break;
							
							case 'Actions' :
								foreach ( $this->actions as $action )
									echo preg_replace_callback ( '/{child:([\w,.]+)}/', function ($matches) use($row) {
										return CHtml::value ( $row, $matches [1] );
									}, $action );
								break;
							
							case 'Checkmark' :
								break;
						}
					else {
						if (isset ( $column ['id'] ))
							echo isset ( $updated [$column ['id']] ) ? CHtml::value ( $updated, $column ['id'] ) : CHtml::value ( $row, $column ['id'] );
					}
					echo CHtml::closeTag ( 'td' );
				}
			}
			echo CHtml::closeTag ( 'tr' );
		}
		echo CHtml::closeTag ( 'table' );
		if ($this->importJsonEditor) {
			$jsonEditorUrl = Yii::app ()->assetManager->publish ( 'protected/vendors/jsoneditor', false, - 1, YII_DEBUG );
			Yii::app ()->clientScript->registerScriptFile ( $jsonEditorUrl . '/jsoneditor-min.js' );
			Yii::app ()->clientScript->registerCssFile ( $jsonEditorUrl . '/jsoneditor-min.css' );
		}
		parent::run ();
	}
}

?>
