<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class SitemapController {
    function xmlAction() {
        $urls = array();

        // x. Page
        $model = new PageModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array('loc' => LinkHelper::friendly_link('page', $model->SLUG, $model->ID), 'lastmod' => $model->LATEST_UPDATE);
        }

        // x. Post
        $model = new PostModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array('loc' => LinkHelper::friendly_link('post', $model->SLUG, $model->ID), 'lastmod' => $model->LATEST_UPDATE);
        }

        // x. Blog
        $model = new BlogModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array('loc' => LinkHelper::friendly_link('blog', $model->SLUG, $model->ID), 'lastmod' => $model->LATEST_UPDATE);
        }

		header("Content-Type: text/xml; charset=UTF-8", true);

        echo '<?xml version="1.0" encoding="UTF-8"?>'."\r\n";
        echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">'."\r\n";

        foreach ($urls as $url) {
            echo "\t".'<url>'."\r\n";
            echo "\t\t".'<loc>'.$url['loc'].'</loc>'."\r\n";
            echo "\t\t".'<changefreq>daily</changefreq>'."\r\n";
            echo "\t\t".'<lastmod>'.$url['lastmod'].'</lastmod>'."\r\n";
            echo "\t".'</url>'."\r\n";
        }

        echo '</urlset>'."\r\n";
    }
}