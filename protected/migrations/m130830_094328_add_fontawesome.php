<?php

class m130830_094328_add_fontawesome extends CDbMigration
{
        public $db = 'm2m';
	public function up()
	{
            //$this->insert($this->db.'_page_element', array('className'=>'GFontAwesome', 'mode'=>1, 'pageId'=>2));
            
	}

	public function down()
	{
            $this->delete($this->db.'_page_element', "`className`='GFontAwesome'");
	}

}