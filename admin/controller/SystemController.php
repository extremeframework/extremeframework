<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SystemController extends __AppController
{
    var $module = 'system';

    public function settingsAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('parameter');

        AclController::checkPermission('parameter', 'edit');

		ContextStack::register(APPLICATION_URL.'/system/settings/');

        // x. Get grouped parameters
        $groups = $this->getGroupedParameters();

        // x. Render
		$smarty = Framework::getSmarty(__FILE__);

		$smarty->assign('groups', $groups);

	    $this->display($smarty, 'system.settings.tpl');
    }

    private function getGroupedParameters() {
        $model = new ParameterModel();

        $model->selectAdd();
        $model->selectAdd("PARAMETER.NAME, PARAMETER.CODE, PARAMETER.VALUE, PARAMETER.DESCRIPTION");
        $model->selectAdd("PARAMETER_GROUP.NAME AS GROUP_NAME");
        $model->selectAdd("PARAMETER_TYPE.BASE_TYPE_CODE AS TYPE, PARAMETER_TYPE.EXTRA AS OPTIONS");

        $model->joinAdd(new ParameterGroupModel(), 'LEFT');
        $model->joinAdd(new ParameterTypeModel(), 'LEFT');

        $model->orderBy('PARAMETER_GROUP.ORDERING ASC');
        $model->find();

        $tmp = array();

        while ($model->fetch()) {
            $tmp[$model->GROUP_NAME][] = array(
                'title' => $model->NAME,
                'description' => $model->DESCRIPTION,
                'code' => $model->CODE,
                'type' => $model->TYPE,
                'options' => $model->OPTIONS,
                'value' => $model->VALUE
            );
        }

        $groups = array();

        foreach ($tmp as $title => $options) {
            $groups[] = array(
                'title' => $title,
                'description' => '',
                'options' => $options
            );
        }

        return $groups;
    }

    public function saveSettingsAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('parameter');

        AclController::checkPermission('parameter', 'edit');

        foreach ($_REQUEST as $name => $value) {
            if (preg_match('/^formdata-(.*)/is', $name, $match)) {
                $code = $match[1];

                $model = new ParameterModel();
                $model->VALUE = $value;

                $model->whereAdd("CODE = '$code'");
                $model->update(true);
            }
        }

        (new ParameterController())->syncAction();
    }

    public function deleteAccountAction() {
        AuthenticationController::authenticate();

        $userid = $_SESSION['user']->ID;

        // x. Admin user is not deletable
        if ($userid == 1) {
            $this->pagenotfound();
        }

        // x. Force user confirmation
        $confirmationtext = 'I WANT TO ERASE MY ACCOUNT '.strtoupper(substr(md5(date('Y-m-d H')), 0, 16));

        $this->ensure_additional_data(
            Framework::getSmarty(__FILE__),
            'Delete Account',
            'CONFIRMATION',
            'CONFIRMATION',
            array(
                'Delete Account' => APPLICATION_URL.'/system/deleteAccount'
            ),
            $formdata,
            array(
                'CONFIRMATION' => new ColumnSettings('text', 'Enter your confirmation text:', 'confirmation', array(), 'Enter the text '.$confirmationtext.' to confirm')
            ),
            array('template' => 'input.tpl'),
            function ($formdata) use ($confirmationtext) {
                if ($formdata['CONFIRMATION'] != $confirmationtext) {
                    return "If you wish to delete the account, you need to enter exactly the confirmation text as shown in the tooltip icon";
                }
            }
        );

        // x. Get tables corresponding to all modules
        $model = new AdminModuleModel();

        $model->selectAdd();
        $model->selectAdd('`TABLE`');

        $model->find();

        $tables = array();

        while ($model->fetch()) {
            $tables[] = $model->TABLE;
        }

        // x. Delete all data corresponding to the current user
        $db = new DB_DataObject();

        foreach ($tables as $table) {
            $db->query("DELETE FROM `$table` WHERE GUID = '$userid'");
        }

        // x. Logout
        AuthenticationController::logoutAction();
    }
}