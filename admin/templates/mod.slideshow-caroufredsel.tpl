<style type="text/css">
.image_carousel {
	padding: 15px 0 15px 40px;
	position: relative;
}
.image_carousel img {
	border: 1px solid #ccc;
	background-color: white;
	padding: 9px;
	margin: 7px;
	display: block;
}
</style>

<div class="image_carousel">
    <div id="slider-carousel">
        <{foreach from=$items item=item}>
            <div>
                <{if $item->LINK}>
                    <a href="<{$item->LINK}>" target="_blank"><img width="<{$width}>" height="<{$height}>" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" <{if $showcaption}>title="<{$item->SHORT_DESCRIPTION}>"<{/if}>/></a>
                <{else}>
                    <img width="<{$width}>" height="<{$height}>" src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" <{if $showcaption}>title="<{$item->SHORT_DESCRIPTION}>"<{/if}>"/>
                <{/if}>
            </div>
    	<{/foreach}>
    </div>
</div>

<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#slider-carousel").carouFredSel({
	    circular            : true,
	    infinite            : true,
		items				: 2,
		direction			: "up",
		auto                : true,
		scroll : {
			items			: 2,
			easing			: "elastic",
			duration		: 1000,
			pauseOnHover	: true
		}
	});
});
</script>