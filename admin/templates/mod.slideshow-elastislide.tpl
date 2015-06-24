<style type="text/css">
</style>

<link rel="stylesheet" type="text/css" href="<{$smarty.const.APPLICATION_URL}>/lib/elastislide/elastislide.css" />
<script src="<{$smarty.const.APPLICATION_URL}>/lib/elastislide/modernizr.custom.17475.js"></script>

<ul id="carousel" class="elastislide-list">
    <{foreach from=$items item=item}>
        <li>
            <{if $item->LINK}>
                <a href="<{$item->LINK}>" target="_blank"><img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" title="<{$item->TITLE}>"/></a>
            <{else}>
                <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" title="<{$item->TITLE}>"/>
            <{/if}>
        </li>
	<{/foreach}>
</ul>

<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/elastislide/jquerypp.custom.js"></script>
<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/lib/elastislide/jquery.elastislide.js"></script>
<script type="text/javascript">
	$( '#carousel' ).elastislide( {
		orientation : '<{$orientation}>'
	} );
</script>