<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><{_t($package->NAME)}></span>
</h1>

<div id="desktop">
    <ul>
        <{foreach from=$shortcuts item=item}>
            <li>
                <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/<{$item->PATH}>">
                    <div class="icon">
                        <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>"/>
                    </div>
                    <span><{_t($item->NAME)}></span>
                </a>
            </li>
        <{/foreach}>
    </ul>
    <div style="clear:both"></div>
</div>

<{include file="footer.tpl"}>