<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class OpcacheController extends __AppController
{
    function indexAction() {
        AuthenticationController::authenticate();

		list($operation) = explode('/', $_REQUEST['args']);

        echo '<pre>';

        echo '<a href="'.APPLICATION_URL.'/opcache/config">View config</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/status">Check status</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear">Clear cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-apc">Clear APC cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-memcache">Clear Memcache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-html-cache">Clear HTML cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-template-cache">Clear template cache</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/clear-data-cache">Clear data cache</a> &nbsp; ';

        echo '<br/> <br/><a href="'.APPLICATION_URL.'/opcache/test-apc">Test APC</a> &nbsp; ';
        echo '<a href="'.APPLICATION_URL.'/opcache/test-memcache">Test Memcache</a> &nbsp; ';

        echo '<br/> <form action="'.APPLICATION_URL.'/opcache/checkdb" method="POST" enctype="multipart/form-data">';
        echo 'Database script: <input type="file" name="dbfile"/>';
        echo '<input type="submit" value="Check"/>';
        echo '</form>';

        echo '</pre>';

        if ($operation == 'config') {
            echo "<pre>";print_r(opcache_get_configuration());echo "</pre>";
        }

        if ($operation == 'status') {
            echo "<pre>";print_r(opcache_get_status());echo "</pre>";
        }

        if ($operation == 'reset') {
            $ok = opcache_reset();

            if ($ok) {
                echo 'Cache cleared';
            }
        }

        if ($operation == 'clear-apc') {
            Cache::getHandler('apc')->clear();

            echo 'APC cache cleared';
        }

        if ($operation == 'clear-memcache') {
            Cache::getHandler('memcache')->clear();

            echo 'Memcache cleared';
        }

        if ($operation == 'clear-html-cache') {
            $dirs  = glob(CACHE_DIR.'/html/*', GLOB_ONLYDIR);

            foreach ($dirs as $dir) {
                array_map('unlink', glob($dir.'/*'));
            }

            echo 'HTML cache cleared';
        }

        if ($operation == 'clear-template-cache') {
            array_map('unlink', glob(CACHE_DIR.'/templates/*'));

            echo 'Template cache cleared';
        }

        if ($operation == 'clear-data-cache') {
            array_map('unlink', glob(CACHE_DIR.'/data/*'));

            echo 'Data cache cleared';
        }

        if ($operation == 'test-apc') {
			Cache::apc()->set('test-apc', 'hello');

			$ok = Cache::apc()->get('test-apc') == 'hello';

            if ($ok) {
                echo 'APC cache working';
            }
        }

        if ($operation == 'test-memcache') {
			Cache::memcache()->set('test-memcache', 'hello2');

			$ok = Cache::memcache()->get('test-memcache') == 'hello2';

            if ($ok) {
                echo 'Memcache working';
            }
        }

        if ($operation == 'checkdb') {
            $dbfile = $_FILES['dbfile']['tmp_name'];

            $ok = $this->check_against_script_file($dbfile);

            if ($ok) {
                echo 'DB checking done';
            }
        }

        if ($operation == 'patchdb') {
            $patches = isset($_SESSION['db.patches'])? $_SESSION['db.patches'] : array();

            if (!empty($patches)) {
                $ok = $this->apply_database_patch($patches);

                if ($ok) {
                    echo 'Patch done';
                }
            } else {
                echo 'No patch to apply';
            }
        }
    }

    function check_against_script_file($file) {
        $content = file_get_contents($file);

        // x. Parse for table structure scripts
        $this->parse_table_structs($content);
    }

    function parse_table_structs($content) {
        $logs = array();

        if (preg_match_all("/CREATE TABLE[^\(`]*`([^`]+)`[^\(]*\(([^;]+)\)[^;]+;/is", $content, $matches, PREG_SET_ORDER )) {
            foreach ($matches as $match) {
                $tablescript = $match[0];
                $table = $match[1];
                $columnscript = $match[2];

                $datascript = $this->parse_table_data_script($content, $table);

                $this->check_against_struct($table, $tablescript, $columnscript, $datascript, $logs);
            }
        }

        $_SESSION['db.patches'] = $logs;

        echo "<pre>";

        if (!empty($logs)) {
            echo implode(";\n", $logs).";";
            echo '<br/> <br/><a href="'.APPLICATION_URL.'/opcache/patchdb"><input type="button" value="Patch now"></a>';
        } else {
            echo "Checking done. Nothing to patch";
        }

        echo "</pre>";
    }

    function parse_table_data_script($content, $table) {
        if (preg_match_all("/INSERT.*INTO\s+`[^`]*$table`.*\);[\n|\r]+/i", $content, $matches)) {
            $datascript = $matches[0];

            foreach ($datascript as $k => $v) {
                $datascript[$k] = trim($v);
            }
        } else {
            $datascript = array();
        }

        return $datascript;
    }

    function apply_database_patch($patches) {
        foreach ($patches as $patch) {
            $model = new DB_DataObject();

    	    $model->query($patch);
        }

        return true;
    }

    function check_against_struct($rawname, $tablescript, $columnscript, $datascript, &$logs) {
        // x. Check if table exists
        $table_exists = $this->table_exists($rawname);

        // x. Run table script if table doesn't exists
        if (!$table_exists) {
            $logs[] = $tablescript;

            if (!empty($datascript)) {
                $logs = array_merge($logs, $datascript);
            }
        } else {
            // x. Alter table structure if needed
            $this->alter_table($rawname, $columnscript, $logs);
        }
    }

    function table_exists($rawname) {
        $model = new DB_DataObject();

	    $sql = "SHOW TABLES LIKE '$rawname'";

	    $model->query($sql);

	    return $model->N == 1;
    }

	function get_table_indexes($rawname) {
	    $model = new DB_DataObject();

	    $sql = "SHOW INDEX FROM `$rawname`";

	    $model->query($sql);

	    $model->fetch();

        $indexes = array();
        while ($model->fetch()) {
            if (isset($indexes[$model->Key_name])) {
                $indexes[$model->Key_name] .= ','.'`'.$model->Column_name.'`';
            } else {
                $indexes[$model->Key_name] = '`'.$model->Column_name.'`';
            }
        }

        return $indexes;
    }

	function get_table_columns($rawname) {
	    $model = new DB_DataObject();

	    $sql = "SHOW COLUMNS FROM `$rawname`";

	    $model->query($sql);

	    $model->fetch();

        $columns = array();
        while ($model->fetch()) {
            $columns[$model->Field] = $model->Type;
        }

        // Workaround for a strange bug not seeing the ID field
        $columns['ID'] = 'int(11)';

        return $columns;
    }

    function alter_table($rawname, $columnscript, &$logs) {
        $columnscript_noindex = $columnscript;

        if (($pos = stripos($columnscript_noindex, 'PRIMARY KEY')) > 0) {
            $columnscript_noindex = substr($columnscript_noindex, 0, $pos);
            $columnscript_noindex = trim($columnscript_noindex, " \t\n\r\0\x0B,");
        }

        // x. Parse columns in the column script
        if (!preg_match_all('/([^\n\r]+),[\n\r]+/is', $columnscript_noindex.",\n", $matches)) {
            die("[ERROR::alter_table] Column definition not found for $rawname");
        }

        $columndefs = $matches[1];

        // x. Parse indexes in the column script
        if (!preg_match_all('/KEY `([^`]+)`\s*\(([^\(]+)\)/is', $columnscript.",\n", $matches, PREG_SET_ORDER)) {
            die("[ERROR::alter_table] Column definition not found for $rawname");
        }

        $indexdefs = array();

        foreach ($matches as $match) {
            $name = $match[1];
            $cols = $match[2];

            $indexdefs[$name] = $cols;
        }

        $tablecolumns = $this->get_table_columns($rawname);
        $tableindexes = $this->get_table_indexes($rawname);

        $prevcolumn = '';
        $script_columns = array();

        foreach ($columndefs as $definition) {
            $definition = trim($definition);

            preg_match('/^([^ ]+)\s([^ ]+)/is', $definition, $match);
            $column = trim($match[1], '`');
            $type = $match[2];

            $script_columns[] = $column;
            $column_exists = isset($tablecolumns[$column]);

            if (!$column_exists) {
                $logs[] = "ALTER TABLE `$rawname` ADD COLUMN $definition".(!empty($prevcolumn)? " AFTER `$prevcolumn`" : '');
            } else {
                if ($type != $tablecolumns[$column]) {
                    $logs[] = "ALTER TABLE `$rawname` CHANGE COLUMN $definition";
                }
            }

            $prevcolumn = $column;
        }

        foreach ($tablecolumns as $column => $type) {
            if (!in_array($column, $script_columns) && !in_array($column, array('REFID', 'GUID', 'UDID', 'WFID', 'UUID', 'JSON'))) {
                if (preg_match('/^json_/is', $column)) {
                    $logs[] = "DROP COLUMN `$column`";
                } else {
                    $logs[] = "Column not found in script <-- $column";
                }
            }
        }

        foreach ($indexdefs as $name => $columns) {
            $index_exists = isset($tableindexes[$name]);

            if (!$index_exists) {
                $logs[] = "ALTER TABLE `$rawname` ADD INDEX `$name` ($columns)";
            } else {
                if ($columns != $tableindexes[$name]) {
                    $logs[] = "ALTER TABLE `$rawname` DROP INDEX `$name`, ADD INDEX `$name` ($columns)";
                }
            }
        }
    }
}