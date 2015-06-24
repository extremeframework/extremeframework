<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminShortcutController extends _AdminShortcutController
{
    function executeAction() {
        $op = isset($_REQUEST['op'])? $_REQUEST['op'] : '';

        // x. If empty, return to the current screen
        if (empty($op)) {
            ContextStack::back(0);
        }

        // x. All shortcuts
        $shortcuts = $this->loadShortcuts();

        // x. Find matching shortcut
        foreach ($shortcuts as $regex => $path) {
            if ($this->matchShortcut($op, $regex, $path)) {
                application_route($path);

                break;
            }
        }
    }

    function matchShortcut($p, $regex, &$path) {
        if (preg_match('/^'.trim($regex).'$/is', trim($p), $match)) {
            $count = count($match);

            for ($i = 1; $i < $count; $i++) {
                $path = str_replace("%$i", $match[$i], $path);
            }

            return true;
        }

        return false;
    }

    function loadShortCuts() {
        if (!isset($_SESSION['system.shortcuts'])) {
            $shortcuts = array();

            $items = $this->getList();

            foreach ($items as $item) {
                $shortcuts[$item->SHORTCUT_REGEX] = !preg_match('/(http|https)\:\/\//i', $item->SHORTCUT_PATH)?  APPLICATION_URL.'/'.$item->SHORTCUT_PATH : $item->SHORTCUT_PATH;
            }

            $_SESSION['system.shortcuts'] = $shortcuts;
        }

        return $_SESSION['system.shortcuts'];
    }
}