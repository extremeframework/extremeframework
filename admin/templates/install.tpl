<{include file="header.tpl"}>

</head>
<body>

<{$title = "Install Application Modules"}>

<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<{foreach from=$messages.installation key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>

<form id="installationform" action="<{$smarty.const.APPLICATION_URL}>/installation/install" method="post" enctype="multipart/form-data">

<div class="form-row">
    <div class="form-field">
        <input type="file" name="installation_file">
    </div>
</div>

<div class="button-general button-install">
    <a class="button-install" onclick="$('#installationform').submit();return false;"><span class="button-face">Install</span></a>
</div>

</form>

<{include file="footer.tpl"}>