<?php
class GBrowserWarning extends GTag {
	public function run() {
		?>
<span class="GTag widget closeLink"> <a href="javascript:;"> <i
		class="glyphicon glyphicon-remove"></i>
</a>
</span>
<h4 class="GTag widget" id="widget-2134">Did you know that your web
	browser is out of date?</h4>
<p class="GTag widget" id="widget-2135">To get the best possible
	experience using our website we recommend that you update to a newer
	version or other web browser. A list of the most popular web browsers
	can be found below.</p>
<div class="GTag widget broswerDiv">
	<div class="GTag widget well">
		<a target="_blank" class="nohijack"
			href="https://www.google.com/intl/en/chrome/browser/"> <img
			src="/themes/base/images/logos/chrome.png" alt="Google Chrome Logo" />
		</a>
		<div>Google Chrome</div>
	</div>
	<div class="well">
		<a target="_blank" class="nohijack"
			href="http://www.mozilla.org/en-US/firefox/new/"> <img
			src="/themes/base/images/logos/firefox.png" alt="Fire Fox Logo" />
		</a>
		<div>Mozilla Firefox</div>
	</div>
	<div class="well">
		<a target="_blank" class="nohijack"
			href="http://support.apple.com/kb/dl1531"> <img
			src="/themes/base/images/logos/safari.png" alt="Safari Logo">
		</a>
		<div>Safari</div>
	</div>
	<div class="well">
		<a class="nohijack" target="_blank"
			href="http://www.opera.com/computer/windows"> <img
			src="/themes/base/images/logos/opera.png" alt="Opera Logo" />
		</a>
		<div>Opera</div>
	</div>
</div>
<?php
		echo CHtml::closeTag ( 'div' );
	}
}
?>
