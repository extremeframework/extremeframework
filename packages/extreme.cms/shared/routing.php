<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
defined('APPLICATION_DIR') OR exit();

/*/////////////////////////////////////////////////////////////////////
// Examples:

// Callback style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', function($params) {
    return 'post/view/'.$params['slug'];
});

// String style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', '/post/view/{slug}');

// Register URL rewrite styles
Route::registerUrlRewriteType('page', function($model) {
    return APPLICATION_URL.'/page/'.$model->SLUG;
});

Route::registerUrlRewriteType('page_with_date', function($model) {
    return APPLICATION_URL.'/page/'.$model->YEAR.'/'.$model->MONTH.'/'.$model->SLUG;
});

/////////////////////////////////////////////////////////////////////*/

// Controller names
Route::registerControllerNames(array(
    'menu' => 'Menu',
    'menuitem' => 'MenuItem',
    'page' => 'Page',
    'pagegallery' => 'PageGallery',
    'pagelink' => 'PageLink',
    'pagelinktype' => 'PageLinkType',
    'pagesection' => 'PageSection',
    'pagewidget' => 'PageWidget',
    'widgettype' => 'WidgetType',
    'widgetposition' => 'WidgetPosition',
    'post' => 'Post',
    'posttype' => 'PostType',
    'postcategory' => 'PostCategory',
    'postgallery' => 'PostGallery',
    'postrelation' => 'PostRelation',
    'postrelationtype' => 'PostRelationType',
    'postsection' => 'PostSection',
    'template' => 'Template'
));