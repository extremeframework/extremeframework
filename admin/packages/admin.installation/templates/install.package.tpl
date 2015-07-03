<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl"}>

<{if $type == 'package'}>
    <{$title = 'Install a Package'}>
<{elseif $type == 'plugin'}>
    <{$title = 'Install a Plugin'}>
<{elseif $type == 'theme'}>
    <{$title = 'Install a Theme'}>
<{/if}>

<h1 class="heading"><span class="h"><{label text=$title}></span></h1>

<{if $messages.installation}>
    <ul>
        <{foreach from=$messages.installation key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<form id="installationform" action="<{$smarty.const.APPLICATION_URL}>/installation/install" method="post" enctype="multipart/form-data">
    <input type="hidden" name="type" value="<{$type}>"/>

    <div class="form-row">
        <div class="form-field">
            <input type="file" name="installation_file">
        </div>
    </div>

    <div class="button-general button-install">
        <a class="button-install" onclick="$('#installationform').submit();return false;"><span class="button-face">Install</span></a>
    </div>

    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/installation/">Back</a>
</form>

<{include file="footer.tpl"}>