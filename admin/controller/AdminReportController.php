<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class AdminReportController extends _AdminReportController
{
    function liveSearchAction() {
		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

		$searchdata = $this->getSearchFormData();

        $_SESSION['adminreport.liveSearch'][$id] = $searchdata;

        ContextStack::back(0);
    }

    function liveLimitAction() {
		@list($id, $pagesize) = explode('/', $_REQUEST['args']);

        $_SESSION['adminreport.livePageSize'][$id] = $pagesize;
        $_SESSION['adminreport.livePageNumber'][$id] = 1;

        ContextStack::back(0);
    }

    function livePageAction() {
		@list($id, $pagenumber) = explode('/', $_REQUEST['args']);

        $_SESSION['adminreport.livePageNumber'][$id] = $pagenumber;

        ContextStack::back(0);
    }

    function liveSortAction() {
		@list($id, $orderby) = explode('/', $_REQUEST['args']);

        $this->updateOrderBy(strtoupper($orderby), 'adminreport-'.$id);

        ContextStack::back(0);
    }

    function mysql_date_format($value) {
		if (!preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/', $value)) {
            $format = DATE_FORMAT;
            $format = str_ireplace(array('yy', 'mm', 'dd'), array('Y', 'm', 'd'), $format);

            $info = date_parse_from_format($format, $value);

            if ($info['error_count'] == 0) {
                $year = substr('20'.$info['year'], -4);
                $month = substr('00'.$info['month'], -2);
                $day = substr('00'.$info['day'], -2);

                $value = "$year-$month-$day";
            } else {
                $value = '';
            }
        }

        return $value;
    }

    function liveAction() {
        AuthenticationController::authenticate();

        LicenseController::enforceLicenseCheck('adminreport');

        AclController::checkPermission('adminreport', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

        $this->checkPermission($id, 'view');

        $model = $this->getItem($id);

     	if (!$model) {
		    $this->pagenotfound();
     	}

        ContextStack::register(APPLICATION_URL.'/adminreport/live/'.$id);

        // x. Base query
        $query = $model->QUERY;
        $columns = preg_split('/[,\s]/', str_replace(' ', '', $model->LIST_COLUMNS), -1, PREG_SPLIT_NO_EMPTY);
        $quicksearch_columns = preg_split('/[,\s]/', str_replace(' ', '', $model->QUICKSEARCH_COLUMNS), -1, PREG_SPLIT_NO_EMPTY);

        if (empty($columns)) {
		    $this->pagenotfound('No report columns defined.');
        }

        // x. Search data
        $searchdata = isset($_SESSION['adminreport.liveSearch'][$id])? $_SESSION['adminreport.liveSearch'][$id] : array();

        // x. Report search fields
        $sfm = new AdminReportSearchFieldModel();

        $sfm->selectAdd();
        $sfm->selectAdd('ADMIN_REPORT_SEARCH_FIELD.*, VALUE_TYPE.CODE as VALUE_TYPE_CODE');
        $sfm->joinAdd(new ValueTypeModel());

        $sfm->ID_ADMIN_REPORT = $id;
        $sfm->find();

        $searchfields = array();
        while($sfm->fetch()) {
            $searchfields[] = clone $sfm;
        }

        // x. Search where clauses
        $wheres = array();

        // Quick search
        if (isset($searchdata['__QUICKSEARCH__']) && !empty($searchdata['__QUICKSEARCH__'])) {
            $qs_wheres = array();

            foreach ($quicksearch_columns as $column) {
                $qs_wheres[] = "($column LIKE '%".$searchdata['__QUICKSEARCH__']."%')";
            }

            if (!empty($qs_wheres)) {
                $wheres[] = '('.implode(' OR ', $qs_wheres).')';
            }
        }

        // Other searches
        foreach ($searchfields as $field) {
            $code = $field->CODE;
            $wc = $field->WHERE_CLAUSE;

            if (isset($searchdata[$code]) && !empty($searchdata[$code])) {
                $value = $searchdata[$code];

                if ($field->VALUE_TYPE_CODE == 'date') {
                    $value = $this->mysql_date_format($value);
                }

                $wheres[] = '('.str_replace('{'.$code.'}', $value, $wc).')';
            }
        }

        // x. Apply search data
        if (!empty($wheres)) {
            $s = implode(' AND ', $wheres);

            if (preg_match('/ where /i', $query)) {
                $query = str_ireplace (' WHERE ', " WHERE ($s) AND ", $query);
            } elseif (preg_match('/\bgroup by\b/i', $query)) {
                $query = str_ireplace ('GROUP BY', "WHERE $s GROUP BY", $query);
            } elseif (preg_match('/\border by\b/i', $query)) {
                $query = str_ireplace ('ORDER BY', "WHERE $s ORDER BY", $query);
            } else {
                $query .= ' WHERE '.$s;
            }
        }

        // x. Data
        $orderby = $this->getRealOrderBy(null, 'adminreport-'.$id);
        $limit = isset($_SESSION['adminreport.livePageSize'][$id])? $_SESSION['adminreport.livePageSize'][$id] : 20;
        $page = isset($_SESSION['adminreport.livePageNumber'][$id])? $_SESSION['adminreport.livePageNumber'][$id] : 1;

        // x. Order by
        if (!empty($orderby) && !preg_match('/\border by\b/i', $query)) {
            $query .= " ORDER BY $orderby";
        }

        // x. Limit
		if ($limit == '*' || $limit <= 0 || $limit > 100) {
			$limit = 100;
		}

        $model2 = new DB_DataObject();

        if ($limit != '*') {
	        $model2->query($query);
    		$total = $model2->N;

            if (($page-1)*$limit >= $total) {
                $page = floor($total/$limit) + 1;
            }

            if (!preg_match('/ limit /i', $query)) {
                $query .= ' LIMIT '.($page-1)*$limit.','.$limit;
            }

            $model2->query($query);
            $curtotal = $model2->N;

            $limit_from = ($page-1)*$limit + 1;
            $limit_to = $limit_from + $curtotal - 1;
        } else {
    		$pagination = null;

            $model2->query($query);
    		$total = $model2->N;

    		$curtotal = $model2->N;

            $limit_from = 1;
            $limit_to = $curtotal;
        }

        $rows = array();
        while($model2->fetch()) {
            $rows[] = (array)clone $model2;
        }

        $pagination = array(
            'from' => $limit_from,
            'to' => $limit_to,
            'total' => $total,
            'page' => $page,
            'pagesize' => $limit
        );

        $pagination = new Pagination($pagination['total'], ($pagination['page']-1)*$pagination['pagesize'], $pagination['pagesize']);
        $pagination = $pagination->getPageLinks();

     	$filtercolumns = $columns;

        // x. Report links
        $x = new AdminReportLinkModel();
        $x->ID_ADMIN_REPORT = $id;
        $x->find();

        $columnlinks = array();
        while($x->fetch()) {
            $columnlinks[$x->COLUMN_NAME] = $x->LINK_FORMAT;
        }

        // x. Report actions
        $ram = new AdminReportActionModel();
        $ram->ID_ADMIN_REPORT = $id;
        $ram->find();

        $reportactions = array();
        while($ram->fetch()) {
            $reportactions[] = clone $ram;
        }

		$smarty = Framework::getSmarty();
		$smarty->assign('model', $model);
		$smarty->assign('rows', $rows);
		$smarty->assign('title', $model->NAME);
		$smarty->assign('columns', $columns);
		$smarty->assign('filtercolumns', $filtercolumns);
		$smarty->assign('columnlinks', $columnlinks);
		$smarty->assign('reportactions', $reportactions);
		$smarty->assign('searchfields', $searchfields);
		$smarty->assign('searchdata', $searchdata);
		$smarty->assign('pagination', $pagination);
        $smarty->assign('total', $total);
		$smarty->assign('limit', $limit);
		$smarty->assign('limit_from', $limit_from);
		$smarty->assign('limit_to', $limit_to);

        if ($this->caller == 'ajax') {
            $templatetype = !empty($this->templatetype)? $this->templatetype : 'live';
		    $content = $smarty->fetch($templatetype.'.adminreport.tpl');

            if (!empty($this->return)) {
                if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                    $content = substr($content, $beginpos, $endpos - $beginpos);
                }
            }

		    echo $content;
        } else {
		    $smarty->display('live.adminreport.tpl');
        }
    }
}