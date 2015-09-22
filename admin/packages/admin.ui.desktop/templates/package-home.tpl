<{include file="header.tpl"}>

</head>
<body>

<{include file="top.tpl"}>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{_t($package->NAME)}></span>
</h1>

<style>
#package-home-tabs.ui-tabs .ui-tabs-panel {
    background-color: #fff!important;
}
#package-home-tabs .ui-widget-header .ui-state-default {
    background-color: #fff;
    border-radius: 0;
}
#package-home-tabs .ui-widget-header .ui-state-active {
    background-color: #0081C6;
    border-radius: 0;
}
body.fullscreen #tab-dashboard {
	position: fixed!important;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}	
</style>

<div id="package-home-tabs" style="display:none">
    <ul>
        <li><a href="#tab-dashboard"><{_t('Dashboard')}></a></li>
        <li><a href="#tab-data"><{_t('Data')}></a></li>
    </ul>

    <div id="tab-dashboard" style="position:relative">
		<{module class="DashboardRestaurantPOS"}>
    </div>

    <div id="tab-data">
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
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
        	$("#package-home-tabs").tabs({}).show();
        });
    </script>
</div>

<{include file="footer.tpl"}>