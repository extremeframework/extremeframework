<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminLayoutController
{
    function configAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

		@list($module) = explode('/', $_REQUEST['args']);

        // x. Ensure config file
        $file = realpath(APPLICATION_DIR.'/../resource').'/layout.config.serialized';

        if (!file_exists($file)) {
            file_put_contents($file, serialize(array()));
        }

        // x. Load current config
        $config = unserialize(file_get_contents($file));

        $config_settings = isset($config[$module])? $config[$module] : array();

        // x. Get layout items
        global $app_router;

        $settings = array();

    	$controllerName = $app_router[$module].'Controller';
    	$controller = new $controllerName();

        $columns = $controller->getLayoutColumns();

        foreach ($columns as $column) {
            $settings[$column] = isset($config_settings[$column])? $config_settings[$column] : array('x' => 0, 'y' => 0);
        }

        // x. Display
		$smarty = Framework::getSmarty();

		$smarty->assign('module', $module);
		$smarty->assign('settings', $settings);

	    $smarty->display('config.adminlayout.tpl');
    }

    function updateAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('user');

		@list($module) = explode('/', $_REQUEST['args']);

        // x. Get JSON POST data
        $request_body = file_get_contents('php://input');
        $data = json_decode($request_body);

        // x. Get layout data
        $settings = array();

        foreach ($data as $obj) {
            $column = $obj->id;
            $x = $obj->x;
            $y = $obj->y;

            $settings[$column] = array('x' => $x, 'y' => $y);
        }

        // x. Ensure config file
        $file = realpath(APPLICATION_DIR.'/../resource').'/layout.config.serialized';

        if (!file_exists($file)) {
            file_put_contents($file, serialize(array()));
        }

        // x. Load current config
        $config = unserialize(file_get_contents($file));

        // x. Update config
        $config[$module] = $settings;

        // x. Re-serialize config
        file_put_contents($file, serialize($config));

        // x. Update layout config file
        $this->updateLayoutConfigFile($module, $settings);
    }

    function updateLayoutConfigFile($module, $settings) {
        // x. Build layout config string
        $rows = array();

        foreach ($settings as $column => $position) {
            $x = $position['x'];
            $y = $position['y'];

            $rows[$y][$x] = $column;
        }

        ksort($rows);

        $pieces = array();
        foreach ($rows as $y => $columns) {
            ksort($columns);

            $pieces[] = implode(',', $columns);
        }

        $rowstring = implode(';', $pieces);

        // x. New code string
        $codestring = "\$GLOBAL_LAYOUT_SETTINGS['{$module}'] = array(\n";
        $codestring .= "    '<blockcode1>' => 'rows|{$rowstring}'\n";
        $codestring .= ");";

        // x. Ensure layout code file
        $file = realpath(APPLICATION_DIR.'/../resource').'/layout.config.php';

        if (!file_exists($file)) {
            $s = "<?php\n";

            $s .= "global \$GLOBAL_LAYOUT_SETTINGS;\n\n";

            $s .= "\$GLOBAL_LAYOUT_SETTINGS = array();";

            file_put_contents($file, $s);
        }

        // x. Read file content
        $s = file_get_contents($file);

        // x. Check if existing code string
        $exists = stripos($s, "\$GLOBAL_LAYOUT_SETTINGS['{$module}']") !== false;

        // x. Replace (or append) new code string in the current layout code file
        if (!$exists) {
            $s .= "\n\n$codestring";
        } else {
            $s = preg_replace('/\$GLOBAL_LAYOUT_SETTINGS\[\''.$module.'\'\].*\);/isU', $codestring, $s);
        }

        // x. Write file content
        file_put_contents($file, $s);
    }
}
