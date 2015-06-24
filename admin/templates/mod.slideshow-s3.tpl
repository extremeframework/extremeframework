<style type="text/css">
#s3slider {
   width: 100%;
   height: <{if $height}><{$height}><{else}>280px<{/if}>; /* important to be same as image height */
   position: relative;
   overflow: hidden;
   z-index:200;
}

#s3sliderContent {
   width: 100%;
   position: absolute;
   top: 0;
   margin-left: 0;
}

.s3sliderImage {
   float: left;
   position: relative;
   display: none;
}

.s3sliderImage img{
	width:600px;
	height:<{if $height}><{$height}><{else}>280px<{/if}>;
}
.s3sliderImage span {
   position: absolute;
   left: 0;
   font-family: "Segoe Script";
   font-size: 12px;
   background-color: <{$background}>;
   padding: 10px 13px;
   width:574px;
   filter: alpha(opacity=60);
   -moz-opacity: 0.8;
   -khtml-opacity: 0.6;
   opacity: 0.6;
   color: #fff;
   display: none;
   bottom: 0;
   /*
       if you put
       top: 0; -> the box with text will be shown at the top of the image
       if you put
       bottom: 0; -> the box with text will be shown at the bottom of the image
   */
}
.clear {
   clear: both;
}
</style>
<div id="s3slider" class="left" style="display:none">
	<ul id="s3sliderContent">
		<{foreach from=$items item=item}>
			<li class="s3sliderImage" onclick="javascript:moveToSite('<{$item->LINK}>')">
                <img src="<{$smarty.const.UPLOAD_URL}>/<{$item->IMAGE}>" alt="<{$item->TITLE}>"/>
                <span><{$item->SHORT_DESCRIPTION}></span>
            </li>
		<{/foreach}>
	    <div class="clear s3sliderImage"></div>
	</ul>
	<script type="text/javascript" src="<{$smarty.const.APPLICATION_URL}>/js/s3Slider.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('#s3slider').show();
	        $('#s3slider').s3Slider({
	            timeOut: 3000
	        });
	    });
	</script>
</div>