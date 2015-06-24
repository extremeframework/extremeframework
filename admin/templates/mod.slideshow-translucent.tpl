<style type="text/css">
.TB_Wrapper {
    width: 100%;
    height: <{if $height}><{$height}><{else}>280px<{/if}>; /* important to be same as image height */
    background: #EEEEEE url(<{$smarty.const.APPLICATION_URL}>/lib/trans_banner/preloader.gif) center center no-repeat;
}

.TB_Wrapper {
	position: relative;
	overflow: hidden;
}

.TB_Wrapper .Slide {
	visibility:hidden;
	background: #EEEEEE url(preloader.gif) center center no-repeat;
}

/* Global Description Style */
.TB_Wrapper .Slide div {
    font-family: "Segoe Script";
    font-size: 12px;
	color:#FFF;
}

/*Hyperlink Styles*/
.TB_Wrapper a:link{
	color:#FFF;
	text-decoration:none;
}

.TB_Wrapper a:visited{
	color:#FFF;
}

.TB_Wrapper a:hover{
	color:#FFF;
	text-decoration:underline;
}

.TB_Wrapper a:active{
	color:#FFF;
}

.TB_Wrapper .noSelect {
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
}
</style>
<script src="<{$smarty.const.APPLICATION_URL}>/lib/trans_banner/jquery.easing.1.3.min.js"></script>
<script src="<{$smarty.const.APPLICATION_URL}>/lib/trans_banner/trans-banner.min.js"></script>
<script type="text/javascript">
    jQuery(function($){
        $('.TB_Wrapper').TransBanner();
    });
</script>

<div class="TB_Wrapper">
    <{foreach from=$items item=item}>
        <div class="Slide">
            <{if $item->LINK}>
                <a href="<{$item->LINK}>" target="_blank"><img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" /></a>
            <{else}>
                <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" />
            <{/if}>
            <div align="left">
                <{$item->SHORT_DESCRIPTION}>
            </div>
        </div>
	<{/foreach}>
</div>