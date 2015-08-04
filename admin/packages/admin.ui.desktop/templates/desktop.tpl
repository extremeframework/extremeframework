<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl" hide_horizontal_menu=true}>

<style>
#desktop li {
    float: left;
    margin: 20px 10px;
    border: 1px solid transparent;
    width: 80px;
    padding: 5px;
    border-radius: 5px;
}

#desktop li .icon {
    width: 60px;
    height: 60px;
}

#desktop li a {
    text-decoration: none;
}

#desktop li:hover {
    border: 1px solid #BFBFBF;
    cursor: pointer;
    border: 1px solid #BFBFBF;
    box-shadow: 0px 0px 5px #048497;
}

#desktop li:hover img {
    position: relative;
    top: -1px;
    right: -1px;
}

#desktop li img {
    display: block;
    width: 60px;
}
</style>

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
                    <img src="http://t0.gstatic.com/images?q=tbn:ANd9GcTbFd43VBnyydy5yHII5Er2xLt9jtjZBkti4fNHzpTEx9gBWvJR"/>
                </div>
                <span><{_t('Installation')}></span>
            </a>
        </li>
    </ul>
    <div style="clear:both"></div>
</div>

<{include file="footer.tpl"}>