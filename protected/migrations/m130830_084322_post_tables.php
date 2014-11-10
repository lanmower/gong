<?php

class m130830_084322_post_tables extends CDbMigration {

    public $db = 'm2m';

    public function up() {
        /*$this->createTable($this->db . '_post_file', array(
            'id' => 'pk',
            'view' => 'string DEFAULT \'*\'',
            'edit' => 'string',
            'delete' => 'string',
            'filename' => 'text',
            'description' => 'text',
            'created' => 'datetime',
            'modified' => 'datetime',
            'weight' => 'integer',
            'postId' => 'integer',
            'userId' => 'integer',
                )
        );
        $this->createTable($this->db . '_post', array(
            'id' => 'pk',
            'name' => 'string',
            'title' => 'text',
            'summary' => 'text',
            'content' => 'text',
            'view' => 'string DEFAULT \'*\'',
            'edit' => 'string',
            'delete' => 'string',
            'created' => 'datetime',
            'modified' => 'datetime',
            'userId' => 'integer'
                )
        );*/
    }

    public function down() {
            //$this->dropTable($this->db.'_post');
            //$this->dropTable($this->db.'_post_element_file');
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