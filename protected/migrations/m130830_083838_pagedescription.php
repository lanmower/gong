<?php

class m130830_083838_pagedescription extends CDbMigration
{
        public $db = 'm2m';

	public function up()
	{
            /*$this->addColumn($this->db.'_page', 'description', 'text');
            $this->addColumn($this->db.'_page_element', 'userId', 'integer');*/
	}

	public function down()
	{
            $this->dropColumn($this->db.'_page', 'description');
	}

}