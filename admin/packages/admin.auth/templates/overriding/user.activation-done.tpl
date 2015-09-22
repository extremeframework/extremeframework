<{include file="header.tpl"}>
<style>
.module.center .content-inner {
    margin: auto;
    padding: 0 20px;
    max-width: 620px;
}
</style>
</head>
<body class="module center">

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{_t('Account activated')}></span>
</h1>

<p><{sprintf(_t('Your account has been activated. Click <a href="%s">here</a> to return to the login page.'), $smarty.const.APPLICATION_URL)}></p>

<{include file="footer.tpl"}>