<?php
spl_autoload_register(function($class){
    $file = LIBRARY_DIR.'/external/Markdown/'.preg_replace('{\\\\|_(?!.*\\\\)}', DIRECTORY_SEPARATOR, ltrim($class, '\\')).'.php';

    if (file_exists($file)) {
        require $file;
    }
});

function smarty_modifier_markdown($text) {
    if (!empty($text)) {
        $text = Michelf\Markdown::defaultTransform($text);

        $text = smarty_modifier_markdown_page_links($text);

        return $text;
    }
}


function smarty_modifier_markdown_page_links($text) {
    $text = preg_replace_callback(
        '/\[([^\]\|]*)\|?([a-z0-9\-]+)?([^\]]*)?\]/',
        function ($matches) {
            $title = $matches[1];
            $slug = isset($matches[2])? $matches[2] : '';
            $segment = isset($matches[3])? $matches[3] : '';

            if (empty($slug)) {
                $slug = smarty_modifier_markdown_page_links_build_slug($title);
            }

            return '<a href="'.APPLICATION_URL.'/'.$slug.($segment? $segment : '/').'" class="reference internal">'.$title.'</a>';
        },
        $text
    );

    return $text;
}

function smarty_modifier_markdown_page_links_build_slug($str) {
    $str = strtolower($str);

    $str = preg_replace('/<(?:.|\n)*?>/ism', '', $str);
    $str = preg_replace('/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|_/is', 'a', $str);
    $str = preg_replace('/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/is', 'e', $str);
    $str = preg_replace('/ì|í|ị|ỉ|ĩ/is', 'i', $str);
    $str = preg_replace('/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/is', 'o', $str);
    $str = preg_replace('/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/is', 'u', $str);
    $str = preg_replace('/ỳ|ý|ỵ|ỷ|ỹ/is', 'y', $str);
    $str = preg_replace('/đ/is', 'd', $str);
    $str = preg_replace('/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\'|\"|\&|\#|\[|\]|~|$|_/is', '-', $str);
    $str = preg_replace('/-+-/is', '-', $str);
    $str = preg_replace('/^\-+|\-+$/is', '', $str);

    return $str;
}
