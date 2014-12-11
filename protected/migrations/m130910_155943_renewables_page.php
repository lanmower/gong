<?php

class m130910_155943_renewables_page extends CDbMigration {
    public $db = 'ipp_renewables';
    public $widgets = array();
    public $elementWidgetIds = array();
    public function up() {
        $this->createTable($this->db.'_page_element', array(
            'id' => 'pk',
            'mode' => 'integer',
            'className' => 'string',
            'name' => 'string',
            'title' => 'text',
            'prefixContent' => 'text',
            'suffixContent' => 'text',
            'fields' => 'text',
            'view' => 'string DEFAULT \'*\'',
            'edit' => 'string',
            'delete' => 'string',
            'created' => 'datetime',
            'modified' => 'datetime',
            'weight' => 'integer',
            'pageId' => 'integer',
            'userId' => 'integer',
                )
        );
        $this->createTable($this->db.'_page_element_file', array(
            'id' => 'pk',
            'view' => 'string DEFAULT \'*\'',
            'edit' => 'string',
            'delete' => 'string',
            'filename' => 'text',
            'description' => 'text',
            'created' => 'datetime',
            'modified' => 'datetime',
            'weight' => 'integer',
            'pageElementId' => 'integer',
            'userId' => 'integer',
                )
        );
        $this->createTable($this->db.'_page', array(
            'id' => 'pk',
            'name' => 'string',
            'title' => 'text',
            'view' => 'string DEFAULT \'*\'',
            'edit' => 'string',
            'delete' => 'string',
            'created' => 'datetime',
            'modified' => 'datetime',
            'weight' => 'integer',
                )
        );
        $rows = $this->getDbConnection()->createCommand("select * from {$this->db}_widget where parentId = 0")->queryAll();
        $i = 0;
        foreach ($rows as $row) {
            $this->insert($this->db.'_page', array('name' => $row['name'],
                'title' => $row['title'],
                'view' => $row['view'],
                'edit' => $row['edit'],
                'delete' => $row['delete'],
                'created' => $row['created'],
                'modified' => $row['modified'],
                'weight' => $row['weight'],
            ));
            $children = $this->getDbConnection()->createCommand("select * from {$this->db}_widget where parentId = " . $row['id'])->queryAll();
            $params = array('pageId'=>++$i, 'weight'=>0);
            foreach ($children as $child) {
                $params['weight']++;
                $this->recurseWidget($child, $params);
            }
        }
    }

    public function recurseWidget($parent, &$params) {
        $this->elementWidgetIds[] = $parent['id'];
        
        $files = $this->getDbConnection()->createCommand("select * from {$this->db}_file where parentId = " . $parent['id'])->queryAll();
        foreach ($files as $row) {
            $this->insert($this->db.'_page_element_file', array(
                'view' => $row['view'],
                'edit' => "",
                'delete' => "",
                'filename' => $row['filename'],
                'description' => $row['description'],
                'created' => $row['created'],
                'modified' => $row['modified'],
                'weight' => $row['weight']++,
                'pageElementId' => sizeof($this->elementWidgetIds)+1,
                'userId' => $row['userId'],
            ));
            
        }

        $rows = $this->getDbConnection()->createCommand("select * from {$this->db}_widget where parentId = " . $parent['id'])->queryAll();
        $mode = sizeof($rows) == 0 ? 1 : 2;
        $this->insert($this->db.'_page_element', array(
            'mode' => $mode,
            'className' => $parent['className'],
            'name' => $parent['name'],
            'title' => $parent['title'],
            'prefixContent' => $parent['content'],
            'fields' => CJSON::encode(unserialize($parent['fields'])),
            'view' => $parent['view'],
            'edit' => $parent['edit'],
            'delete' => $parent['delete'],
            'created' => $parent['created'],
            'modified' => $parent['modified'],
            'weight' => $params['weight']++,
            'pageId' => $params['pageId'],
        ));
        
        foreach ($rows as $row) {
            $this->recurseWidget($row, $params);
        }
        if ($mode == 2)
            $this->insert($this->db.'_page_element', array(
                'mode' => 3,
                'className' => null,
                'name' => null,
                'title' => null,
                'prefixContent' => null,
                'fields' => null,
                'view' => null,
                'edit' => null,
                'delete' => null,
                'created' => $parent['created'],
                'modified' => $parent['modified'],
                'weight' => $params['weight']++,
                'pageId' => $params['pageId'],
            ));
        $this->elementWidgetIds[] = $parent['id'];

            $this->insert($this->db.'_page_element', array('className'=>'GFontAwesome', 'mode'=>1, 'pageId'=>2));
        }

    public function down() {
        try {
            $this->dropTable($this->db.'_page_element');
            $this->dropTable($this->db.'_page');
            $this->dropTable($this->db.'_page_element_file');
        } catch (CDbException $e) {
            
        }
    }

}