<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class DashboardController extends _DashboardController
{
    function displayAction() {
        @list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $this->_display($id, false);
        } else {
            $this->pagenotfound();
        }
    }

    function configAction() {
        @list($id) = explode('/', $_REQUEST['args']);

        if (!empty($id)) {
            $this->_display($id, true);
        } else {
            $this->pagenotfound();
        }
    }

    function _display($id, $configurable) {
        // x. Dashboard
        $model = new DashboardModel();
        $model->ID = $id;

        $model->selectAdd();
        $model->selectAdd(TABLE_PREFIX.'DASHBOARD.*');

        if (Framework::hasModule('DashboardLayout')) {
            $model->selectAdd(TABLE_PREFIX.'DASHBOARD_LAYOUT.POSITIONS');

            $model->joinAdd(new DashboardLayoutModel(), 'LEFT');
        }

        $model->find();

        $dashboard = null;
        if ($model->fetch()) {
            $dashboard = clone $model;
        }

        // x. Process custom dashboard
        if (!empty($dashboard->DASHBOARD_FILE_PATH)) {
            $this->_process_custom_dashboard(APPLICATION_DIR.'/'.$dashboard->DASHBOARD_FILE_PATH);

            return;
        }

        if (Framework::hasModule('DashboardLayout')) {
            $positions = explode(',', $dashboard->POSITIONS);
        } else {
            $positions = array();
        }

        // x. Dashboard widgets
        $widgets = array();

        if (Framework::hasModule('DashboardWidget')) {
            $model = new DashboardWidgetModel();
            $model->ID_DASHBOARD = $dashboard->ID;

            $model->selectAdd();
            $model->selectAdd(TABLE_PREFIX.'DASHBOARD_WIDGET.*');
            $model->selectAdd(TABLE_PREFIX.'WIDGET.CLASS');

            $model->joinAdd(new WidgetModel());

            $model->orderBy('POSITION, ORDERING');

            $model->find();

            while ($model->fetch()) {
                $widgets[in_array($model->POSITION, $positions)? $model->POSITION : $positions[0]][] = clone $model;
            }
        }

        // x. Display
		$smarty = self::getSmarty();

        $smarty->assign('module', 'index');
        $smarty->assign('dashboard', $dashboard);
        $smarty->assign('positions', $positions);
        $smarty->assign('widgets', $widgets);

        if ($this->caller == 'ajax') {
		    $content = $smarty->fetch('dashboard.config.tpl');

            if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                $content = substr($content, $beginpos, $endpos - $beginpos);

    		    echo $content;
            } else {
                echo 'An unexpected error has been encountered. Please report this problem to your system administrator.';
            }
        } else {
    		$smarty->display('dashboard.config.tpl');
        }
    }

    function _process_custom_dashboard($filepath) {
        if (!file_exists($filepath)) {
            die('Cannot read dashboard information');
        }

        $filename = basename($filepath);
        if (!preg_match('/^([a-z0-9]+)/i', $filename, $matches)) {
            die('Cannot read dashboard information');
        }

        require_once($filepath);

        $cname = $matches[1];
        if (!class_exists($cname)) {
            die('Cannot read dashboard information');
        }

        $handler = new $cname();
        if (!method_exists($handler, 'indexAction')) {
            die('Cannot read dashboard information');
        }

        $handler->indexAction();
    }

    function updateConfigAction() {
        $widgets = isset($_REQUEST['widgets'])? $_REQUEST['widgets'] : '';

        if (!empty($widgets)) {
            foreach ($widgets as $position => $list) {

                foreach ($list as $ordering => $wdid) {
                    $model = new DashboardWidgetModel();

                    $model->ID = $wdid;
                    $model->POSITION = $position;
                    $model->ORDERING = $ordering;

                    $model->update();
                }
            }
        }
    }
}