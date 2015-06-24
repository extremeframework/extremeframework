<?php
require_once('function.label.php');

function smarty_function_menu($params, &$smarty) {
	$menus = $params['menus'];
	$parent = $params['parent'];
	$depth = $params['depth'];

    $html = '';

    if (isset($menus[$depth][$parent])) {
        $html .= '<ul'.($depth == 0? ' class="sf-menu"' : '').'>';

        foreach ($menus[$depth][$parent] as $menuitem) {
            $msgid = 'L_MNU_'.strtoupper(str_replace(' ', '_', $menuitem->NAME));
            $acl = isset($_SESSION['acl'][$menuitem->MODULE]);

        	if ($acl) {
    	        $html .= '<li class="menu-'.$menuitem->MODULE.($menuitem->MODULE == $module || $menuitem->ID == $parentmenu? ' current' : '').'">';
    	        $html .= '<a class="menulink menulink-'.$menuitem->MODULE.'" href="'.APPLICATION_URL.'/'.$menuitem->MODULE.'">'.smarty_function_label(array('key' => $msgid), $smarty).'</a>';
    	        $html .= smarty_function_menu(array('menus' => $menus, 'parent' => $menuitem->ID, 'depth' => $depth+1), $smarty);
    	        $html .= '</li>';
            }
        }

        $html .= '</ul>';
    }

    return $html;
}