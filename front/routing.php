<?php
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

));