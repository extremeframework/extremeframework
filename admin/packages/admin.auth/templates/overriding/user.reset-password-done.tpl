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
    <span class="h"><{_t('Password Changed')}></span>
</h1>

<p><{sprintf(_t('Your account password has been changed. Click <a href="%s">here</a> to return to the login page.'), $smarty.const.APPLICATION_URL)}></p>

<{include file="footer.tpl"}>