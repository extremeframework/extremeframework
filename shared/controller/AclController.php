<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AclController
{
    static function loadAccessRights($id_user) {
        if (!Framework::hasModule('UserMembership')) {
            return;
        }

        $tbprefix = TABLE_PREFIX;

        $now = date('Y-m-d H:i:s');

        // x. Load active user memberships
		$model = new UserMembershipModel();

        $model->selectAdd();
        $model->selectAdd("{$tbprefix}USER_MEMBERSHIP.*, {$tbprefix}USER_GROUP.NAME as USER_GROUP_NAME, {$tbprefix}USER_GROUP.HIERACHY, {$tbprefix}USER_ROLE.NAME AS USER_ROLE_NAME");

        $model->joinAdd(new UserGroupModel(), 'LEFT');
        $model->joinAdd(new UserRoleModel(), 'LEFT');
        $model->whereAdd("{$tbprefix}USER_MEMBERSHIP.ID_USER = '$id_user'");
        $model->whereAdd("{$tbprefix}USER_MEMBERSHIP.VALID_FROM IS NULL OR {$tbprefix}USER_MEMBERSHIP.VALID_FROM <= '$now'");
        $model->whereAdd("{$tbprefix}USER_MEMBERSHIP.VALID_UNTIL IS NULL OR {$tbprefix}USER_MEMBERSHIP.VALID_UNTIL >= '$now'");

		$model->find();

		$memberships = array();
		$explicit_group_ids = array();
        $parents = array();

     	while ($model->fetch()) {
     	    $m = new stdClass();

     	    $m->ID_USER_GROUP = $model->ID_USER_GROUP;
     	    $m->USER_GROUP_NAME = $model->USER_GROUP_NAME;
     	    $m->ID_USER_ROLE = $model->ID_USER_ROLE;
     	    $m->USER_ROLE_NAME = $model->USER_ROLE_NAME;
     	    $m->VALID_FROM = $model->VALID_FROM;
     	    $m->VALID_UNTIL = $model->VALID_UNTIL;
     	    $m->IS_IMPLICIT = false;

 		    $memberships[] = $m;

            if ($m->ID_USER_GROUP > 0) {
                $explicit_group_ids[] = $m->ID_USER_GROUP;
            }

		    $hierachy = trim($model->HIERACHY, '-');

		    if (!empty($hierachy)) {
		        $parents = array_merge($parents, explode('-', $hierachy));
            }
		}

        // Load implicit parent memberships
        $parents = array_unique($parents);
        $parents = array_diff($parents, $explicit_group_ids);

        if (!empty($parents)) {
    		$ugm = new UserGroupModel();

            $ugm->whereAdd("ID IN ('".implode("','", $parents)."')");

    		$ugm->find();

    		while ($ugm->fetch()) {
    		    if (!in_array($ugm->ID, $explicit_group_ids)) {
             	    $m = new stdClass();

             	    $m->ID_USER_GROUP = $ugm->ID;
             	    $m->USER_GROUP_NAME = $ugm->NAME;
             	    $m->ID_USER_ROLE = null;
             	    $m->USER_ROLE_NAME = null;
             	    $m->VALID_FROM = null;
             	    $m->VALID_UNTIL = null;
             	    $m->IS_IMPLICIT = true;

         		    $memberships[] = $m;
         		    $explicit_group_ids[] = $ugm->ID;
                }
    		}
        }

        $_SESSION['memberships'] = $memberships;

        // x. Groups and roles
		$group_ids = array();
		$role_ids = array();

        foreach ($memberships as $membership) {
            if (!empty($membership->ID_USER_GROUP)) {
                $group_ids[] = $membership->ID_USER_GROUP;
            }

            if (!empty($membership->ID_USER_ROLE)) {
                $role_ids[] = $membership->ID_USER_ROLE;
            }
        }

        $_SESSION['memberships.groups'] = $group_ids;
        $_SESSION['memberships.roles'] = $role_ids;

        // x. Load access rights
		$model = new AccessRightModel();

        $model->whereAdd("ID_USER_GROUP = 0 OR ID_USER_GROUP = '".implode("' OR ID_USER_GROUP = '", $group_ids)."'");

		$model->find();

		$accessrights = array();

     	while ($model->fetch()) {
     	    $actions = explode(' ', $model->ACTIONS);

     	    foreach ($actions as $action) {
     	        if (!empty($action)) {
         		    $accessrights[$model->MODULE][$action] = 1;
                }
     	    }
		}

        $_SESSION['acl'] = $accessrights;
    }

    static function loadUserQuota($id_user) {
        if (!Framework::hasModule('UserQuota')) {
            return;
        }

        // x. User groups
        $group_ids = $_SESSION['memberships.groups'];

        // x. User quota
        $model = new UserQuotaModel();

        $model->whereAdd("ID_USER_GROUP = 0 OR ID_USER_GROUP = '".implode("' OR ID_USER_GROUP = '", $group_ids)."'");

		$model->find();

		$quotas = array();

     	while ($model->fetch()) {
 		    $quotas[$model->MODULE] = array(
 		        'overall' => $model->OVERALL_LIMIT,
 		        'monthly' => $model->MONTHLY_LIMIT,
 		        'daily' => $model->DAILY_LIMIT
 		    );
		}

		$_SESSION['user.quotas'] = $quotas;
    }

    static function ensureCreationQuota($module) {
        if (!class_exists('UserQuotaModel')) {
            return;
        }

        if (!isset($_SESSION['user.quotas'][$module]) || $module == 'userquotalog') {
            return;
        }

        // x. Quota
        $quotas = $_SESSION['user.quotas'][$module];

        // x. Current quota logs
        $model = new UserQuotaLogModel();

        $model->ID_USER = $_SESSION['user']->ID;
        $model->MODULE = $module;

        $model->find();
        $model->fetch();

        $quotalogs = array(
	        'overall' => $model->NBR_OVERALL,
	        'monthly' => $model->NBR_MONTHLY,
	        'daily' => $model->NBR_DAILY,
	        'date' => $model->LATEST_UPDATE
	    );

        // x. Limit types
        $types = array('overall', 'monthly', 'daily');

        // x. Check each limit type
        foreach ($types as $type) {
            $limit = isset($quotas[$type])? $quotas[$type] : 0;
            $current = isset($quotalogs[$type])? $quotalogs[$type] : 0;

            $ok = ($limit == 0 || $current < $limit);

            if (!$ok) {
                (new __AppController())->pagenotfound("Quota reached [$type limit = $limit]");
            }
        }

        // x. Update quota logs
        $model->LATEST_UPDATE = date('Y-m-d');

        if ($model->ID) {
            $model->NBR_OVERALL += 1;
            $model->NBR_MONTHLY += 1;
            $model->NBR_DAILY += 1;

            $model->update();
        } else {
            $model->NBR_OVERALL = 1;
            $model->NBR_MONTHLY = 1;
            $model->NBR_DAILY = 1;

            $model->insert();
        }
    }

    static function getAvailableActions($module) {
        return isset($_SESSION['acl'][$module])? $_SESSION['acl'][$module] : array();
    }

    static function getAclEnabledColumns($module, $action) {
        if (!Framework::hasModule('FieldAcl')) {
            return array('*' => true);
        }

        $key = 'system.aclenabledcolumns.'.$module.'.'.$action;

        if (!Cache::has($key)) {
    	    $user_id = $_SESSION['user']->ID;
    	    $group_ids = $_SESSION['memberships.groups'];

            $model = new FieldAclModel();
            $model->MODULE = $module;
            $model->ACTION = $action;
            $model->whereAdd("ID_USER = {$user_id} OR ID_USER_GROUP IN (".implode(',', $group_ids).")");
            $model->find();

            $includecolumns = array();
            $includeonlycolumns = array();
            $excludecolumns = array();

            while ($model->fetch()) {
                $val = trim($model->FIELDS);

                if ($val != '') {
                    $include = $model->ID_ACL_TYPE == 1;
                    $includeonly = $model->ID_ACL_TYPE == 3;
                    $exclude = $model->ID_ACL_TYPE == 2;

                    $cols = preg_split('/[\s,]+/', $val);

                    foreach ($cols as $col) {
                        if ($include) {
                            $includecolumns[$col] = true;
                        } else if ($includeonly) {
                            $includeonlycolumns[$col] = true;
                        } else if ($exclude) {
                            $excludecolumns[$col] = true;
                        }
                    }
                }
            }

            $aclenabledcolumns = array();

            if (!isset($excludecolumns['*'])) {
                $aclenabledcolumns = !empty($includeonlycolumns)? $includeonlycolumns : $includecolumns;

                foreach ($excludecolumns as $col => $ignored) {
                    $aclenabledcolumns[$col] = false;
                }
            }

            Cache::set($key, $aclenabledcolumns);
        }

        $aclenabledcolumns = Cache::get($key);

        return $aclenabledcolumns;
    }

    static function getSystemExcludedColumns($module) {
        if (!Framework::hasModule('Field')) {
            return array();
        }

        $key = 'system.excludedcolumns';

        if (!Cache::has($key)) {
            $model = new FieldModel();

            $model->IS_EXCLUDED = true;

            $model->find();

            $excludedcolumns = array();

            while ($model->fetch()) {
                $excludedcolumns[$model->MODULE][$model->COLUMN] = true;
            }

            Cache::set($key, $excludedcolumns);
        }

        $excludedcolumns = Cache::get($key);

        return isset($excludedcolumns[$module])? $excludedcolumns[$module] : array();
    }

    static function hasPermission($module, $action = null) {
        $actions = self::getAvailableActions($module);

        return !empty($actions) && (empty($action) || isset($actions[$action]) && $actions[$action]);
    }

    static function checkPermission($module, $action) {
        if (!AclController::hasPermission($module, $action)) {
            (new __AppController())->pagenotfound('No permission');

            return false;
        }

        return true;
    }
}