<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{$title = _t('Import')}>
<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{if $messages}>
<{foreach from=$messages key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<div class="section">

<{php}>
	$template->assign('guidelines', sprintf(_t('L_GUIDELINES_IMPORT'), strtolower(Admin Package Category), APPLICATION_URL.'/adminpackagecategory/export', strtolower(Admin Package Category)));
<{/php}>

<{$guidelines}>

<form action="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/import" class="form-import scope-main" method="post" enctype="multipart/form-data">

<{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
<{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>

<div class="form-row">
    <label><{_t('L_CSV_FILE_CONTAINS_DATA_ABOUT')}> <{_t('Admin Package Category')|strtolower}></label>
    <div class="form-field">
        <input type="file" name="adminpackagecategory_importfile" />
    </div>
</div>

<div class="blocker">
    <span class="button-general large"><button type="submit" value="import" class="button medium"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png"><span class="button-face"><{_t('Import')}></span></button></span>
</div>

</form>

<div class="clearer"></div>
</div>

</div>
<{include file="footer.tpl"}>