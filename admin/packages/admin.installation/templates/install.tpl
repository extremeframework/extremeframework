<{include file="header.tpl"}>

</head>
<body>

<{$title = "Installation"}>

<{include file="top.tpl"}>

<h1 class="heading"><span class="h"><{$title}></span></h1>

<div class="btn button-general" style="margin:5px 0;clear:both;width:120px;">
    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/installation/package"><span class="button-face">Install a package</span></a>
</div>

<div class="btn button-general" style="margin:5px 0;clear:both;width:120px;">
    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/installation/theme"><span class="button-face">Install a theme</span></a>
</div>

<div class="btn button-general" style="margin:5px 0;clear:both;width:120px;">
    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/installation/plugin"><span class="button-face">Install a plugin</span></a>
</div>

<{include file="footer.tpl"}>