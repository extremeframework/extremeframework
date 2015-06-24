<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class ScreenController extends _ScreenController
{
    function setupAdditionalViewButtons($model) {
        $buttons = parent::setupAdditionalViewButtons($model);

        // x. Buttons
        $liveaction = array(
            'code' => 'live',
            'title' => 'Live',
            'link' => APPLICATION_URL.'/screen/live/'.$model->ID
        );

        $buttons[] = $liveaction;

        return $buttons;
    }

    function liveAction() {
		list($id) = explode('/', $_REQUEST['args']);

        // x. Screen
        $sm = new ScreenModel();

        $sm->ID = $id;
        $sm->find();

        if (!$sm->fetch()) {
            $this->pagenotfound();
        }

        // x. Screen fields
        $sfm = new ScreenFieldModel();

        $sfm->selectAdd();
        $sfm->selectAdd('SCREEN_FIELD.*, VALUE_TYPE.CODE AS VALUE_TYPE_CODE');
        $sfm->joinAdd(new ValueTypeModel());

        $sfm->ID_SCREEN = $sm->ID;
        $sfm->find();

        $screenfields = array();

        while ($sfm->fetch()) {
            $screenfields[] = clone $sfm;
        }

        // x. Screen actions
        $sam = new ScreenActionModel();

        $sam->ID_SCREEN = $sm->ID;
        $sam->find();

        $screenactions = array();

        while ($sam->fetch()) {
            $screenactions[$sam->ACTION_TITLE] = $sam->ACTION_URL;
        }

        $fields = array();
        $mandatories = array();
        $fieldinfos = array();
        $formdata = array();

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
            $sm->TITLE,
            $fields,
            $mandatories,
            $screenactions,
            $formdata,
            $fieldinfos,
            array('template' => 'live.screen.tpl')
        );
    }
}