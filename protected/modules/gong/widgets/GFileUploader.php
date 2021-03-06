<?php
class GFileUploader extends GTag {
	public $form = true;
	public $buttonOptions = array ();
	public $progressBar = true;
	public $fileList = true;
	public function init() {
		$fileupload = Yii::app ()->assetManager->publish ( 'protected/vendors/file-upload', false, - 1, YII_DEBUG );
		$this->core [] = array (
				'name' => 'jquery' 
		);
		$this->js [] = array (
				'url' => $fileupload . '/js/vendor/jquery.ui.widget.js' 
		);
		$this->js [] = array (
				'url' => $fileupload . '/js/jquery.iframe-transport.js' 
		);
		$this->js [] = array (
				'url' => $fileupload . '/js/jquery.fileupload.js' 
		);
		?>
<!--[if (gte IE 8)&(lt IE 10)]>
        <script src="<?php echo $fileupload;?>/js/cors/jquery.xdr-transport.js"></script>
        <![endif]-->
<?php
		if (isset ( $this->url ))
			$this->htmlOptions ['data-url'] = $this->url;
		
		$this->script = "
        var local = $(\"#uploadinput\");
        var filelist = $(local.data('filelist'));
        var files=0;
        local.fileupload({
            dataType: 'json',
            sequentialUploads: true,
            maxChunkSize: 0,
            multipart: true,
            url: local.data('url'),

            add: function(e, data) {
                data.context = $('.progress_context:first').clone();
                $('.progress_bar_wrapper').append(data.context);
                data.context.find($('.upload_file_name')).html(data.files[0].name);
                data.context.find($('.progress-bar')).find('div').css('width',  '1%').find('span').html('Queued');
                data.context.show();
                $('.uploaderStatus').show();
                data.submit();
                files++;
            },
            done: function(e, data) {
                if (data.context) {
                    data.context.find($('.progress-bar')).find('div').css('width','100%').find('span').html('100%');
                    setTimeout(function() { data.context.fadeOut(450); }, 2000);
                    setTimeout(function() { data.context.hide(); }, 2500);
                    setTimeout(function() { data.context.hide(); }, 60000);
                }
                --files;
                setTimeout(function() { if(files == 0) { $('.uploaderStatus').fadeOut(); } }, 2000);
                $().processQueue(data.result.html, $.alm.defaultTarget);
            }
        });
        local.bind('fileuploadprogress', function (e, data) {
            if (data.context) {
                progress = parseInt(data.loaded / data.total * 100, 10);
                data.context.find($('.progress-bar')).find('div').css('width', ''+ progress + '%').find('span').html(''+progress + '%');
            }
        });
        ";
		parent::init ();
	}
	public function run() {
		echo '<form style="width: 0px; height: 0px;" class="form-upload">';
		if ($this->fileList === true) {
			$fileList = "$this->id-fileList";
		} else
			$fileList = $this->fileList;
		if ($this->progressBar === true) {
			$progressBar = "$this->id-progressBar";
		} else
			$progressBar = $this->progressBar;
		echo "<input id='uploadinput' style='height:0px;width:0px;' class='GFileUploader-uploadinput' data-filelist='.$fileList' data-progress='.$progressBar .bar' type='file' name='files[]'  multiple>";
		echo '</form>';
		echo '<div class="inner uploaderStatus">';
		echo "  <div class='$progressBar progress_bar_wrapper progress-animated'>";
		echo '      <div class="progress_context" style="margin:10px 0px; display:none;">';
		echo "          <span class='cancelButton'>Cancel</span>";
		echo "          <div class='progress-bar progress-bar-success' style='width:100px'><div style='width:0px;'><span></span></div></div>";
		echo '          <div class="upload_file_name" style="margin-top:5px; margin-bottom:-5px; display:inline-block"></div>';
		echo '      </div>';
		echo "  </div>";
		echo '</div>';
		parent::run ();
	}
}

?>
