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