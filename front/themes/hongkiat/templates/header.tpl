<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="generator" content="Extreme Framework">
    <link rel="shortcut icon" href="<{$smarty.const.APPLICATION_URL}>/uploads/favicon.png">

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

    <!-- Theme -->
    <link rel="shortcut icon" href="<{$smarty.const.THEME_URL}>/images/favicon.ico" />
    <link rel="stylesheet" href="<{$smarty.const.THEME_URL}>/css/style.css">
    <link href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic|Roboto:400,500" rel="stylesheet" type="text/css">

    <!--[if lt IE 9]>
    <link rel="stylesheet" href="<{$smarty.const.THEME_URL}>/css/ie.css">
    <![endif]-->

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body class="blog <{$bodyclass}>">
    <div id="mhead" class="mobile-header slideable clearfix">
        <div id="panel-left" class="nav-icon left">
            <span>&#59394;</span>
        </div>
        <div id="mlogo">
            <a href="<{$smarty.const.APPLICATION_URL}>">
                <span><{get_theme_option('site-name')}></span>
            </a>
        </div>
    </div>
    <header id="masthead" class="site-header clearfix" role="banner">
        <div class="container">
            <div class="sizer">
                <div class="site-branding clearfix left">
                    <h1 class="logo">
                        <a href="<{$smarty.const.APPLICATION_URL}>">
                            <span><{get_theme_option('site-name')}></span>
                        </a>
                    </h1>
                </div>
                <div class="ads right">
                    <div class="adunit" data-adunit="desktop-page-header-728x90" data-dimensions="728x90"></div>
                </div>
            </div>
        </div>
    </header>

    <{include file="menu.tpl"}>

    <main id="main" class="slideable">
        <div id="content" class="site-content clearfix">