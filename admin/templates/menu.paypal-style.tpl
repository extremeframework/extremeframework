<div class="top-banner" style="background:url(../images/bg-topnav.png) repeat #6e6d71;min-width:1050px">
    <div style="text-align:center;">
        <a href="http://www.seomachinepro.com/jv" target="blank"><img src="<{$smarty.const.APPLICATION_URL}>/images/JV-banner.jpg" target="blank"/></a>
        <a href="http://seogladiators.com" target="blank"><img src="<{$smarty.const.APPLICATION_URL}>/images/seogladiators.jpg" target="blank"/></a>
    </div>
</div>

<div class="custom-nav">
	<div class="custom-navOut">
		<nav role="navigation">
			<div class="logo"><{$menuheader}></div>
			<ul>
                <{foreach from=$menus.$depth.$parent item=item}>
                    <{assign var="parent2" value=$item->ID}>
                    <{assign var="depth2" value=$depth+1}>

                    <li<{if $menus.$depth2.$parent2}> class="dropdown"<{/if}>>
                        <a href="<{if $item->SLUG}><{$item->SLUG}><{/if}>"><{$item->TITLE}></a>

                        <{if $menus.$depth2.$parent2}>
                        <ul>
                            <{foreach from=$menus.$depth2.$parent2 item=item}>
                                <li>
                                    <a href="<{if $item->SLUG}><{$item->SLUG}><{/if}>"><{$item->TITLE}></a>
                                </li>
                            <{/foreach}>
                        </ul>
                        <{/if}>
                    </li>
                <{/foreach}>
            </ul>
        </nav>
    </div>
</div>