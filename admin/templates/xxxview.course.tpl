    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{php}>
        	eval("\$tmp = L_VIEW.' '.strtolower_t('L_COURSE');");
            $template->assign('title', $tmp);
        <{/php}>

    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/view/<{$previd}>">Prev</a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/view/<{$nextid}>">Next</a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/view/<{$details->ID}>"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>

<div id="courseview" class="view_details mainview">

<{if isset($messages.course) }>
<{foreach from=$messages.course key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Control bar -->
<div class="view-control-bar">
    <!-- Language bar -->

    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->ID}>
    		    			<{if isset($smarty.session.acl.course.edit) }>
    		    <div class="button-general">
    		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/edit/<{$details->ID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>"><span class="button-face"><{label key="L_EDIT"}></span></a>
    		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
    		    </div>
    	    <{/foreach}>

    	    	    		            		            <{if isset($smarty.session.acl.course.delete) }>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/delete/<{$details->ID}>"><span class="button-face"><{label key="L_DELETE"}></span></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>
            	        <div class="button-general">
            <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/course/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
        </div>
    	        <div class="clearer"></div>
    </div>
</div>

<style>
.xxxhead {
    padding: 5px 5px 30px 5px;
    background: #E7E9EC;
    margin-bottom: 20px;
}
.xxxlinks {
    float: left;
    padding: 5px;
}

.xxxlinks>li {
    list-style:none;
    float:left;
    padding-right: 10px;
    padding-left: 10px;
    border-left: 1px solid #CDCDCD;
}
.xxxlinks>li:first-child {
    border-left: none;
    padding-left: 0px;
}
.xxxlinks>li>a {
    color: #235D9D;
    text-transform: uppercase;
}
</style>

<!-- Details -->
<div class="section">

    <div class="col">
        <div class="xxxhead">
            <div href="#tab-main" class="mirror-name course-tab-header" style="clear:none;display:none;"></div>
            <div style="clear:both"></div>
            <ul class="xxxlinks">
                    <{if isset($smarty.session.acl.course) }>
                <li><a href="#tab-courses" class="course-tab-header"><{label key="L_COURSE"}></a></li>
            <{/if}>
                    <{if isset($smarty.session.acl.courseannouncement) }>
                <li><a href="#tab-courseannouncements" class="course-tab-header"><{label key="L_COURSE_ANNOUNCEMENT"}> </a></li>
            <{/if}>
                    <{if isset($smarty.session.acl.coursematerial) }>
                <li><a href="#tab-coursematerials" class="course-tab-header"><{label key="L_COURSE_MATERIAL"}> </a></li>
            <{/if}>
                    <{if isset($smarty.session.acl.courseprice) }>
                <li><a href="#tab-courseprices" class="course-tab-header"><{label key="L_COURSE_PRICE"}></a></li>
            <{/if}>
                </ul>
        </div>
    <div id="coursetabs">

    <div class="xxx" id="tab-main">
        <{include file="view-main.course.tpl"}>
    </div>

    <div class="xxx" id="tab-courses" style="display:none">
                    <{ajaxmodule class="WidgetListCourse" method="" PARENT=$details->ID where="" template='widgetlist.course.tpl'}>
    </div>
    <div class="xxx" id="tab-courseannouncements" style="display:none">
                    <{ajaxmodule class="WidgetListCourseAnnouncement" method="" ID_COURSE=$details->ID where="" template='widgetlist.courseannouncement.tpl'}>
    </div>
    <div class="xxx" id="tab-coursematerials" style="display:none">
                    <{ajaxmodule class="WidgetListCourseMaterial" method="" ID_COURSE=$details->ID where="" template='widgetlist.coursematerial.tpl'}>
    </div>
    <div class="xxx" id="tab-courseprices" style="display:none">
                    <{ajaxmodule class="WidgetListCoursePrice" method="" ID_COURSE=$details->ID where="" template='widgetlist.courseprice.tpl'}>
    </div>
    </div>

    <script type="text/javascript">
        function showsyllabus() {
            $('.xxx').hide();
        	$('#tab-courseprices').show();
        }

    $(document).ready(function(){
        $('.course-tab-header').click(function(e){
            e.preventDefault();

            var a = $(this);

            var tab = a.attr('href');

            $('.xxx').hide();
            $(tab).show();
        });

    });
    </script>



    </div>

    <div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div>

    <div class="clearer"></div>
</div>

    <{plugin key="course_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
        <{if isset($smarty.session.acl.course) }>
        <{assign var='canaccess2anytab' value='1'}>
    <{/if}>
        <{if isset($smarty.session.acl.courseannouncement) }>
        <{assign var='canaccess2anytab' value='1'}>
    <{/if}>
        <{if isset($smarty.session.acl.coursematerial) }>
        <{assign var='canaccess2anytab' value='1'}>
    <{/if}>
        <{if isset($smarty.session.acl.courseprice) }>
        <{assign var='canaccess2anytab' value='1'}>
    <{/if}>
        <{if isset($smarty.session.acl.coursesession) }>
        <{assign var='canaccess2anytab' value='1'}>
    <{/if}>


    </div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#courseview .column-name');
    	var mirror = $('#courseview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#courseview', 'f2', '.button-edit');
    	bind_hotkey('#courseview', 'esc', '.button-close');
    	bind_hotkey('#courseview', 'left', '.button-view-prev');
    	bind_hotkey('#courseview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#courseview :focusable:first').focus();
        }

    	$('#courseview').click(function(){
    	    var focused = $('#courseview :focus');

    	    if (focused.length == 0) {
                $('#courseview :focusable:first').focus();
    	    }
    	});
    });

            $(function() {
        	$('.view-buttons').scrollToFixed();
        });
    </script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>

<{include file="footer.tpl"}>