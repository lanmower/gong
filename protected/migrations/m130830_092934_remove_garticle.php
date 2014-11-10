<?php

class m130830_092934_remove_garticle extends CDbMigration
{
        public $db = 'm2m';
	public function up()
	{
            //$this->delete($this->db.'_page_element', "`className`='GArticle'");
	}

	public function down()
	{
	}

	/*
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	}

	public function safeDown()
	{
	}
	*/
}