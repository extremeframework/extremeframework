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
            'code' => 'preview',
            'title' => 'Preview',
            'link' => APPLICATION_URL.'/screen/preview/'.$model->ID
        );

        $buttons[] = $liveaction;

        return $buttons;
    }

    function previewAction() {
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
            Framework::getSmarty(__FILE__),
            $sm->TITLE,
            $fields,
            $mandatories,
            array(
                'Action' => ''
            ),
            $formdata,
            $fieldinfos,
            array('template' => 'preview.screen.tpl')
        );
    }
}