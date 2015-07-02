<?php
function get_theme_options_registration() {
    $groups = array();

    $groups[] = array(
        'title' => 'Site Title & Tag Line',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Site name',
                'code' => 'site-name',
                'type' => 'text'
            ),
            array(
                'title' => 'Site tag line',
                'code' => 'site-tag-line',
                'type' => 'text'
            ),
            array(
                'title' => 'Copyright notice',
                'code' => 'copyright-notice',
                'type' => 'text'
            )
        )
    );

    $groups[] = array(
        'title' => 'Logos and Favicon',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Site logo',
                'code' => 'site-logo',
                'type' => 'image'
            ),
            array(
                'title' => 'Favicon',
                'code' => 'site-favicon',
                'type' => 'image'
            ),
            array(
                'title' => 'Favicon (for touch devices)',
                'code' => 'site-favicon-touch',
                'type' => 'image'
            )
        )
    );

    $groups[] = array(
        'title' => 'SEO Settings',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Global meta title',
                'code' => 'global-meta-title',
                'type' => 'text'
            ),
            array(
                'title' => 'Global meta keywords',
                'code' => 'global-meta-keywords',
                'type' => 'text'
            ),
            array(
                'title' => 'Default meta description',
                'description' => 'A default description to be used in case there is no description specified.',
                'code' => 'default-meta-description',
                'type' => 'text'
            )
        )
    );

    $groups[] = array(
        'title' => 'Social',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Facebook URL',
                'code' => 'facebook-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Twitter URL',
                'code' => 'twitter-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Google Plus URL',
                'code' => 'google-plus-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Disqus short name',
                'code' => 'disqus_shortname',
                'type' => 'text'
            )
        )
    );

    $groups[] = array(
        'title' => 'Site Navigation',
        'options' => array(
            array(
                'title' => 'Home page',
                'description' => 'Select a page that will server as the site\'s home page',
                'code' => 'home-page',
                'type' => 'refselect',
                'options' => array('datasource' => 'PAGE', 'textcol' => 'TITLE', 'valuecol' => 'ID')
            ),
            array(
                'title' => 'Home URL',
                'description' => 'or, you can specify a static path to server as the site\'s home page',
                'code' => 'home-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Main menu',
                'code' => 'main-menu',
                'type' => 'refselect',
                'options' => array('datasource' => 'MENU', 'textcol' => 'NAME', 'valuecol' => 'CODE')
            ),
            array(
                'title' => 'Footer menu',
                'code' => 'footer-menu',
                'type' => 'refselect',
                'options' => array('datasource' => 'MENU', 'textcol' => 'NAME', 'valuecol' => 'CODE')
            )
        )
    );

    $groups[] = array(
        'title' => 'Blog',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Blog root category',
                'description' => 'This is the root category of the blog.',
                'code' => 'blog-root-category-id',
                'type' => 'refselect',
                'options' => array('datasource' => 'POST_CATEGORY', 'textcol' => 'NAME', 'valuecol' => 'ID')
            )
        )
    );

    return $groups;
}

function shortcode_product_portfolio($atts, $content = null) {
    $smarty = \Framework::getSmarty(__FILE__);

    return $smarty->fetch('shortcode.product_portfolio.tpl');
}
add_shortcode('product_portfolio', 'shortcode_product_portfolio');

function shortcode_subsection($atts, $content = null) {
    extract(shortcode_atts(array(
        'class' => '',
        'title' => '',
        'icon' => ''
    ), $atts));

    if (!empty($content)) {
        $smarty = \Framework::getSmarty(__FILE__);

        $smarty->assign('class', $class);
        $smarty->assign('title', $title);
        $smarty->assign('icon', $icon);
        $smarty->assign('content', $content);

        return $smarty->fetch('shortcode.subsection.tpl');
    }
}
add_shortcode('subsection', 'shortcode_subsection');

function shortcode_markdown($atts, $content = null) {
    if (!empty($content)) {
        return Michelf\Markdown::defaultTransform($content);
    }
}
add_shortcode('markdown', 'shortcode_markdown');

spl_autoload_register(function($class){
    $file = LIBRARY_DIR.'/external/Markdown/'.preg_replace('{\\\\|_(?!.*\\\\)}', DIRECTORY_SEPARATOR, ltrim($class, '\\')).'.php';

    if (file_exists($file)) {
        require $file;
    }
});
