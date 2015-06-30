<?php
/*/////////////////////////////////////////////////////////////////////
// Examples:

// Callback style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', function($params) {
    return 'post/view/'.$params['slug'];
});

// String style
Route::register('blog/{year|[0-9]+}/{month|[0-9]+}/{slug|.*}', '/post/view/{slug}');

/////////////////////////////////////////////////////////////////////*/
Route::registerControllerNames(array(

));