<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class MindmapItemController extends _MindmapItemController
{
    function initPlugins() {
        PluginManager::add_action('mindmapitem_view_before_tabs', function($model) {
            $url = APPLICATION_URL.'/mindmapitem/mapview/'.$model->ID;

            echo '<iframe src="'.$url.'" width="100%" height="500" style="border:none"/>';
        });
    }

    function mapViewAction() {
        AuthenticationController::authenticate();

        AclController::checkPermission('mindmap', 'view');

		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    $this->pagenotfound();
		}

        $this->checkPermission($id, 'view');

        // x. Mindmap
        $mindmap = new MindmapItemModel();

        $mindmap->ID = $id;

        $mindmap->selectAdd();
        $mindmap->selectAdd('MINDMAP_ITEM.*, MINDMAP.ROOT_BACKGROUND, MINDMAP.NODE_BACKGROUND, MINDMAP.BACKGROUND_URL');

        $mindmap->joinAdd(new MindmapModel());
        $mindmap->find();

        if (!$mindmap->fetch()) {
            $this->pagenotfound();
        }

        $c = new MindmapItemController();
        $ideas = $c->getList(array('PARENT' => $id));

        // x. Hierachy
        $hierachydata = array();

        foreach ($ideas as $idea) {
            if (empty($idea->PARENT)) {
                $idea->PARENT = 0;
            }

            if (!isset($hierachydata[$idea->PARENT])) {
                $hierachydata[$idea->PARENT] = array();
            }

            // Be aware of orphan nodes
            $parent = isset($ideas[$idea->PARENT])? $idea->PARENT : 0;

            $hierachydata[$parent][] = $idea;
        }

        // x. Standardized mindmap
        $std_mindmap = new stdClass();

        $std_mindmap->id = $mindmap->ID;
        $std_mindmap->title = $mindmap->TITLE;
        $std_mindmap->formatVersion = 2;
        $std_mindmap->ideas = array();
        $std_mindmap->isMindmapRoot = false;
        if ($mindmap->COLLAPSED) {
            $std_mindmap->attr = new stdClass();
            $std_mindmap->attr->collapsed = true;
        }

        // x. Standardized ideas
        $root_ideas = isset($hierachydata[$id])? $hierachydata[$id] : array();
        foreach ($root_ideas as $idea) {
            $rank = !empty($idea->RANK)? self::ensureRank($idea->RANK) : $idea->ID;

            if (empty($rank) || isset($std_mindmap->ideas[$rank])) {
                $rank = $idea->ID;
            }

            $std_mindmap->ideas[$rank] = $this->std_idea($idea, $hierachydata);
        }

        // x. A list of mindmaps
        $c = new MindmapController();
        $mindmaps = $c->getList();

        // x. Display
		$smarty = Framework::getSmarty();
        $smarty->assign('json_mindmap', json_encode($std_mindmap));
        $smarty->assign('mindmap_url', APPLICATION_URL.'/mindmapitem/mapview/'.$id);
        $smarty->assign('mindmap_id', $mindmap->ID_MINDMAP);
        $smarty->assign('mindmap_background_url', $mindmap->BACKGROUND_URL);
        $smarty->assign('mindmap_root_background', ColorHelper::ensureHexColor($mindmap->ROOT_BACKGROUND));
        $smarty->assign('mindmap_node_background', ColorHelper::ensureHexColor($mindmap->NODE_BACKGROUND));
        $smarty->assign('mindmaps', $mindmaps);

	    $smarty->display('mindmap.mapview.tpl');
    }

    function std_idea($idea, $hierachydata) {
        $std_idea = new stdClass();

        $std_idea->id = $idea->ID;
        $std_idea->title = $idea->TITLE;

        if (!empty($idea->BACKGROUND) || !empty($idea->ICON) || $idea->COLLAPSED) {
            $attr = new stdClass();

            if (!empty($idea->BACKGROUND)) {
                $style = new stdClass();
                $style->background = ColorHelper::ensureHexColor($idea->BACKGROUND);

                $attr->style = $style;
            }

            if (!empty($idea->ICON)) {
                $icon = new stdClass();
                $icon->url = preg_match('/http/i', $idea->ICON)? $idea->ICON : UPLOAD_URL.'/'.$idea->ICON;
                $icon->width = 24;
                $icon->height = 24;
                $icon->position = 'right';

                $attr->icon = $icon;
            }

            if ($idea->COLLAPSED) {
                $attr->collapsed = true;
            }

            $std_idea->attr = $attr;
        }

        if (isset($hierachydata[$idea->ID]) && !empty($hierachydata[$idea->ID])) {
            $childs = $hierachydata[$idea->ID];

            $std_idea->ideas = array();
            foreach ($childs as $child) {
                $rank = !empty($child->RANK)? self::ensureRank($child->RANK) : $child->ID;

                if (empty($rank) || isset($std_idea->ideas[$rank])) {
                    $rank = $child->ID;
                }

                $std_idea->ideas[$rank] = $this->std_idea($child, $hierachydata);
            }
        }

        return $std_idea;
    }

    function nextIdAction() {
        $model = new MindmapItemModel();

        $model->TITLE = '(blank)';
        $model->insert();

        echo $model->ID;
    }

    function onBeforeSave(&$model) {
        if (preg_match('/^[0-9a-f]+$/i', $model->BACKGROUND)) {
            $model->BACKGROUND = '#'.$model->BACKGROUND;
        }
    }

    function ensureRank($rank) {
        $rank = 'x'.$rank;
        $rank = trim($rank, ".0");
        $rank = trim($rank, "x");

        return $rank;
    }
}