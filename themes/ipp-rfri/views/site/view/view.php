<?php
$content = new WidgetArrayField('GContent');
$content->content = GDrawWidget::drawWidget($model);
echo GDrawWidget::drawWidget($content);
?>
