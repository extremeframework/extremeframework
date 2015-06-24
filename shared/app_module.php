<?php
global $app_module;
global $app_module_reverse;

$app_module = array(
    'accessright' => 23,
    'acltype' => 5,
    'adminfilter' => 20,
    'adminlabel' => 19,
    'adminlanguage' => 27,
    'adminlanguageitem' => 35,
    'adminlayoutfield' => 33,
    'adminlayoutsection' => 37,
    'adminmenu' => 12,
    'adminmenuitem' => 32,
    'adminmodule' => 24,
    'adminsequence' => 28,
    'adminview' => 17,
    'changelog' => 16,
    'dashboard' => 10,
    'field' => 2,
    'fieldacl' => 11,
    'objectacl' => 14,
    'option' => 4,
    'parameter' => 8,
    'parametergroup' => 30,
    'parametertype' => 26,
    'recyclebin' => 18,
    'screen' => 3,
    'screenfield' => 21,
    'user' => 1,
    'usergroup' => 13,
    'userlog' => 7,
    'usermembership' => 31,
    'userpreference' => 29,
    'userrole' => 9,
    'valuetype' => 15,
    'workflow' => 6,
    'workflowapplication' => 36,
    'workflowlog' => 22,
    'workflowstage' => 25,
    'workflowtransition' => 34
);

$app_module_reverse = array_flip($app_module);

function get_module_id($module) {
    global $app_module;

    $id = isset($app_module[$module])? $app_module[$module] : 0;

    return str_pad($id, 3, '0', STR_PAD_LEFT);
}

function get_module($id) {
    global $app_module_reverse;

    $module = isset($app_module_reverse[$id])? $app_module_reverse[$id] : '';

    return $module;
}