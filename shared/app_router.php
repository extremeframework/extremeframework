<?php
global $app_router;

$app_router = array(
    'accessright' => 'AccessRight',
    'accessrights' => 'AccessRight',
    'acltype' => 'AclType',
    'acltypes' => 'AclType',
    'adminfilter' => 'AdminFilter',
    'adminfilters' => 'AdminFilter',
    'adminlabel' => 'AdminLabel',
    'adminlabels' => 'AdminLabel',
    'adminlanguage' => 'AdminLanguage',
    'adminlanguages' => 'AdminLanguage',
    'adminlanguageitem' => 'AdminLanguageItem',
    'adminlanguageitems' => 'AdminLanguageItem',
    'adminlayoutfield' => 'AdminLayoutField',
    'adminlayoutfields' => 'AdminLayoutField',
    'adminlayoutsection' => 'AdminLayoutSection',
    'adminlayoutsections' => 'AdminLayoutSection',
    'adminmenu' => 'AdminMenu',
    'adminmenus' => 'AdminMenu',
    'adminmenuitem' => 'AdminMenuItem',
    'adminmenuitems' => 'AdminMenuItem',
    'adminmodule' => 'AdminModule',
    'adminmodules' => 'AdminModule',
    'adminsequence' => 'AdminSequence',
    'adminsequences' => 'AdminSequence',
    'adminview' => 'AdminView',
    'adminviews' => 'AdminView',
    'changelog' => 'ChangeLog',
    'changelogs' => 'ChangeLog',
    'dashboard' => 'Dashboard',
    'dashboards' => 'Dashboard',
    'field' => 'Field',
    'fields' => 'Field',
    'fieldacl' => 'FieldAcl',
    'fieldacls' => 'FieldAcl',
    'objectacl' => 'ObjectAcl',
    'objectacls' => 'ObjectAcl',
    'option' => 'Option',
    'options' => 'Option',
    'parameter' => 'Parameter',
    'parameters' => 'Parameter',
    'parametergroup' => 'ParameterGroup',
    'parametergroups' => 'ParameterGroup',
    'parametertype' => 'ParameterType',
    'parametertypes' => 'ParameterType',
    'recyclebin' => 'RecycleBin',
    'recyclebins' => 'RecycleBin',
    'screen' => 'Screen',
    'screens' => 'Screen',
    'screenfield' => 'ScreenField',
    'screenfields' => 'ScreenField',
    'user' => 'User',
    'users' => 'User',
    'usergroup' => 'UserGroup',
    'usergroups' => 'UserGroup',
    'userlog' => 'UserLog',
    'userlogs' => 'UserLog',
    'usermembership' => 'UserMembership',
    'usermemberships' => 'UserMembership',
    'userpreference' => 'UserPreference',
    'userpreferences' => 'UserPreference',
    'userrole' => 'UserRole',
    'userroles' => 'UserRole',
    'valuetype' => 'ValueType',
    'valuetypes' => 'ValueType',
    'workflow' => 'Workflow',
    'workflows' => 'Workflow',
    'workflowapplication' => 'WorkflowApplication',
    'workflowapplications' => 'WorkflowApplication',
    'workflowlog' => 'WorkflowLog',
    'workflowlogs' => 'WorkflowLog',
    'workflowstage' => 'WorkflowStage',
    'workflowstages' => 'WorkflowStage',
    'workflowtransition' => 'WorkflowTransition',
    'workflowtransitions' => 'WorkflowTransition'
);

// x. Put rewrite codes here
// $_SESSION['codes']['view_category'] = 'vc';
// $_SESSION['paths']['view_category'] = 'contentcategory/view';

function findpath($code) {
    $codes = isset($_SESSION['codes'])? $_SESSION['codes'] : array();
    $paths = isset($_SESSION['paths'])? $_SESSION['paths'] : array();

    foreach ($codes as $key => $value) {
        if ($value == $code) {
            return $paths[$key];
        }
    }

    return null;
}

function rewritepath($p) {
    if (preg_match('/(.*)-([a-z0-9]+)/is', $p, $matches)) {
        $code = $matches[2];

        if ($path = findpath($code)) {
            $p = $path.'/'.$matches[1];
        }
    }

    return $p;
}

$_REQUEST['p'] = rewritepath($_REQUEST['p']);