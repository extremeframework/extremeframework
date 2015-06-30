    <{assign var='meta_description' value=$details->TITLE}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_POST)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="post-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#post-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/post/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#postview .button-edit').focus();
                });
            </script>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.post.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.post.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.post[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/post/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="postview" class="post-view view_details mainview">

<{if isset($messages.post) }>
<{foreach from=$messages.post key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-title hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.post.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="post_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.menuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.postgallery) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.postrelation) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.postsection) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="posttabs" class="section">
                <ul>
                                            <{if Framework::hasModule('MenuItem') && isset($smarty.session.acl.menuitem) }>
                            <li><a href="#tab-menuitems"><{label key="L_MENU_ITEM"}> <span class="badge menuitem-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PostGallery') && isset($smarty.session.acl.postgallery) }>
                            <li><a href="#tab-postgalleries"><{label key="L_POST_GALLERY"}> <span class="badge postgallery-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PostRelation') && isset($smarty.session.acl.postrelation) }>
                            <li><a href="#tab-postrelations"><{label key="L_POST_RELATION"}> <span class="badge postrelation-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PostSection') && isset($smarty.session.acl.postsection) }>
                            <li><a href="#tab-postsections"><{label key="L_POST_SECTION"}> <span class="badge postsection-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('MenuItem') && isset($smarty.session.acl.menuitem) }>
                        <div id="tab-menuitems">
                        	<{if true || $tab == 'menuitems'}>
                            	<h2 class="print"><{label key="L_MENU_ITEM"}></h2>
                                                                    <{ajaxmodule class="WidgetListMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_POST="`$details->ID`" where="" ID_POST_CATEGORY="`$details->ID_POST_CATEGORY`" template='widgetlist.menuitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PostGallery') && isset($smarty.session.acl.postgallery) }>
                        <div id="tab-postgalleries">
                        	<{if true || $tab == 'postgalleries'}>
                            	<h2 class="print"><{label key="L_POST_GALLERY"}></h2>
                                                                    <{ajaxmodule class="WidgetListPostGallery" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_POST="`$details->ID`" where=""  template='widgetlist.postgallery.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PostRelation') && isset($smarty.session.acl.postrelation) }>
                        <div id="tab-postrelations">
                        	<{if true || $tab == 'postrelations'}>
                            	<h2 class="print"><{label key="L_POST_RELATION"}></h2>
                                                                    <{ajaxmodule class="WidgetListPostRelation" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_POST="`$details->ID`" where=""  template='widgetlist.postrelation.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PostSection') && isset($smarty.session.acl.postsection) }>
                        <div id="tab-postsections">
                        	<{if true || $tab == 'postsections'}>
                            	<h2 class="print"><{label key="L_POST_SECTION"}></h2>
                                                                    <{ajaxmodule class="WidgetListPostSection" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_POST="`$details->ID`" where=""  template='widgetlist.postsection.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#posttabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("post_active_tab", $("#posttabs").tabs("option", "active"));
//                        },
//                        active: $("#posttabs").tabs({ active: $.cookie("post_active_tab") })
                    });
                	$("#posttabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#posttabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#posttabs .expand-collapse');

                	var details = $('#postview .view-main');

                    if ($.cookie('postexpandcollapse') == 'collapsed') {
                        details.hide();

                	    handler.addClass('collapsed');
                    } else {
                        details.show();

                	    handler.addClass('expanded');
                    }

                	handler.click(function () {
                        if (handler.hasClass('expanded')) {
                            details.animate({ height: 'hide', opacity: 'hide' }, 'slow');

                            handler.removeClass('expanded');
                            handler.addClass('collapsed');

                            $.cookie('postexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('postexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="post-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/post/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#postview .form-field-value .column-title');
    	var mirror = $('#postview .mirror-title');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postview', 'f2', '.button-edit');
    	bind_hotkey('#postview', 'esc', '.button-close');
    	bind_hotkey('#postview', 'left', '.button-view-prev');
    	bind_hotkey('#postview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postview :focusable:first').focus();
        }

    	$('#postview').click(function(){
    	    var focused = $('#postview :focus');

    	    if (focused.length == 0) {
                $('#postview :focusable:first').focus();
    	    }
    	});
    });

            $(function() {
        	//$('.view-buttons').scrollToFixed();
        });
    </script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>

<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

    <{include file="footer.tpl"}>
