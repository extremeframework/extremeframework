<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{$title = $smarty.const.L_IMPORT}>
<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{if isset($messages.adminorder) }>
<{foreach from=$messages.adminorder key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<div class="section">

<{php}>
	$template->assign('guidelines', sprintf(L_GUIDELINES_IMPORT, strtolower(L_ADMIN_ORDER), APPLICATION_URL.'/adminorder/export', strtolower(L_ADMIN_ORDER)));
<{/php}>

<{$guidelines}>

<form action="<{$smarty.const.APPLICATION_URL}>/adminorder/import" class="form-import scope-main" method="post" enctype="multipart/form-data">

<{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
<{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>

<div class="form-row">
    <label><{label key="L_CSV_FILE_CONTAINS_DATA_ABOUT"}> <{$smarty.const.L_ADMIN_ORDER|strtolower}></label>
    <div class="form-field">
        <input type="file" name="adminorder_importfile" />
    </div>
</div>

<div class="blocker">
    <span class="button-general large"><button type="submit" value="import" class="button medium"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png"><span class="button-face"><{label key="L_BTN_IMPORT"}></span></button></span>
</div>

</form>

<div class="clearer"></div>
</div>

</div>
<{include file="footer.tpl"}>