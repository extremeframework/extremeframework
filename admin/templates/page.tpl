<{include file="header.tpl"}>
<title><{$page->TITLE}></title>
<style>
.body-page {
    background-color: #5A89D5!important;
    color: #fff;
}
.body-page a {
    color: #fff;
    text-decoration: underline;
}
.page {
    margin: 80px auto;
    max-width: 450px;
}
.page h1 {
    margin: 15px 0;
    line-height: 1.4;
    font-size: 28px;
}
.page h2,
.page h3 {
    border-bottom: 1px solid #ebebeb;
    font: 400 24px/32px Roboto,sans-serif;
    letter-spacing: -.01em;
    margin: 40px 0 20px;
    padding-bottom: 3px;
}
.page h4 {
    font-weight: bold;
    font-size: 14px;
    line-height: 18px;
}
.page blockquote {
    font-size: 14px;
    border-left: 5px solid orange;
    padding-left: 5px!important;
    padding-top: 11px!important;
    margin: 10px 0!important;
}
.body-page #container {
    margin: 20px!important;
}
</style>
</head>

<body id="signin" class="body-page">

<{include file="top-nomenu.tpl"}>

<div class="topbar">
    <a class="name" href="<{$smarty.const.APPLICATION_URL}>"><{$smarty.const.CONFIG_APPLICATION_NAME}></a>

    <div class="locales">
        <i class="fa fa-globe"></i>
        <a class="show-modal" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/quickSelect">
            <span><{_t('Change display language')}></span>
            <b class="caret"></b>
        </a>
    </div>
</div>

<div class="page">
    <h1><{$page->TITLE}></h1>

    <{$page->CONTENT}>
</div>

<{include file="footer.tpl"}>