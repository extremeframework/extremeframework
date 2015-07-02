<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
define('ENFORCE_LICENSE_CHECK', false);
define('LICENSE_SIMPLE_CHECK_URL', '');
define('LICENSE_GET_MACHINE_CODE_URL', '');
define('LICENSE_ONLINE_CREATION_URL', '');

function _t($text, $args = '') {
    global $_L;

    $t = isset($_L[$text])? $_L[$text] : $text;

    if (!empty($args)) {
        $t = sprintf($t, $args);
    }

    return $t;
}

function _e($text, $args = '') {
    echo _t($text, $args);
}

class Installer
{
    function process() {
        global $step;

        $step = isset($_REQUEST['step'])? $_REQUEST['step'] : '';

        $installed = file_exists(dirname(__FILE__).'/../shared/app_config.php') && trim(file_get_contents(dirname(__FILE__).'/../shared/app_config.php')) != '';

        if ($installed && $step != 8) {
            header('Location: '.$this->get_root_url());

            return;
        }

        $lang = isset($_SESSION['language'])? $_SESSION['language'] : 'en-us';
        $lang_file = dirname(__FILE__).'/languages/'.$lang.'.php';

        if (file_exists($lang_file)) {
            include_once($lang_file);
        }

        switch ($step) {
            case 0:
                $this->languageSelectionStep();
                break;

            case 1:
                $this->welcomeStep();
                break;

            case 2:
                $this->systemCheckingStep();
                break;

            case 3:
                $this->databaseSettingsStep();
                break;

            case 4:
                $this->databaseInstallationStep();
                break;

            case 5:
                $this->licenseSettingsStep();
                break;

            case 6:
                $this->userSettingsStep();
                break;

            case 7:
                $this->configurationFileCreationStep();
                break;

            case 8:
                $this->completedStep();
                break;

            default:
                $this->languageSelectionStep();
                break;
        }
    }

    function get_params($params) {
        $settings = array();

        foreach ($params as $name) {
            $settings[$name] = isset($_REQUEST[$name])? $_REQUEST[$name] : (isset($_SESSION[$name])? $_SESSION[$name] : '');
        }

        return $settings;
    }

    function languageSelectionStep() {
        global $step;

        $settings = $this->get_params(array('language'));

        $ok = true;
        $message = '';

        if (!empty($_POST)) {
            if (empty($settings['language'])) {
                $ok = false;
                $message = _t('Please select a language');
            }
        }

        if (!$ok || empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.language-selection.tpl');
        } else {
            $_SESSION['language'] = $settings['language'];

            header('Location: index.php?step=1');
        }
    }

    function welcomeStep() {
        global $step;

        if (empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.welcome.tpl');
        } else {
            header('Location: index.php?step=2');
        }
    }

    function systemCheckingStep() {
        global $step;

        $apache_modules_to_check = array('mod_php5', 'mod_rewrite');
        $php_extensions_to_check = array('curl', 'mcrypt', 'mysql', 'openssl');

        $apache_modules = apache_get_modules();
        $php_extensions = get_loaded_extensions();

        $apache_modules_status = array();
        $php_extensions_status = array();

        foreach ($apache_modules_to_check as $module) {
            $apache_modules_status[$module] = in_array($module, $apache_modules);
        }

        foreach ($php_extensions_to_check as $extension) {
            $php_extensions_status[$extension] = in_array($extension, $php_extensions);
        }

        if (!file_exists(dirname(__FILE__).'/../shared/app_config.php')) {
            @file_put_contents(dirname(__FILE__).'/../shared/app_config.php', '');
        }

        if (!file_exists(dirname(__FILE__).'/../admin/app_config.php')) {
            @file_put_contents(dirname(__FILE__).'/../admin/app_config.php', '');
        }

        if (!file_exists(dirname(__FILE__).'/../front/app_config.php')) {
            @file_put_contents(dirname(__FILE__).'/../front/app_config.php', '');
        }

        @chmod(dirname(__FILE__).'/../shared/app_config.php', 0755);
        @chmod(dirname(__FILE__).'/../admin/app_config.php', 0755);
        @chmod(dirname(__FILE__).'/../front/app_config.php', 0755);

        $is_shared_writable  = is_writable(dirname(__FILE__).'/../shared/app_config.php');
        $is_admin_writable  = is_writable(dirname(__FILE__).'/../admin/app_config.php');
        $is_front_writable  = is_writable(dirname(__FILE__).'/../front/app_config.php');

        $is_constant_writable  = is_writable(dirname(__FILE__).'/../shared/app_constant.php');

        $is_admin_template_pub_writable  = is_writable(dirname(__FILE__).'/../admin/cache');
        $is_front_template_pub_writable  = is_writable(dirname(__FILE__).'/../front/cache');
        $is_upload_dir_writable  = is_writable(dirname(__FILE__).'/../public/uploads');

        $is_all_writable = $is_shared_writable && $is_admin_writable && $is_front_writable && $is_constant_writable && $is_admin_template_pub_writable && $is_front_template_pub_writable && $is_upload_dir_writable;

        $ok = !in_array(false, $apache_modules_status) && !in_array(false, $php_extensions_status) && $is_all_writable;

        if (!$ok || empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.system-checking.tpl');
        } else {
            header('Location: index.php?step=3');
        }
    }

    function databaseSettingsStep() {
        global $step;

        $settings = $this->get_params(array(
            'database_name',
            'database_host',
            'database_username',
            'database_password',
            'table_prefix'
        ));

        $ok = true;
        $message = '';

        if (!empty($_POST)) {
            if (empty($settings['database_name'])) {
                $ok = false;
                $message = _t('Please enter the database name.');
            } else if (empty($settings['database_host'])) {
                $ok = false;
                $message = _t('Please enter the database host.');
            } else if (empty($settings['database_username'])) {
                $ok = false;
                $message = _t('Please enter the database username.');
            } else if (!empty($settings['table_prefix']) && substr($settings['table_prefix'], -1, 1) != '_') {
                $ok = false;
                $message = _t('The table prefix should end with \'_\'.');
            } else {
        		$link = @mysqli_connect($settings['database_host'], $settings['database_username'], $settings['database_password'], $settings['database_name']);

        		if (mysqli_connect_errno()) {
                    $ok = false;
                    $message = mysqli_connect_error();
        		}

        		if ($ok) {
                    // x. Apply database settings
                    $_SESSION['database_name'] = $settings['database_name'];
                    $_SESSION['database_host'] = $settings['database_host'];
                    $_SESSION['database_username'] = $settings['database_username'];
                    $_SESSION['database_password'] = $settings['database_password'];
                    $_SESSION['table_prefix'] = $settings['table_prefix'];
                }
            }
        }

        if (empty($_POST)) {
            if (empty($settings['database_host'])) {
                $settings['database_host'] = 'localhost';
            }

            if (empty($settings['database_username'])) {
                $settings['database_username'] = 'root';
            }
        }

        if (!$ok || empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.database-settings.tpl');
        } else {
            header('Location: index.php?step=4');
        }
    }

    function databaseInstallationStep() {
        global $step;

        if (isset($_POST['button']) && $_POST['button'] == 'skip') {
            header('Location: index.php?step=5');

            return;
        }

        $ok = true;
        $message = '';

        if (!empty($_POST)) {
            $msg = $this->install_database_script();

            if (!empty($msg)) {
                $ok = false;
                $message = $msg;
            }
        }

        if (!$ok || empty($_POST)) {
            $data_exists = $this->table_exists('USER') && $this->table_exists('ACCESS_RIGHT');

            include(dirname(__FILE__).'/templates/step.database-installation.tpl');
        } else {
            header('Location: index.php?step=5');
        }
    }

    function licenseSettingsStep() {
        if (!ENFORCE_LICENSE_CHECK) {
            header('Location: index.php?step=6');

            return;
        }

        global $step;

        $settings = $this->get_params(array(
            'license_key'
        ));

        $root_url = self::get_root_url();
        $domain_name = self::get_domain_name($root_url);
        $machine_code = self::get_machine_code($domain_name);

        $ok = true;
        $message = '';

        if (!empty($_POST)) {
            if (empty($settings['license_key'])) {
                $ok = false;
                $message = _t('Please enter a license key.');
            } else {
                // x. Check with the server
                require_once(dirname(__FILE__).'/../library/internal/pCURL.php');

                $data = $settings['license_key'].'|'.$root_url;

                $encrypted_response = pCURL::download(LICENSE_SIMPLE_CHECK_URL, "k=".base64_encode($data));

                $response = base64_decode($encrypted_response);

                if ($response != 'OK') {
                    $ok = false;

                    if (!empty($response)) {
                        $message = $response;
                    } else {
                        $message = 'An unexpected error occurs during license validation. Please try again later.';
                    }
                }
            }
        }

        if (!$ok || empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.license-settings.tpl');
        } else {
            $_SESSION['license_key'] = $settings['license_key'];

            header('Location: index.php?step=6');
        }
    }

    function userSettingsStep() {
        global $step;

        $settings = $this->get_params(array(
            'admin_username',
            'admin_password',
            'admin_password2'
        ));

        $ok = true;
        $message = '';

        if (!empty($_POST)) {
            if (empty($settings['admin_username'])) {
                $ok = false;
                $message = _t('Please enter an admin username.');
            } else if (empty($settings['admin_password'])) {
                $ok = false;
                $message = _t('Please enter an admin password.');
            } else if ($settings['admin_password'] != $settings['admin_password2']) {
                $ok = false;
                $message = _t('Re-typed password mismatch.');
            } else {
                $_SESSION['admin_username'] = $settings['admin_username'];
                $_SESSION['admin_password'] = $settings['admin_password'];
                $_SESSION['admin_password2'] = $settings['admin_password2'];

                // x. Update admin user
                $msg = $this->update_admin_user($settings['admin_username'], $settings['admin_password']);

                if (!empty($msg)) {
                    $ok = false;
                    $message = $msg;
                }
            }
        }

        if (empty($_POST)) {
            if (empty($settings['admin_username'])) {
                $settings['admin_username'] = 'admin';
            }
        }

        if (!$ok || empty($_POST)) {
            include(dirname(__FILE__).'/templates/step.user-settings.tpl');
        } else {
            header('Location: index.php?step=7');
        }
    }

    function configurationFileCreationStep() {
        global $step;

        $ok = true;
        $message = '';

        $msg = $this->create_configuration_files();

        if (!empty($msg)) {
            $ok = false;
            $message = $msg;
        }

        if (!$ok) {
            include(dirname(__FILE__).'/templates/step.configuration-files-creation.tpl');
        } else {
            header('Location: index.php?step=8');
        }
    }

    function completedStep() {
        global $step;

        $language = isset($_SESSION['language'])? $_SESSION['language'] : 'en-us';

        // Clean up
        session_destroy();
        session_start();

        $_SESSION['language'] = $language;

        $root_url = $this->get_root_url();

        include(dirname(__FILE__).'/templates/step.completed.tpl');
    }

    function db_connect(&$error) {
        $error = null;

        static $mysqli = null;

        if ($mysqli == null) {
            $mysqli = new mysqli($_SESSION['database_host'], $_SESSION['database_username'], $_SESSION['database_password'], $_SESSION['database_name']);

            if ($mysqli->connect_errno) {
                $error = $mysqli->connect_error;
            }
        }

        return $mysqli;
    }

    function update_admin_user($username, $password) {
        $table_prefix = isset($_SESSION['table_prefix'])? $_SESSION['table_prefix'] : '';

        $mysqli = $this->db_connect($error);

        if (!empty($error)) {
            return $error;
        }

		$result = $mysqli->query("UPDATE {$table_prefix}USER SET LOGIN = '$username', PASSWORD = '".md5($password)."' WHERE ID = 1");

		if (!$result) {
		    return $mysqli->error;
        }
    }

    function table_exists($tablename) {
        $table_prefix = isset($_SESSION['table_prefix'])? $_SESSION['table_prefix'] : '';

        $mysqli = $this->db_connect($error);

        if (!empty($error)) {
            return false;
        }

	    $result = $mysqli->query("SHOW TABLES LIKE '".$table_prefix.$tablename."'");

        if (!empty($error)) {
            return false;
        }

	    return $result->num_rows == 1;
    }

    function create_configuration_files() {
        $root_dir = realpath(dirname(__FILE__).'/../');
        $root_url = $this->get_root_url();

        // x. Shared
        $filepath = dirname(__FILE__).'/app_config.shared.php';

        $content = file_get_contents($filepath);

        $content = str_replace('{APPLICATION_NAME}', uniqid(), $content);
        $content = str_replace('{DATABASE_NAME}', $_SESSION['database_name'], $content);
        $content = str_replace('{DATABASE_HOST}', $_SESSION['database_host'], $content);
        $content = str_replace('{DATABASE_USERNAME}', $_SESSION['database_username'], $content);
        $content = str_replace('{DATABASE_PASSWORD}', $_SESSION['database_password'], $content);
        $content = str_replace('{TABLE_PREFIX}', $_SESSION['table_prefix'], $content);
        $content = str_replace('{LICENSE_KEY}', ENFORCE_LICENSE_CHECK? $_SESSION['license_key'] : '', $content);
        $content = str_replace('{LIBRARY_DIR}', $this->realpath($root_dir.'/library'), $content);
        $content = str_replace('{UPLOAD_DIR}', $this->realpath($root_dir.'/public/uploads'), $content);
        $content = str_replace('{UPLOAD_URL}', $root_url.'/uploads', $content);

        file_put_contents(dirname(__FILE__).'/../shared/app_config.php', $content);

        // x. Admin
        $filepath = dirname(__FILE__).'/app_config.admin.php';

        $content = file_get_contents($filepath);

        $content = str_replace('{APPLICATION_NAME}', uniqid(), $content);
        $content = str_replace('{APPLICATION_URL}', $root_url.'/admin', $content);
        $content = str_replace('{THEME_URL}', $root_url.'/admin', $content);

        file_put_contents(dirname(__FILE__).'/../admin/app_config.php', $content);

        // x. Front
        $filepath = dirname(__FILE__).'/app_config.front.php';

        $content = file_get_contents($filepath);

        $content = str_replace('{APPLICATION_NAME}', uniqid(), $content);
        $content = str_replace('{APPLICATION_URL}', $root_url, $content);

        $theme_name = $this->get_default_theme_name(dirname(__FILE__).'/../front');
        $content = str_replace('{THEME_NAME}', $theme_name, $content);

        file_put_contents(dirname(__FILE__).'/../front/app_config.php', $content);

        // x. Blog
        $filepath = dirname(__FILE__).'/app_config.blog.php';

        $content = file_get_contents($filepath);

        $content = str_replace('{APPLICATION_NAME}', uniqid(), $content);
        $content = str_replace('{APPLICATION_URL}', $root_url, $content);

        $theme_name = $this->get_default_theme_name(dirname(__FILE__).'/../blog');
        $content = str_replace('{THEME_NAME}', $theme_name, $content);

        file_put_contents(dirname(__FILE__).'/../blog/app_config.php', $content);
    }

    function install_database_script() {
		$filepath = dirname(__FILE__).'/database.sql';

		if (!file_exists($filepath)) {
		    return "Database script not found: $filepath";
		}

        $mysqli = $this->db_connect($error);

		if (!empty($error)) {
		    return $error;
		}

        // x. Import database
        set_time_limit(0);

        $templine = '';
        $lines = file($filepath);

        foreach ($lines as $line) {
            // Skip comment lines
            if (substr($line, 0, 2) == '--' || $line == '') {
                continue;
            }

            // Add this line to the current segment
            $templine .= $line;

            // If it has a semicolon at the end, it's the end of the query
            if (substr(trim($line), -1, 1) == ';') {
                // Perform the query
                $result = $mysqli->query($this->sql_ensure_table_prefix($templine));

                if (!$result) {
                    return $mysqli->error;
                }

                // Reset temp variable to empty
                $templine = '';
            }
        }
    }

    function sql_ensure_table_prefix($query) {
        $table_prefix = isset($_SESSION['table_prefix'])? $_SESSION['table_prefix'] : '';

        if (!empty($table_prefix)) {
            $query = str_ireplace('NOT EXISTS `', 'NOT EXISTS `'.$table_prefix, $query);
            $query = str_ireplace('CREATE TABLE `', 'CREATE TABLE `'.$table_prefix, $query);
            $query = str_ireplace('ALTER TABLE `', 'ALTER TABLE `'.$table_prefix, $query);
            $query = str_ireplace('INTO `', 'INTO `'.$table_prefix, $query);
        }

        return $query;
    }

    function realpath($path) {
        $path = realpath($path);
        $path = str_replace('\\', '/', $path);

        return $path;
    }

    function get_root_url() {
    	$script_dirname = dirname($_SERVER['SCRIPT_NAME']);

        $root_path = dirname($script_dirname);

    	$url = $_SERVER['HTTP_HOST'] . $root_path;

    	$url = '//'. trim($url, '/');

        return $url;
    }

	function get_domain_name($url) {
		$p = parse_url($url);

		if (isset($p['host'])) {
			return $p['host'];
		}

		return false;
	}

    function get_machine_code($domain_name) {
        require_once(dirname(__FILE__).'/../library/internal/pCURL.php');

        return pCURL::download(LICENSE_GET_MACHINE_CODE_URL, "k=".base64_encode($domain_name));
    }

    function is_valid_domain_name($domain_name) {
        return (preg_match("/^([a-z\d](-*[a-z\d])*)(\.([a-z\d](-*[a-z\d])*))*$/i", $domain_name) //valid chars check
                && preg_match("/^.{1,253}$/", $domain_name) //overall length check
                && preg_match("/^[^\.]{1,63}(\.[^\.]{1,63})*$/", $domain_name)   ); //length of each label
    }

    function get_default_theme_name($application_dir) {
        $themes_dir = realpath($application_dir.'/themes');

        $dirs = array_filter(glob($themes_dir.'/*'), 'is_dir');

        if (empty($dirs)) {
            return 'default';
        }

        return basename(array_shift($dirs));
    }
}

session_start();

$installer = new Installer();
$installer->process();