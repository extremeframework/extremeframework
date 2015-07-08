<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="ROBOTS" content="ALL" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="generator" content="Extreme Framework">
        <link rel="apple-touch-icon" href="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-favicon-touch')}>">
        <link rel="icon" sizes="192x192" href="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-favicon-touch')}>">
        <link rel="shortcut icon" href="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-favicon')}>">

        <{if PageHelper::isPage($single)}>
            <{$meta_title = LinkHelper::getFullPageTitle($single->ID)}>
        <{/if}>

        <title><{$meta_title|strip_tags}> <{get_theme_option('global-meta-title')}></title>

        <!-- Feeds -->
        <link rel="alternate" type="application/rss+xml" title="Page Feed" href="<{$smarty.const.APPLICATION_URL}>/feed/page.xml" />
        <link rel="alternate" type="application/rss+xml" title="Post Feed" href="<{$smarty.const.APPLICATION_URL}>/feed/post.xml" />

        <!-- Robots -->
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index,follow" />

        <!-- SEO -->
        <meta name="keywords" content="<{$meta_keywords|strip_tags}>, <{get_theme_option('global-meta-keywords')}>" />
        <meta name="description" content="<{if $meta_description}><{$meta_description|strip_tags}><{else}><{get_theme_option('default-meta-description')}><{/if}>" />
        <meta property="og:site_name" content="<{$smarty.const.ORGANIZATION_NAME}>" />
        <meta property="og:type" content="website"/>
        <meta property="og:url" content="<{$meta_url}>"/>
        <meta property="og:title" content="<{$meta_title|strip_tags}><{get_theme_option('global-meta-title')}>"/>
        <meta property="og:description" content="<{$meta_description|strip_tags}>"/>
        <meta property="og:image" content="<{$meta_image}>"/>

        <!-- Global -->
        <script type="text/javascript">
            var APPLICATION_URL = "<{$smarty.const.APPLICATION_URL}>";
            var THEME_URL = "<{$smarty.const.THEME_URL}>";
        </script>

        <link href="<{$smarty.const.THEME_URL}>/css/font-awesome.min.css" rel="stylesheet"/>
        <link href="<{$smarty.const.THEME_URL}>/css/normalize.css" rel="stylesheet"/>

        <!--[if lt IE 9]>
        <link href="<{$smarty.const.THEME_URL}>/css/foundation3.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="<{$smarty.const.THEME_URL}>/css/pleaseupdateyourbrowser.css"/>
        <![endif]-->

        <!--[if gt IE 8]>
        <!-->
        <link href="<{$smarty.const.THEME_URL}>/css/foundation.css" rel="stylesheet"/>
        <!--
        <![endif]-->

        <{if $context == "main-site"}>
            <link href="<{$smarty.const.THEME_URL}>/css/frontpage.css" rel="stylesheet"/>
        <{elseif $context == "site-section"}>
            <link href="<{$smarty.const.THEME_URL}>/css/primary.css" rel="stylesheet"/>
        <{else}>
            <link href="<{$smarty.const.THEME_URL}>/css/content.css" rel="stylesheet"/>

            <{if in_array($context, ["search", "news-single", "news-category", "news-home"]) || PageHelper::isPageOfMainSite($single)}>
                <link href="<{$smarty.const.THEME_URL}>/css/content-www-override.css" rel="stylesheet"/>
            <{/if}>

            <{if $context == "search"}>
                <link href="<{$smarty.const.THEME_URL}>/css/search.css" rel="stylesheet"/>
            <{/if}>

            <{if $context == "news-single"}>
                <link href="<{$smarty.const.THEME_URL}>/css/news.css" rel="stylesheet"/>
            <{/if}>
        <{/if}>

        <{if $context == "subsite"}>
            <link href="<{$smarty.const.THEME_URL}>/css/subsite.css" rel="stylesheet"/>
            <link href="<{$smarty.const.THEME_URL}>/css/jquery.bxslider.css" rel="stylesheet"/>
        <{/if}>

        <!--[if lt IE 9]>
        <script src="<{$smarty.const.THEME_URL}>/js/html5shiv.js" type="text/javascript"></script>
        <![endif]-->
    </head>
    <body>
        <header>
            <div class="row">
                <div class="small-9 medium-7 large-9 nine columns remove-left" id="header-logo">
                    <a href="<{$smarty.const.APPLICATION_URL}>">
                        <{if $context == "subsite" || PageHelper::isPageOfSubSite($single)}>
                            <img alt="" class="show-for-large-up" src="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-logo-small')}>"/>
                        <{/if}>
                        <img alt="" class="hide-for-large-up" id="mobile-image" src="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-logo')}>"/>
                    </a>
                </div>
                <div class="small-3 columns hide-for-large-up" id="mobile-buttons">
                    <a href="#" id="search-toggle">
                        <i class="fa fa-search">
                            &#160;
                        </i>
                    </a>
                    <a href="#" id="nav-toggle">
                        <p>Menu</p>
                        <i class="fa fa-bars">
                            &#160;
                        </i>
                    </a>
                </div>
                <div class="small-12 medium-3 large-3 three columns remove-right" id="search-form">
                    <form action="<{$smarty.const.APPLICATION_URL}>/search" method="get" title="Search...">
                        <input id="search" name="q" placeholder="Search..." title="Search..." type="text"/>
                        <button class="show-for-medium-up" id="search-button" type="submit">
                            <img alt="Submit Search" src="<{$smarty.const.THEME_URL}>/images/icon-magnifyingglass.png"/>
                        </button>
                    </form>
                </div>
            </div>
            <div id="main-navigation">
                <div class="row">
                    <{if $context == "subsite" || PageHelper::isPageOfSubSite($single)}>
                        <div class="small-12 medium-5 large-6 six columns" id="main-logo">
                            <a href="<{$smarty.const.APPLICATION_URL}>">
                                <p id="top"><{get_theme_option('site-name')}></p>
                                <p id="bottom"><{PageHelper::getSubsiteTitle($single)}></p>
                            </a>
                        </div>
                    <{else}>
                        <div class="small-12 medium-5 large-6 six columns show-for-large-up remove-left" id="main-logo">
                            <a href="<{$smarty.const.APPLICATION_URL}>"><img alt="<{get_theme_option('site-name')}>" src="<{$smarty.const.UPLOAD_URL}>/<{get_theme_option('site-logo')}>"/></a>
                        </div>
                    <{/if}>
                    <div class="small-12 medium-12 large-6 six columns remove-right" id="audience">
                        <{$links = PageHelper::getPageLinks($single, 'top-links')}>

                        <{if $links}>
                            <{foreach from=$links key=key item=item}>
                                <{if $key}><span class="divider">|</span><{/if}>
                                <a href="<{$item->SLUG}>"><{$item->TITLE}></a>
                            <{/foreach}>
                        <{elseif in_array($context, ["main-site", "site-section", "search", "news-single", "news-category", "news-home"])}>
                            <{$menus = MenuHelper::getMenuItems(get_theme_option('main-top-links'), 1)}>

                            <{foreach from=$menus.0.0 key=key item=menuitem}>
                                <{if $key}><span class="divider">|</span><{/if}>
                                <a href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a>
                            <{/foreach}>
                        <{/if}>
                    </div>
                    <nav class="remove-right small-12 medium-12 large-12 twelve columns">
                        <ul id="top-level">
                            <{$menus = MenuHelper::getMenuItems(PageHelper::getMainMenuCode($single), 2)}>

                            <{if !$menu && in_array($context, ["main-site", "search", "news-single", "news-category", "news-home"])}>
                                <{$menus = MenuHelper::getMenuItems(get_theme_option('main-menu'), 2)}>
                            <{/if}>

                            <{foreach from=$menus.0.0 key=key item=menuitem}>
                                <{$parent2 = $menuitem->ID}>
                                <{$depth2 = 1}>

                                <li>
                                    <a class="title" href="<{$menuitem->SLUG}>">
                                        <i class="fa fa-chevron-right hide-for-large-up">
                                            &#160;
                                        </i>
                                        <{$menuitem->TITLE}>
                                    </a>

                                    <{if $menus.$depth2.$parent2}>
                                        <ul class="sub-level">
                                            <{$submenus = $menus.$depth2.$parent2}>
                                            <{$count = count($submenus)}>
                                            <{$half_size = ceil($count/2)}>

                                            <{$chunks = array_chunk($submenus, $half_size)}>

                                            <{foreach from=$chunks key=key item=chunk}>
                                                <ul <{if $count > 2 && $key == 0}>class="separator"<{/if}>>
                                                    <{foreach from=$chunk item=menuitem}>
                                                        <li><a href="<{$menuitem->SLUG}>"><{$menuitem->TITLE}></a></li>
                                                    <{/foreach}>
                                                </ul>
                                            <{/foreach}>
                                        </ul>
                                    <{/if}>
                                </li>
                            <{/foreach}>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>