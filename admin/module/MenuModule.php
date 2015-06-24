<?php
class MenuModule {
    function fetch($params, $smarty) {
        $menucode = isset($params['menucode'])? $params['menucode'] : '';
        $level = isset($params['level'])? $params['level'] : 1;
        $template = $params['template'];

        $fm = new MenuModel();
        $fm->CODE = $menucode;
        $fm->find();
        if ($fm->fetch()) {
            $menuheader = $fm->NAME;
        } else {
            die("Menu code not found: $menucode");
        }

        $model = new MenuItemModel();
        $model->IS_ENABLED = 1;

        $model->selectAdd();
        $model->selectAdd(TABLE_PREFIX.'MENU_ITEM.*');

        $fm = new MenuModel();
        $fm->CODE = $menucode;
        $model->joinAdd($fm);

        $model->selectAdd(TABLE_PREFIX.'POST.SLUG AS POST_SLUG');
        $model->joinAdd(new PostModel(), 'LEFT');

        $model->selectAdd(TABLE_PREFIX.'POST_CATEGORY.SLUG AS CAT_SLUG');
        $model->joinAdd(new PostCategoryModel(), 'LEFT');

        $memberships = isset($_SESSION['memberships'])? $_SESSION['memberships'] : array();
        $user_group_ids = array(0);
        foreach ($memberships as $membership) {
            $user_group_ids[] = $membership->ID;
        }
        $model->whereAdd(TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP IS NULL OR ".TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP = '".implode("' OR ".TABLE_PREFIX."MENU_ITEM.ACL_ID_USER_GROUP = '", $user_group_ids)."'");

        $model->orderBy('PARENT, ORDERING');
        $model->find();

        $rows = array();
        while ($model->fetch()) {
            $rows[] = clone $model;
        }

        // Rebuild slugs
        foreach ($rows as $row) {
            if (!empty($row->POST_SLUG)) {
                $row->SLUG = APPLICATION_URL.'/scopes/cms/'.$row->POST_SLUG;
            } elseif (!empty($row->CAT_SLUG)) {
                $row->SLUG = APPLICATION_URL.'/scopes/cms/category/'.$row->CAT_SLUG;
            } elseif (!preg_match('/(http|https)\:\/\//i', $row->SLUG)) {
                $row->SLUG = APPLICATION_URL.'/'.$row->SLUG;
            }
        }

        $depth = 0;
        $orphan = true;
        $expectedparents = array();

        $menus = array();
        while ($orphan && $depth < $level) {
            $orphan = false;
            $ids = array();

            foreach ($rows as $i => $row) {
                if (empty($expectedparents) && empty($row->PARENT) || !empty($expectedparents) && in_array($row->PARENT, $expectedparents)) {
                    $menus[$depth][$row->PARENT? $row->PARENT : 0][] = $row;
                    $ids[] = $row->ID;

                    unset($rows[$i]);
                } else {
                    $orphan = true;
                }
            }

            $expectedparents = $ids;
            $depth += 1;
        }

		$smarty->assign('menuheader', $menuheader);
		$smarty->assign('menus', $menus);
		$smarty->assign('parent', 0);
		$smarty->assign('depth', 0);

		return $smarty->fetch($template);
	}
}