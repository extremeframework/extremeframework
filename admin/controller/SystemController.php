<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SystemController extends __AppController
{
    public function settingsAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('parameter');

        AclController::checkPermission('parameter', 'edit');

		ContextStack::register(APPLICATION_URL.'/system/settings/');

        // x. Get grouped parameters
        $groups = $this->getGroupedParameters();

        // x. Render
		$smarty = Framework::getSmarty();

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
}