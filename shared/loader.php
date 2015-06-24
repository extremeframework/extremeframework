<?php
function is_ssl() {
	if (isset($_SERVER['HTTPS'])) {
		if (strtolower($_SERVER['HTTPS']) == 'on') {
			return true;
		}

		if ($_SERVER['HTTPS'] == '1') {
			return true;
		}
	} elseif (isset($_SERVER['SERVER_PORT']) && ($_SERVER['SERVER_PORT'] == '443')) {
		return true;
	}

	return false;
}

function get_installation_url() {
	$script_dirname = dirname($_SERVER['SCRIPT_NAME']);

    if (preg_match('/\/(admin|front)$/is', $script_dirname)) {
        $installer_path = rtrim(dirname($script_dirname), '/').'/install/';
    } else {
        $installer_path = rtrim($script_dirname, '/').'/install/';
    }

	$schema = is_ssl() ? 'https://' : 'http://';
	$url = $schema . $_SERVER['HTTP_HOST'] . $installer_path;

    return $url;
}

if (!file_exists(dirname(__FILE__).'/app_config.php') || trim(file_get_contents(dirname(__FILE__).'/app_config.php')) == '') {
    header('Location: '.get_installation_url());

    exit(1);
}

if (defined('MAINTENANCE_MODE') && MAINTENANCE_MODE) {
    $start_time = strtotime(MAINTENANCE_START_TIME);
    $end_time = strtotime(MAINTENANCE_END_TIME);

    if (time() >= $start_time && time() <= $end_time) {
        $ip = isset($_SERVER['REMOTE_ADDR'])? $_SERVER['REMOTE_ADDR'] : '';

        if ($ip != MAINTENANCE_IP) {
            die('<html><body><p style="font-size:20px;">This site is down until <strong style="color: #20AA76">'.date("F j, Y, g:i a", $end_time).'</strong> for a <strong style="color: #20AA76">regular maintenance</strong>. We\'re sorry for the inconvenience.</p></body></html><!-- '.$ip.' -->');
        }
    }
}