<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
class FeedController {
    function pageAction() {
        $urls = array();

        $model = new PageModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array(
                'title' => $model->TITLE,
                'link' => LinkHelper::friendly_link('page', $model->SLUG, $model->ID),
                'creator' => APPLICATION_NAME,
                'pubDate' => $model->LATEST_UPDATE,
                'description' => $model->INTRODUCTION.' '.$model->CONTENT.' '.$model->FOOTER
            );
        }

        $this->output_feed($urls, APPLICATION_URL.'/feed/page.xml');
    }

    function postAction() {
        $urls = array();

        $model = new PostModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array(
                'title' => $model->TITLE,
                'link' => LinkHelper::friendly_link('post', $model->SLUG, $model->ID),
                'creator' => APPLICATION_NAME,
                'pubDate' => $model->LATEST_UPDATE,
                'description' => $model->DESCRIPTION.' '.$model->CONTENT
            );
        }

        $this->output_feed($urls, APPLICATION_URL.'/feed/post.xml');
    }

    function blogAction() {
        $urls = array();

        $model = new BlogModel();
        $model->find();
        while ($model->fetch()) {
            $urls[] = array(
                'title' => $model->TITLE,
                'link' => LinkHelper::friendly_link('blog', $model->SLUG, $model->ID),
                'creator' => APPLICATION_NAME,
                'pubDate' => $model->LATEST_UPDATE,
                'description' => $model->DESCRIPTION.' '.$model->CONTENT
            );
        }

        $this->output_feed($urls, APPLICATION_URL.'/feed/blog.xml');
    }

    function output_feed($urls, $atomlink) {
		header("Content-Type: text/xml; charset=UTF-8", true);

        echo '<?xml version="1.0" encoding="UTF-8"?>'."\r\n";
        echo '<rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" version="2.0">'."\r\n";
        echo '<channel>'."\r\n";
        echo '<title>'.APPLICATION_NAME.'</title>'."\r\n";
        echo '<atom:link href="'.$atomlink.'" rel="self" type="application/rss+xml"/>'."\r\n";
        echo '<link>'.APPLICATION_URL.'</link>'."\r\n";
        echo '<description>'.APPLICATION_NAME.'</description>'."\r\n";
        echo '<lastBuildDate>Mon, 19 Jan 2015 12:06:48 +0000</lastBuildDate>'."\r\n";
        echo '<sy:updatePeriod>hourly</sy:updatePeriod>'."\r\n";
        echo '<sy:updateFrequency>1</sy:updateFrequency>'."\r\n";
        echo '<generator>http://www.extremeframework.com</generator>'."\r\n";

        foreach ($urls as $url) {
            echo "\t".'<item>'."\r\n";
            echo "\t\t".'<title><![CDATA['.$url['title'].']]></title>'."\r\n";
            echo "\t\t".'<link>'.$url['link'].'</link>'."\r\n";
            echo "\t\t".'<dc:creator><![CDATA['.$url['creator'].']]></dc:creator>'."\r\n";
            echo "\t\t".'<pubDate>'.$url['pubDate'].'</pubDate>'."\r\n";
            echo "\t\t".'<description><![CDATA['.$url['description'].']]></description>'."\r\n";

            echo "\t".'</item>'."\r\n";
        }

        echo '</channel>'."\r\n";
        echo '</rss>'."\r\n";
    }
}