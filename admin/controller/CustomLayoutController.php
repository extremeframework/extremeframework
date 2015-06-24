<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class CustomLayoutController extends AppController
{
    function indexAction() {
        list($pageid) = explode('/', $_REQUEST['args']);

        ////////////////////////////////////////////////////
        // x. Load a list of pages
        $model = new PageModel();
        $model->find();

        $page = null;
        $pages = array();
        while ($model->fetch()) {
            if ($pageid == $model->ID) {
                $page = clone $model;
            }

            $pages[] = clone $model;
        }

        ////////////////////////////////////////////////////
        // x. Used modules by positions
        $model = new PageLayoutModel();

    	$model->ID_PAGE = $pageid;

        $model->selectAdd();
        $model->selectAdd(TABLE_PREFIX.'MODULE.*');
        $model->selectAdd(TABLE_PREFIX.'PAGE_LAYOUT.POSITION');
        $model->selectAdd(TABLE_PREFIX.'PAGE_LAYOUT.ORDERING');

    	$model->joinAdd(new ModuleModel());

    	$model->orderBy('POSITION, ORDERING');

        $model->find();

        $usedmodules = array();
        $usedids = array();
        while ($model->fetch()) {
            $usedids[] = $model->ID;

            $usedmodules[$model->POSITION][] = clone $model;
        }

        ////////////////////////////////////////////////////
        // x. Load a list of available modules
        $model = new ModuleModel();
        $model->find();

        $modules = array();
        while ($model->fetch()) {
            if (!in_array($model->ID, $usedids)) {
                $modules[] = clone $model;
            }
        }

        $layout = null;
        $positions = array();
        if (!empty($page)) {
            $layout = $this->template2layout($page->ID_PAGE_TEMPLATE, $positions);
        }

		$smarty = Framework::getSmarty();
	    $smarty->assign('modules', $modules);
	    $smarty->assign('usedmodules', $usedmodules);
	    $smarty->assign('pages', $pages);
	    $smarty->assign('page', $page);
	    $smarty->assign('pageid', $pageid);
	    $smarty->assign('layout', $layout);
	    $smarty->assign('jquerypositions', !empty($positions)? '#'.implode(',#', $positions) : '');

        if ($this->caller == 'ajax') {
		    $content = $smarty->fetch('custom.layout.tpl');

            if (($beginpos = strpos($content, '<!--:'.$this->return.'begin:-->')) && ($endpos = strpos($content, '<!--:'.$this->return.'end:-->'))) {
                $content = substr($content, $beginpos, $endpos - $beginpos);

    		    echo $content;
            } else {
                echo 'An unexpected error has been encountered. Please report this problem to your system administrator.';
            }
        } else {
    	    $smarty->display('custom.layout.tpl');
        }
	}

    function template2layout($templateid, &$positions = null) {
        $model = new TemplateTypeModel();
        $pt = new PageTemplateModel();
        $pt->ID = $templateid;
        $model->joinAdd($pt);
        $model->find();
        $model->fetch();

        $tcontent = $model->PSEUDO_HTML;

        preg_match_all('/{(.*)}/i', $tcontent, $matches);
        $positions = $matches[1];

        $tags = explode(',', $model->OTHER_ZONE_TAGS);

        $others = array();
        foreach ($tags as $tag) {
            $tag = trim($tag);
            if ($tag != '') {
                $others[] = $tag;
            }
        }

        if (!empty($others)) {
            $tcontent .= '<div style="padding:15px 0 5px 0;"><b>Other zones</b></div>';
            foreach ($others as $other) {
                $tcontent .= '<div style="width:25%;border:1px solid gray;background-color:whitesmoke;min-height:100px;">{'.$other.'}</div>';
            }
            $positions = array_merge($positions, $others);
        }

        foreach ($positions as $position) {
            $s = '{'.$position.'}';

            $r = '<ul id="'.$position.'" class="modList"><li style="display: none; "></li><{foreach from=$usedmodules.'.$position.' item=item}><li id="<{$item->ID}>" class="mod"><{$item->NAME}></li><{/foreach}></ul>{'.$position.'}';

            $tcontent = str_replace($s, $r, $tcontent);
        }

        $lname = '.'.$model->CODE;
        $lfile = TEMPLATE_DIR.'/'.$lname;

        file_put_contents($lfile, trim($tcontent));

        return $lname;
    }

    function updateAction() {
        $pageid = $_REQUEST['pageid'];
        $modules = $_REQUEST['modules'];

        ////////////////////////////////////////////////////
        // x. Delete all current used modules
        $model = new PageLayoutModel();
    	$model->whereAdd("ID_PAGE = '$pageid'");;
    	$model->delete(true);

        ////////////////////////////////////////////////////
        // x. Insert new assigned modules
        foreach ($modules as $position => $items) {
            foreach ($items as $ordering => $moduleid) {
                $model = new PageLayoutModel();$model->debugLevel(5);
            	$model->ID_PAGE = $pageid;
            	$model->ID_MODULE = $moduleid;
            	$model->POSITION = $position;
            	$model->ORDERING = $ordering;
            	$model->insert();
            }
        }
    }
}