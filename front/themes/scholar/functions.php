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
                'title' => 'Site logo (small version)',
                'code' => 'site-logo-small',
                'type' => 'image'
            ),
            array(
                'title' => 'Footer site logo',
                'description' => 'This logo will be shown in the site footer',
                'code' => 'site-logo-footer',
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
        'title' => 'Organization information',
        'description' => '',
        'options' => array(
            array(
                'title' => 'Organization name',
                'code' => 'organization-name',
                'type' => 'text'
            ),
            array(
                'title' => 'Organization address',
                'code' => 'organization-address',
                'type' => 'text'
            ),
            array(
                'title' => 'Organization phone',
                'code' => 'organization-phone',
                'type' => 'text'
            ),
            array(
                'title' => 'Organization contact URL',
                'code' => 'organization-contact-url',
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
                'title' => 'YouTube URL',
                'code' => 'youtube-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Flickr URL',
                'code' => 'flickr-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Pinterest URL',
                'code' => 'pinterest-url',
                'type' => 'text'
            ),
            array(
                'title' => 'Linkedin URL',
                'code' => 'linkedin-url',
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
                'title' => 'Main top links',
                'description' => 'These links will be shown in the top right of the screen',
                'code' => 'main-top-links',
                'type' => 'refselect',
                'options' => array('datasource' => 'MENU', 'textcol' => 'NAME', 'valuecol' => 'CODE')
            ),
            array(
                'title' => 'Footer menu',
                'code' => 'footer-menu',
                'type' => 'refselect',
                'options' => array('datasource' => 'MENU', 'textcol' => 'NAME', 'valuecol' => 'CODE')
            ),
            array(
                'title' => 'Footer links',
                'description' => 'These links will be shown at the bottom of the screen',
                'code' => 'footer-links',
                'type' => 'refselect',
                'options' => array('datasource' => 'MENU', 'textcol' => 'NAME', 'valuecol' => 'CODE')
            )
        )
    );

    $groups[] = array(
        'title' => 'News Section',
        'description' => '',
        'options' => array(
            array(
                'title' => 'News root category',
                'description' => 'This is the root category for the site\'s news section.',
                'code' => 'news-root-category-id',
                'type' => 'refselect',
                'options' => array('datasource' => 'POST_CATEGORY', 'textcol' => 'NAME', 'valuecol' => 'ID')
            ),
            array(
                'title' => 'Global news footer',
                'description' => 'These text will be shown in the bottom of each news article.',
                'code' => 'global-news-footer',
                'type' => 'html'
            )
        )
    );

    return $groups;
}

function shortcode_news_blocks($atts, $content = null) {
    extract(shortcode_atts(array(
        'slugs' => ''
    ), $atts));

    $slugs = preg_split('/\s*,\s*/', $slugs);

    if (empty($slugs)) {
        return;
    }

    $posts = PostHelper::getPostsBySlugs($slugs);

    $smarty = Framework::getSmarty(__FILE__);

    $smarty->assign('posts', $posts);

    return $smarty->fetch('shortcode.news_blocks.tpl');
}
add_shortcode('news_blocks', 'shortcode_news_blocks');

function shortcode_news_list($atts, $content = null) {
    extract(shortcode_atts(array(
        'category' => '',
        'limit' => 10
    ), $atts));

    if (empty($category)) {
        die("<div style=\"color:orange\">[ERROR::shortcode::news_list] Parameter 'category' is required.</div>");
    }

    $posts = PostHelper::getLatestPosts($category, $limit);

    $smarty = Framework::getSmarty(__FILE__);

    $smarty->assign('category', $category);
    $smarty->assign('limit', $limit);
    $smarty->assign('posts', $posts);

    return $smarty->fetch('shortcode.news_list.tpl');
}
add_shortcode('news_list', 'shortcode_news_list');

function shortcode_news_list_small($atts, $content = null) {
    extract(shortcode_atts(array(
        'category' => '',
        'limit' => 5
    ), $atts));

    if (empty($category)) {
        die("<div style=\"color:orange\">[ERROR::shortcode::news_list_small] Parameter 'category' is required.</div>");
    }

    $posts = PostHelper::getLatestPosts($category, $limit);

    $smarty = Framework::getSmarty(__FILE__);

    $smarty->assign('category_id', $category);
    $smarty->assign('posts', $posts);

    return $smarty->fetch('shortcode.news_list_small.tpl');
}
add_shortcode('news_list_small', 'shortcode_news_list_small');

function shortcode_toggle($atts, $content = null) {
    extract(shortcode_atts(array(
        'header' => ''
    ), $atts));

    if (empty($header)) {
        die("<div style=\"color:orange\">[ERROR::shortcode::toggle] Parameter 'header' is required.</div>");
    }

    $smarty = Framework::getSmarty(__FILE__);

    $smarty->assign('header', $header);
    $smarty->assign('content', $content);

    return $smarty->fetch('shortcode.toggle.tpl');
}
add_shortcode('toggle', 'shortcode_toggle');