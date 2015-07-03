<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class PageController extends _PageController
{
    function previewAction() {
        $page = PageController::getItemById(1);

        $sections = PageSectionController::getItems(array('ID_PAGE' => 1), array(), 'ORDERING');

        $depth = 0;
        $orphan = true;
        $expectedparents = array();
        $level = 5;

        $sectiontree = array();
        while ($orphan && $depth < $level) {
            $orphan = false;
            $ids = array();

            foreach ($sections as $i => $row) {
                if (empty($expectedparents) && empty($row->PARENT) || !empty($expectedparents) && in_array($row->PARENT, $expectedparents)) {
                    $sectiontree[$depth][$row->PARENT? $row->PARENT : 0][] = $row;
                    $ids[] = $row->ID;

                    unset($sections[$i]);
                } else {
                    $orphan = true;
                }
            }

            $expectedparents = $ids;
            $depth += 1;
        }

		$smarty = Framework::getSmarty(__FILE__);

        $smarty->assign('sectiontree', $sectiontree);
		$smarty->assign('single', $page);
		$smarty->assign('sections', $sections);

	    $smarty->display('page.preview.tpl');
    }
}