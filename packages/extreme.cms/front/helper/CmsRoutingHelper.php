<?php
class CmsRoutingHelper {
    static function translate($slug) {
        $page_slugs = self::loadPageSlugs();
        $flip = array_flip($page_slugs);

        if (isset($flip[$slug])) {
            $id = $flip[$slug];

            $p = 'page/view/'.$id;
        } else {
            $category_slugs = self::loadCategorySlugs();
            $flip = array_flip($category_slugs);

            if (isset($flip[$slug])) {
                $id = $flip[$slug];

                $p = 'postcategory/view/'.$id;
            } else {
                $p = 'post/view/'.$slug;
            }
        }

        return $p;
    }

    static function loadPages($reload = false) {
        $cachekey = 'front.pages';

        if (!Cache::has($cachekey) || $reload) {
            $model = new PageModel();

            $model->selectAdd();
            $model->selectAdd('ID, TITLE, SLUG, HIERACHY');

            $model->find();

            $pages = array();
            while ($model->fetch()) {
                $page = new stdClass();

                $page->ID = $model->ID;
                $page->HIERACHY = $model->HIERACHY;
                $page->SLUG = $model->SLUG;
                $page->TITLE = $model->TITLE;

                $pages[$model->ID] = $page;
            }

            // Cache
            Cache::set($cachekey, $pages);
        }

        return Cache::get($cachekey);
    }

    static function loadPageSlugs() {
        $cachekey = 'front.page_slugs';

        if (!Cache::has($cachekey)) {
            // Page
            $pages = self::loadPages();

            // Page slugs
            $page_slugs = array();

            foreach ($pages as $page) {
                $fullslug = self::getFullPageSlug($page->ID);

                $page_slugs[$page->ID] = $fullslug;
            }

            // Cache
            Cache::set($cachekey, $page_slugs);
        }

        return Cache::get($cachekey);
    }

    static function getFullPageSlug($pageid) {
        self::getFullPageSlugAndTitle($pageid, $fullslug, $fulltitle);

        return $fullslug;
    }

    static function getFullPageTitle($pageid) {
        self::getFullPageSlugAndTitle($pageid, $fullslug, $fulltitle);

        return $fulltitle;
    }

    static function getFullPageSlugAndTitle($pageid, &$fullslug, &$fulltitle) {
        $fullslug = '';
        $fulltitle = '';

        $pages = self::loadPages();

        if (!isset($pages[$pageid])) {
            $pages = self::loadPages(true);

            if (!isset($pages[$pageid])) {
                return;
            }
        }

        $page = $pages[$pageid];
        $parentids = explode('-', trim($page->HIERACHY, '-'));
        $parentids[] = $pageid;

        $slugs = array();
        $titles = array();

        foreach ($parentids as $parentid) {
            if ($parentid > 0) {
                if (isset($pages[$parentid])) {
                    $parent = $pages[$parentid];

                    $slugs[] = $parent->SLUG;
                    $titles[] = $parent->TITLE;
                } else {
                    echo("Page not found (id = $parentid)");
                }
            }
        }

        $fullslug = implode('/', $slugs);
        $fulltitle = implode(' | ', array_reverse($titles));
    }

    static function loadCategorySlugs() {
        $cachekey = 'front.category_slugs';

        if (!Cache::has($cachekey)) {
            // Categories
            $categorys = self::loadCategories();

            // Category slugs
            $category_slugs = array();

            foreach ($categorys as $category) {
                $category_slugs[$category->ID] = $category->SLUG;
            }

            // Cache
            Cache::set($cachekey, $category_slugs);
        }

        return Cache::get($cachekey);
    }

    static function loadCategories() {
        $cachekey = 'front.categories';

        if (!Cache::has($cachekey)) {
            $model = new PostCategoryModel();
            $model->find();

            $categories = array();
            while ($model->fetch()) {
                $category = new stdClass();

                $category->ID = $model->ID;
                $category->HIERACHY = $model->HIERACHY;
                $category->SLUG = $model->SLUG;

                $categories[$model->ID] = $category;
            }

            // x. Cache
            Cache::set($cachekey, $categories);
        }

        return Cache::get($cachekey);
    }
}