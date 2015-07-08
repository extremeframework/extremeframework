<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl"}>

<{if $type == 'package'}>
    <{$title = 'package'}>
<{elseif $type == 'plugin'}>
    <{$title = 'plugin'}>
<{elseif $type == 'theme'}>
    <{$title = 'theme'}>
<{/if}>

<h1 class="heading"><span class="h">Install a <{label text=$title format="ucfirst"}></span></h1>

<p>If you have a <{$title}> in a .zip format, you may install it by uploading it here.</p>

<{if $messages.installation}>
    <ul class="message" style="margin:0 0 10px 0;padding:0">
        <{foreach from=$messages.installation key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<form id="installationform" class="scope-main" action="<{$smarty.const.APPLICATION_URL}>/installation/install" method="post" enctype="multipart/form-data">
    <input type="hidden" name="type" value="<{$type}>"/>

    <div class="form-row">
        <div class="form-field">
            <input type="file" name="installation_file">
        </div>
    </div>

    <div class="button-general button-save btn btn-success" style="margin: 3px;">
        <a class="button-install" onclick="$('#installationform').submit();return false;"><span class="button-face">Install</span></a>
    </div>

    <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/installation/">Back</a>
</form>

<{include file="footer.tpl"}>