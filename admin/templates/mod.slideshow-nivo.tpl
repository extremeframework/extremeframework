<link rel="stylesheet" href="<{$smarty.const.APPLICATION_URL}>/lib/nivo-slider/nivo-slider.css" type="text/css" />
<script src="<{$smarty.const.APPLICATION_URL}>/lib/nivo-slider/jquery.nivo.slider.pack.js" type="text/javascript"></script>
<link rel="stylesheet" href="<{$smarty.const.APPLICATION_URL}>/lib/nivo-slider/themes/default/default.css" type="text/css" />

<div class="slider-wrapper theme-default">
    <div class="ribbon"></div>
    <div id="slider" class="nivoSlider">
        <{foreach from=$items item=item}>
            <{if $item->LINK}>
                <a href="<{$item->LINK}>" target="_blank"><img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" <{if $showcaption}>title="#htmlcaption<{$item->ID}>"<{/if}>/></a>
            <{else}>
                <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>" <{if $showcaption}>title="#htmlcaption<{$item->ID}>"<{/if}>"/>
            <{/if}>
		<{/foreach}>
    </div>
    <{if $showcaption}>
        <{foreach from=$items item=item}>
            <div id="htmlcaption<{$item->ID}>" class="nivo-html-caption">
                <{$item->SHORT_DESCRIPTION}>
            </div>
		<{/foreach}>
    <{/if}>
</div>

<script type="text/javascript">
    jQuery(window).load(function(){
        $('#slider').nivoSlider({
            effect: 'random',               // Specify sets like: 'fold,fade,sliceDown'
            slices: 15,                     // For slice animations
            boxCols: 8,                     // For box animations
            boxRows: 4,                     // For box animations
            animSpeed: 500,                 // Slide transition speed
            pauseTime: 3000,                // How long each slide will show
            startSlide: 0,                  // Set starting Slide (0 index)
            directionNav: true,             // Next & Prev navigation
            controlNav: true,               // 1,2,3... navigation
            controlNavThumbs: false,        // Use thumbnails for Control Nav
            pauseOnHover: true,             // Stop animation while hovering
            manualAdvance: false,           // Force manual transitions
            prevText: 'Prev',               // Prev directionNav text
            nextText: 'Next',               // Next directionNav text
            randomStart: false,             // Start on a random slide
            beforeChange: function(){},     // Triggers before a slide transition
            afterChange: function(){},      // Triggers after a slide transition
            slideshowEnd: function(){},     // Triggers after all slides have been shown
            lastSlide: function(){},        // Triggers when last slide is shown
            afterLoad: function(){}         // Triggers when slider has loaded
        });
    });
</script>