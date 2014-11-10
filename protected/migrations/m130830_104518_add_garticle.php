<?php

class m130830_104518_add_garticle extends CDbMigration
{
        public $db = 'm2m';
	public function up()
	{
            //$this->insert($this->db.'_page_element', array('className'=>'GArticle', 'mode'=>1, 'pageId'=>3));
            
	}

	public function down()
	{
            $this->delete($this->db.'_page_element', "`className`='GArticle'");
	}
}