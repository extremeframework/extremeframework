<div class="horizontal-menu">
    <style>
    .horizontal-menu {
        background-color: #1bc2a2;
    }
    .horizontal-menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
        background: #1bc2a2;
        z-index: 1;
    }

    .horizontal-menu ul li {
        display: block;
        position: relative;
        float: left;
        background: #1bc2a2;
    }

    .horizontal-menu li ul {
        display: none;
    }

    .horizontal-menu ul li a {
        display: block;
        padding: 8px;
        text-decoration: none;
        white-space: nowrap;
        color: #fff;
    }

    .horizontal-menu ul li ul li {
        color:black;
    }

    .horizontal-menu ul li ul li a {
        padding: 8px 10px;
        border-top: 1px dashed #9EEB62;
    }

    .horizontal-menu > ul > li > a {
        text-transform: uppercase;
    }

    .horizontal-menu li:hover > ul {
        display: block;
        position: absolute;
    }

    .horizontal-menu li:hover li {
        float: none;
    }

    .horizontal-menu li:hover a {
        background: #1BC2A2;
    }

    .main-navigation li ul li {
        border-top: 0;
    }

    .horizontal-menu ul ul ul {
        left: 100%;
        top: 0;
    }

    .horizontal-menu ul:before,
    .horizontal-menu ul:after {
        content: " ";
        display: table;
    }

    .horizontal-menu ul:after {
        clear: both;
    }

    .breadcrumbx {
    	display: inline-block;
    	box-shadow: -22px 0px 15px 0px rgba(0, 0, 0, 0.35);
    	overflow: hidden;
        float: left;
    }

    .breadcrumbx a {
    	text-decoration: none;
    	outline: none;
    	display: block;
    	float: left;
    	font-size: 12px;
    	line-height: 36px;
    	color: white;
    	padding: 0 10px 0 30px;
    	position: relative;
    }
    .breadcrumbx a:first-child {
    	padding-left: 10px;
    }
    .breadcrumbx a:first-child:before {
    	left: 14px;
    }
    .breadcrumbx a:last-child {
    	padding-right: 0px;
        padding-left: 25px;
    }
    .breadcrumbx a:last-child:after {
    	display: none;
    }

    .breadcrumbx a:after {
    	content: '';
    	position: absolute;
    	top: 0;
    	right: -18px; /*half of square's length*/
    	width: 36px;
    	height: 36px;
    	/*as you see the rotated square takes a larger height. which makes it tough to position it properly. So we are going to scale it down so that the diagonals become equal to the line-height of the link. We scale it to 70.7% because if square's:
    	length = 1; diagonal = (1^2 + 1^2)^0.5 = 1.414 (pythagoras theorem)
    	if diagonal required = 1; length = 1/1.414 = 0.707*/
    	transform: scale(0.707) rotate(45deg);
    	/*we need to prevent the arrows from getting buried under the next link*/
    	z-index: 1;
    	/*background same as links but the gradient will be rotated to compensate with the transform applied*/
    	background: #666;
    	background: linear-gradient(135deg, #666, #333);
    	/*stylish arrow design using box shadow*/
    	box-shadow:
    		2px -2px 0 2px rgba(0, 0, 0, 0.4),
    		3px -3px 0 2px rgba(255, 255, 255, 0.1);
    	/*
    		5px - for rounded arrows and
    		50px - to prevent hover glitches on the border created using shadows*/
    	border-radius: 0 5px 0 50px;
    }

    .flat a, .flat a:after {
    	background: white;
    	color: black;
    	transition: all 0.5s;
    }
    .flat a:before {
    	background: white;
    	box-shadow: 0 0 0 1px #ccc;
    }
    .flat a:hover, .flat a.active,
    .flat a:hover:after, .flat a.active:after{
    	background: #9EEB62;
    }
    .flat a.second, .flat a.second:after {
    	background: white;
    }
    </style>

    <{if isset($smarty.session.user) && !$hide_breadcrumb}>
        <div class="breadcrumbx flat">
        	<a class="scope-page active home" href="<{$smarty.const.APPLICATION_URL}>/desktop"><{_t('Home')}></a>

        	<{$package = PackageHelper::getCurrentPackage()}>

        	<{if $package}>
        	    <a class="scope-page active second" href="<{$smarty.const.APPLICATION_URL}>/desktop/package/<{$package->UUID}>"><{_t($package->NAME)}></a>
            <{/if}>

        	<a href="#"></a>
        </div>

        <{if !$hide_horizontal_menu}>
        	<{$packagemenu = PackageHelper::getCurrentPackageMenu()}>

        	<{if $packagemenu}>
                <{include file="menu.horizontal.items.tpl" menus=$packagemenu parent=0 depth=0}>
            <{else}>
                <{include file="menu.horizontal.items.tpl" menus=$smarty.session.menu parent=0 depth=0}>
            <{/if}>
        <{/if}>
    <{/if}>

    <div style="clear:both"></div>
</div>