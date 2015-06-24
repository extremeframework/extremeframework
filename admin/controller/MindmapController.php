<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */

class MindmapController extends _MindmapController
{
    function initPlugins() {
        PluginManager::add_action('mindmap_view_before_tabs', function($model) {
            $url = APPLICATION_URL.'/mindmap/mapview/'.$model->ID;

            echo '<iframe src="'.$url.'" width="100%" height="500" style="border:none"/>';
        });
    }

    function newMapAction() {
        AuthenticationController::authenticate();

        $model = new MindmapModel();
        $model->selectAdd();
        $model->selectAdd('COUNT(*) AS _COUNT');
        $model->whereAdd("TITLE LIKE 'New mindmap%'");
        $model->find();
        $model->fetch();

        $count = $model->_COUNT + 1;

        $model = new MindmapModel();
        $model->TITLE = "New mindmap ($count)";
        $model->ROOT_BACKGROUND = '#FFFFFF';
        $model->insert();

        header("Location:".APPLICATION_URL."/mindmap/mapview/".$model->ID);
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
        $mindmap = $this->getItem($id);

        if (empty($mindmap)) {
            $this->pagenotfound();
        }

        $c = new MindmapItemController();
        $ideas = $c->getList(array('ID_MINDMAP' => $id));

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
        $std_mindmap->isMindmapRoot = true;
        $std_mindmap->ideas = array();
        if ($mindmap->COLLAPSED) {
            $std_mindmap->attr = new stdClass();
            $std_mindmap->attr->collapsed = true;
        }

        // x. Standardized ideas
        $root_ideas = isset($hierachydata[0])? $hierachydata[0] : array();
        foreach ($root_ideas as $idea) {
            $rank = !empty($idea->RANK)? self::ensureRank($idea->RANK) : $idea->ID;

            if (empty($rank) || isset($std_mindmap->ideas[$rank])) {
                $rank = $idea->ID;
            }

            $std_mindmap->ideas[$rank] = $this->std_idea($idea, $hierachydata);
        }

        // x. A list of mindmaps
        $mindmaps = $this->getList();

        // x. Display
		$smarty = Framework::getSmarty();
        $smarty->assign('json_mindmap', json_encode($std_mindmap));
        $smarty->assign('mindmap_url', APPLICATION_URL.'/mindmap/mapview/'.$id);
        $smarty->assign('mindmap_id', $id);
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

    function onBeforeSave(&$model) {
        if (preg_match('/^[0-9a-f]+$/i', $model->ROOT_BACKGROUND)) {
            $model->ROOT_BACKGROUND = '#'.$model->ROOT_BACKGROUND;
        }

        if (preg_match('/^[0-9a-f]+$/i', $model->NODE_BACKGROUND)) {
            $model->NODE_BACKGROUND = '#'.$model->NODE_BACKGROUND;
        }
    }

    function ensureRank($rank) {
        $rank = 'x'.$rank;
        $rank = trim($rank, ".0");
        $rank = trim($rank, "x");

        return $rank;
    }

    function changeBackgroundAction() {
		list($id) = explode('/', $_REQUEST['args']);

		if (empty($id)) {
		    return;
		}

        $curid = isset($_SESSION['user.preferences.mindmap.wallpaper'])? $_SESSION['user.preferences.mindmap.wallpaper'] : 0;
        $model = $this->next($curid);

        if (!$model->ID) {
            $model = $this->next(0);
        }

        $_SESSION['user.preferences.mindmap.wallpaper'] = $model->ID;

        $background_color = !empty($model->BACKGROUND_COLOR)? $model->BACKGROUND_COLOR : 'rgb(125, 156, 173)';
        $background_url = !empty($model->BACKGROUND_IMAGE)? UPLOAD_URL.'/'.$model->BACKGROUND_IMAGE : $model->BACKGROUND_URL;

        $background_image = !empty($background_url)? "url({$background_url}) repeat" : '';

        echo '<script>';
        echo '$(function() {';
        echo "$('canvas').css('background', '$background_image $background_color');";
        echo '});';
        echo '</script>';

        $mm = new MindmapModel();

        $mm->ID = $id;
        $mm->BACKGROUND_URL = $background_url;

        $mm->update();
    }

    function next($curid) {
        $model = new WallpaperModel();

        $model->whereAdd('ID_WALLPAPER_CATEGORY = 2 AND ID > '.$curid);

        $model->limit(0, 1);
        $model->find();

        $model->fetch();

        return $model;
    }
}