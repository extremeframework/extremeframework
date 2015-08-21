<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl" hide_horizontal_menu=true}>

<div id="desktop">
    <ul>
        <{foreach from=$packages item=item}>
            <li>
                <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/desktop/package/<{$item->UUID}>">
                    <div class="icon">
                        <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
                    </div>
                    <span><{_t($item->NAME)}></span>
                </a>
            </li>
        <{/foreach}>
        <li>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/installation/userpackages">
                <div class="icon">
                    <img src="<{$smarty.const.APPLICATION_URL}>/images/icon-installation.png"/>
                </div>
                <span><{_t('Installation')}></span>
            </a>
        </li>
    </ul>
    <div style="clear:both"></div>
</div>

<{include file="footer.tpl"}>