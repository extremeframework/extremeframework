<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="<{if isset($meta_description)}><{$meta_description|escape}><{else}><{$smarty.const.CONFIG_APPLICATION_NAME}><{/if}>" />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index,follow" />
<link rel="alternate" type="application/rss+xml" title="RSS" href="<{$smarty.const.APPLICATION_URL}>/<{$module}>/rss">
<title><{$smarty.const.CONFIG_APPLICATION_NAME}></title>

<link rel="apple-touch-icon" sizes="57x57" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="<{$smarty.const.APPLICATION_URL}>/images/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/favicon-16x16.png">
<link rel="manifest" href="<{$smarty.const.APPLICATION_URL}>/images/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<{$smarty.const.APPLICATION_URL}>/images/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<script type="text/javascript">
var APPLICATION_URL = "<{$smarty.const.APPLICATION_URL}>";
var THEME_URL = "<{$smarty.const.THEME_URL}>";
var DATE_FORMAT = "<{$smarty.const.DATE_FORMAT}>";
var DEFAULT_CURRENCY_SYMBOL = "<{$smarty.const.DEFAULT_CURRENCY_SYMBOL}>";
var USERID = "<{md5(session_id())}>";
</script>

<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Roboto:light,italic,bold"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Rouge+Script"/>
<link rel="stylesheet" type="text/css" href="<{$smarty.const.APPLICATION_URL}>/css/apps4clouds.header.css" media="all"/>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/apps4clouds.header.js"></script>

<{plugin key="generic_head" args=""}>
<{plugin key="<{$module}>_head" args=""}>