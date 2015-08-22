<{include file="header.tpl"}>

</head>
<body class="welcome-page">

<{include file="top.tpl" hide_horizontal_menu=true}>

<style>
body.welcome-page {
    background-color: #F4F4F4;
}
body.welcome-page .horizontal-menu {
    background: url("<{$smarty.const.APPLICATION_URL}>/images/bg-noise.png") repeat left top;
}
.dashboard {
    text-align: center;
}
.dashboard .heading-title {
    font-size: 42px;
    margin-top: 20px;
    text-shadow: none;
    margin: 30px 0;
    line-height: 40px;
    font-weight: 200;
    color: #597b8c;
}
.dashboard .heading-subtitle {
    font-size: 22px;
    line-height: 32px;
    font-weight: 400;
}
.dashboard .blocks li {
    display: inline-block;
    position: relative;
    width: 250px;
    margin: 40px 15px 15px 15px;
    background-color: #fff;
    overflow: hidden;
    border-radius: 5px;
    border: 1px solid #cdd1d3;
    padding: 10px 0 20px 0;
}
.dashboard .blocks li:hover {
    border-color: #F4F4F4;
    transition: all 300ms;
    transform: translate3d(0,-2px,0);
}
.dashboard a {
    text-decoration: none;
}
.dashboard .blocks li h2 {
    margin: 30px 0 15px 0;
    color: #24c6c1;
    font-size: 20px;
}
.dashboard .blocks li .icon {
    padding: 10px 0 20px 0;
    cursor: pointer;
}
.dashboard .blocks li .icon img {
    height: 100px;
    max-width: 100%;
}
.divider-text {
    position: relative;
    display: block;
    overflow: hidden;
    width: 30%;
    text-align: center;
    text-transform: lowercase;
    color: #b7bdc0;
    margin: 24px auto;
}
.divider-text:before,
.divider-text:after {
    content: "";
    position: absolute;
    top: 50%;
    width: 50%;
    display: block;
    height: 0;
    padding: 0;
    border: none;
    border-bottom: 1px solid #cdd1d3;
}
.divider-text:before {
    left: 0;
    margin-left: -1em;
}
.divider-text:after {
    right: 0;
    margin-right: -1em;
}
.dashboard .links a {
    text-decoration: none;
    color: #54C7C3;
    cursor: pointer;
    font-size: 16px;
}
</style>

<div class="dashboard">
    <h1 class="heading-title"><{_($dashboard->TITLE)}></h1>
    <{if $dashboard->SUBTITLE}>
        <h2 class="heading-subtitle"><{_($dashboard->SUBTITLE)}></h2>
    <{/if}>

    <{if $blockitems}>
        <ul class="blocks">
            <{foreach from=$blockitems item=item}>
                <{if $item->ID_DASHBOARD_ITEM_TYPE == 'block'}>
                    <li>
                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/<{$item->PATH}>">
                            <h2><{_($item->TITLE)}></h2>
                            <div class="icon">
                                <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
                            </div>
                        </a>
                    </li>
                <{/if}>
            <{/foreach}>
        </ul>
        <div style="clear:both"></div>
    <{/if}>

    <{if $linkitems}>
        <div class="divider-text"><{_('or')}></div>
        <ul class="links">
            <{foreach from=$linkitems item=item}>
                <li>
                    <a href="<{$smarty.const.APPLICATION_URL}>/<{$item->PATH}>">
                        <{_($item->TITLE)}>
                    </a>
                </li>
            <{/foreach}>
        </div>
    <{/if}>
</div>

<{include file="footer.tpl"}>