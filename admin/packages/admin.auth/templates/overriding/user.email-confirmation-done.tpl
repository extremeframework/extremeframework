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
    <span class="h"><{_t('Email confirmed')}></span>
</h1>

<p><{sprintf(_t('Your email address has been confirmed. Click <a href="%s">here</a> to login to your account.'), $smarty.const.APPLICATION_URL)}></p>

<{include file="footer.tpl"}>