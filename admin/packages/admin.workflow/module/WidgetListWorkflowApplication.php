<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

/**
 * Usage: <{module class="WidgetListWorkflowApplication" method="<overriding_method>" COLUMN=? REFTABLE___REFCOLUMN=? where="<overriding_condition>" template='widgetlist.workflowapplication.tpl'}>
 */

defined('APPLICATION_DIR') OR exit();

class WidgetListWorkflowApplication extends WorkflowApplicationController {
    function fetch($params) {
        if (isset($params['method']) && trim($params['method']) != '') {
            $method = trim($params['method']);

            unset($params['method']);

            return $this->$method($params, $smarty);
        }

        $template = isset($params['template'])? $params['template'] : 'widgetlist.workflowapplication.tpl';
        $limit = isset($params['limit'])? $params['limit'] : 10;
        $readonly = isset($params['readonly'])? $params['readonly'] : false;

        if (AclController::hasPermission('workflowapplication')) {
            $vars = array_keys(get_object_vars(new WorkflowApplicationModel()));

            $preset = null;
            $presetvalue = null;
            $presetparams = array();
            $presetdata = array();
            $searchdata = $this->getSearchData();
            $filterdata = $this->getFilterData();
            $customfilterdata = $this->getCustomFilterData();
            $filtercolumns = $this->getCustomFilterColumns('workflowapplication', $filter);
            $aclviewablecolumns = AclController::getAclEnabledColumns('workflowapplication', 'view');

            if (isset($params['where']) && trim($params['where']) != '') {
                $wheres = array($params['where']);
            } else {
                $wheres = array();

                foreach ($params as $param => $value) {
                    if (in_array($param, $vars)) {
                        if (trim($value) == '') {
                            $value = '0';
                        }

                        $preset = $preset? $preset.','.$param : $param;
                        $presetvalue = $presetvalue? $presetvalue.','.$value : $value;
                        $aclviewablecolumns[$param] = false;
                        $presetdata[$param] = $value;
                    }
                }
            }

            $this->setPresetData($presetdata);

            foreach ($params as $param => $value) {
                if (preg_match('/^preset_/i', $param)) {
                    $presetparams[] = "$param=$value";
                }
            }

            if (empty($aclviewablecolumns) || (!isset($aclviewablecolumns['*']) && !in_array(true, $aclviewablecolumns))) {
                return 'No view available';
            }

            $orderby = $this->getRealOrderBy();
            $limit = $this->getPageSize();
            $page = $this->getPageNumber();

            $rows = $this->getList(true, $searchdata + $customfilterdata + $presetdata, $filterdata, $orderby, $limit, $page, $pagination, true, $wheres);
            

            $total = $pagination['total'];
            $page = $pagination['page'];
            $limit = $pagination['pagesize'];
            $limit_from = $pagination['from'];
            $limit_to = $pagination['to'];

            $pagination = new Pagination($pagination['total'], ($pagination['page']-1)*$pagination['pagesize'], $pagination['pagesize']);
            $pagination = $pagination->getPageLinks();

            $smarty = Framework::getSmarty(__FILE__);

    		$smarty->assign('rows', $rows);
    		$smarty->assign('pagination', $pagination);
            $smarty->assign('total', $total);
			$smarty->assign('limit', $limit);
			$smarty->assign('limit_from', $limit_from);
			$smarty->assign('limit_to', $limit_to);
			$smarty->assign('readonly', $readonly);
            $smarty->assign('preset', $preset);
            $smarty->assign('presetvalue', $presetvalue);
            $smarty->assign('presetstring', implode('&', $presetparams));
            $smarty->assign('filter', $filter);
            $smarty->assign('filtercolumns', $filtercolumns);
            $smarty->assign('aclviewablecolumns', $aclviewablecolumns);
    		$smarty->assign('customfields', CustomFieldHelper::getListCustomFields('workflowapplication', $preset, $presetvalue));
    		
    		$smarty->assign('admin_list_actions', AdminActionHelper::getAdminActions('workflowapplication', 'list'));
    		$smarty->assign('admin_listitem_actions', AdminActionHelper::getAdminActions('workflowapplication', 'listitem'));
    		
        }

		return $smarty->fetch($template);
	}
}