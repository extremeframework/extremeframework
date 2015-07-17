<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class WorkflowTransitionController extends _WorkflowTransitionController
{
    function performAction() {
		list($workflow_transition_uuid, $module, $object_uuid) = explode('/', $_REQUEST['args']);

        $class = $module.'Controller';
        $controller = new $class();

        // x. Get workflow transition
        $wftm = new WorkflowTransitionModel();

        $wftm->UUID = $workflow_transition_uuid;

        $wftm->find();
        $wftm->fetch();

        $workflow_id = $wftm->ID_WORKFLOW;
        $next_stage_id = $wftm->END_ID_WORKFLOW_STAGE;
        $action = $wftm->ACTION;

        // x. Transition screen
        $formdata = array();

        if ($wftm->TRANSITION_ID_SCREEN) {
            // x. Screen
            $sm = new ScreenModel();

            $sm->setId($wftm->TRANSITION_ID_SCREEN);

            $sm->find();

            if (!$sm->fetch()) {
                $this->pagenotfound();
            }

            // x. Screen fields
            $sfm = new ScreenFieldModel();

            $sfm->selectAdd();
            $sfm->selectAdd('SCREEN_FIELD.*, VALUE_TYPE.CODE AS VALUE_TYPE_CODE');
            $sfm->joinAdd(new ValueTypeModel());

            $sfm->ID_SCREEN = $sm->id();
            $sfm->orderBy('ORDERING ASC');

            $sfm->find();

            $screenfields = array();

            while ($sfm->fetch()) {
                $screenfields[] = clone $sfm;
            }

            $fields = array();
            $mandatories = array();
            $fieldinfos = array();

            foreach ($screenfields as $screenfield) {
                $fields[] = $screenfield->CODE;

                if ($screenfield->IS_MANDATORY) {
                    $mandatories[] = $screenfield->CODE;
                }

                $fieldinfos[$screenfield->CODE] = new ColumnSettings(
                    $screenfield->VALUE_TYPE_CODE,
                    $screenfield->TITLE,
                    $screenfield->CODE,
                    array(
                        'datasource' => $screenfield->DATASOURCE,
                        'valuecol' => $screenfield->VALUECOL,
                        'textcol' => $screenfield->TEXTCOL
                    )
                );
            }

            $this->ensure_additional_data(
                Framework::getSmarty($controller->__FILE__),
                $sm->TITLE,
                $fields,
                $mandatories,
                array(
                    ucfirst($action) => APPLICATION_URL."/workflowtransition/perform/$workflow_transition_uuid/$module/$object_uuid"
                ),
                $formdata,
                $fieldinfos,
                array('template' => "input.$module.tpl")
            );
        }

        // x. Get target object
        $class = $module.'Model';
        $model = new $class();

        $model->UUID = $object_uuid;
        $model->find();

        if (!$model->fetch()) {
            return;
        }

        // x. Before workflow transition
        $controller->onBeforeWorkflowTransition($wftm, $model, $formdata);

        // x. Update WFID
        $model->WFID = $next_stage_id;
        $model->update();

        // x. Workflow log
        $wflm = new WorkflowLogModel();

        $wflm->ID_WORKFLOW = $workflow_id;
        $wflm->ID_WORKFLOW_TRANSITION = $workflow_transition_uuid;
        $wflm->MODULE = $module;
        $wflm->OBJECT_ID = $object_uuid;
        $wflm->DATE = date('Y-m-d H:i:s');
        $wflm->ID_USER = $_SESSION['user']->ID;
        $wflm->DETAILS = json_encode(array_merge(get_object_vars($this->model_sanitize($model)), $formdata));

        $wflm->insert();

        // x. After workflow transition
        $controller->onWorkflowTransitionSuccess($wftm, $model, $formdata);

        ContextStack::back(0);
    }
}