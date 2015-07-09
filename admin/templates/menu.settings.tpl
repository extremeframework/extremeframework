<{if isset($smarty.session.user) }>
    <style>
    .sidebar .ui-accordion-header {
        margin-top: 10px;
        padding: 10px 5px 10px 25px;

        color: #2b2b2b;
        border-radius: 0px;

        background-color: #f5f5f5;
        background-image: -moz-linear-gradient(top, #f6f6f6, #f3f3f4);
        background-image: -ms-linear-gradient(top, #f6f6f6, #f3f3f4);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f6f6f6), to(#f3f3f4));
        background-image: -webkit-linear-gradient(top, #f6f6f6, #f3f3f4);
        background-image: -o-linear-gradient(top, #f6f6f6, #f3f3f4);
        background-image: linear-gradient(top, #f6f6f6, #f3f3f4);
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#f3f3f4', GradientType=0);
        border-color: #f3f3f4 #f3f3f4 #cbcbcf;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        text-shadow: 0px 1px #ffffff;
        border-top: 1px solid #dddddd;
        border-bottom: 1px solid #dddddd;
        cursor: pointer;
        text-decoration: none !important;
    }

    .sidebar .ui-accordion-header:first-child {
        margin-top: 0px;
    }

    .sidebar .ui-accordion-content {
        border-radius: 0px;
        background: #ffffff;
        border: 1px solid #dddddd;
        border-top: none;
        padding: 0px;
        overflow: hidden;
    }

    .sidebar .ui-icon-triangle-1-e {
        background: url(<{$smarty.const.APPLICATION_URL}>/images/accordion-right-arrow.png) no-repeat center;
    }

    .sidebar .ui-icon-triangle-1-s {
        background: url(<{$smarty.const.APPLICATION_URL}>/images/accordion-down-arrow.png) no-repeat center;
    }

    .sidebar .ui-accordion-content ul {
        list-style: none;
    }

    .sidebar .ui-accordion-content ul li {
        padding: 10px 5px 10px 10px;
        border-bottom: 1px solid #FFFFFF;
        border-top: 1px solid #DFDFDF;
    }

    .sidebar .ui-accordion-content ul li:first-child {
        border-top: none;
    }

    .sidebar .ui-accordion-content ul li:hover {
        background: #eeeff2;
    }

    .sidebar .ui-accordion-content ul li a {
        text-decoration: none;
        color: #444444!important;
    }
    </style>

    <{$groups = AdminMenuHelper::getSettingsMenuItemsAsGroups()}>

    <div id="navigation" class="hidden-print" style="background-color:transparent; border: 0px;">
        <div class="accordion sidebar">
            <{foreach from=$groups key=groupname item=items}>
                <h3><{$groupname}></h3>
                <div>
                    <ul>
                        <{foreach from=$items item=menuitem}>
                            <li class="menu-<{$menuitem->MODULE}><{if isset($module) && $menuitem->MODULE == $module || $menuitem->ID == $parentmenu}> current<{/if}>">
                                <a class="menulink menulink-<{$menuitem->MODULE}> <{if !$menuitem->OPEN_IN_NEW_WINDOW}>scope-main<{/if}>" href="<{$menuitem->LINK}>?context=<{$smarty.request.context}>" <{if $menuitem->OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}>><{_t($menuitem->NAME)}></a>
                            </li>
                        <{/foreach}>
                    </ul>
                </div>
            <{/foreach}>
        </div>
    </div>

	<script type="text/javascript">
    	$(function(){
            $('.accordion').accordion();
    	});
    </script>

	<script type="text/javascript">
    	$(function(){
    		// Navigation toggler
    		$('.navigation-toggler').off('click').on('click', function(){
                $('body').toggleClass('left-side-complete-collapsed');
    		});
    	});
    </script>
<{/if}>