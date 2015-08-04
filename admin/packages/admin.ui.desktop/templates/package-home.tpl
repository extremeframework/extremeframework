<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl"}>

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