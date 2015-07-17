<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class WorkflowHelper {
    static private function getSessionCache() {
        return Cache::session();
    }

    static function getDefaultWorkflowStage($module) {
        if (!Framework::hasModule('WorkflowStage')) {
            return null;
        }

        $cache = self::getSessionCache();

        if ($cache->has('system.default_workflow_stages')) {
            $modules = $cache->get('system.default_workflow_stages');
        } else {
    		$model = new WorkflowStageModel();

    		$model->selectAdd();
    		$model->selectAdd('WORKFLOW_STAGE.*, MODULE');

    		$model->joinAdd(array('ID_WORKFLOW','WORKFLOW_APPLICATION:ID_WORKFLOW'), 'LEFT');
    		$model->whereAdd("IS_DEFAULT = 1");

    		$model->find();

            $modules = array();

            while ($model->fetch()) {
            	$modules[$model->MODULE] = $model->id();
    		}

    		$cache->set('system.default_workflow_stages', $modules);
        }

        return isset($modules[$module])? $modules[$module] : null;
    }

    static function getWorkflowTransitions($module, $id_workflow_stage) {
        if (!Framework::hasModule('WorkflowTransition')) {
            return array();
        }

        $cache = self::getSessionCache();

        if ($cache->has('system.workflow_transitions')) {
            $transitions = $cache->get('system.workflow_transitions');
        } else {
    	    $group_ids = $_SESSION['memberships.groups'];
    	    $role_ids = $_SESSION['memberships.roles'];

            $model = new WorkflowTransitionModel();

    		$model->selectAdd();
    		$model->selectAdd('WORKFLOW_TRANSITION.*');
    		$model->selectAdd('WORKFLOW_APPLICATION.MODULE');

    		$model->joinAdd(array('ID_WORKFLOW','WORKFLOW_APPLICATION:ID_WORKFLOW'), 'LEFT');

            if (isset($_SESSION['user']) && $_SESSION['user']->ID != 1) {
    		    $model->whereAdd("((ID_USER_GROUP IS NULL OR ID_USER_GROUP = 0) AND (ID_USER_ROLE IS NULL OR ID_USER_ROLE = 0)) OR (ID_USER_GROUP > 0 AND ID_USER_GROUP IN ('".implode("', '", $group_ids)."')) OR (ID_USER_ROLE > 0 AND ID_USER_ROLE IN ('".implode("','", $role_ids)."'))");
            }

            $model->orderBy('ORDERING ASC');

    		$model->find();

            $transitions = array();

            while ($model->fetch()) {
            	$transitions[$model->MODULE][$model->START_ID_WORKFLOW_STAGE][] = clone $model;
    		}

    		$cache->set('system.workflow_transitions', $transitions);
        }

		return isset($transitions[$module][$id_workflow_stage])? $transitions[$module][$id_workflow_stage] : array();
    }

    static function ensureEditable($wfid) {
        if (!WorkflowHelper::isEditable($wfid)) {
            (new __AppController())->pagenotfound('Item not editable');
        }
    }

    static function ensureDeletable($wfid) {
        if (!WorkflowHelper::isDeletable($wfid)) {
            (new __AppController())->pagenotfound('Iten not deletable');
        }
    }

    static function isEditable($wfid) {
        $editables = WorkflowHelper::getEditableStages();

        return empty($wfid) || in_array($wfid, $editables);
    }

    static function isDeletable($wfid) {
        $deletables = WorkflowHelper::getDeletableStages();

        return empty($wfid) || in_array($wfid, $deletables);
    }

    static function loadWorkflows() {
        if (!Framework::hasModule('WorkflowStage')) {
            return array();
        }

        $cache = self::getSessionCache();

        if ($cache->has('system.workflows')) {
            $data = $cache->get('system.workflows');
        } else {
            $model = new WorkflowStageModel();
            $model->find();

            $deletables = array();
            $editables = array();

            while ($model->fetch()) {
                if ($model->IS_BINDING_OBJECT_EDITABLE) {
                    $editables[] = $model->id();
                }

                if ($model->IS_BINDING_OBJECT_DELETABLE) {
                    $deletables[] = $model->id();
                }
            }

            $data = array(
                'editables' => $editables,
                'deletables' => $deletables
            );

            $cache->set('system.workflows', $data);
        }

        return $data;
    }

    static function getEditableStages() {
        $data = WorkflowHelper::loadWorkflows();

        return isset($data['editables'])? $data['editables'] : array();
    }

    static function getDeletableStages() {
        $data = WorkflowHelper::loadWorkflows();

        return isset($data['deletables'])? $data['deletables'] : array();
    }
}