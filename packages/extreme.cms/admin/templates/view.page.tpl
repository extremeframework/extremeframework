    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_PAGE)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="page-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#page-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/page/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#pageview .button-edit').focus();
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
    		    			<{if isset($smarty.session.acl.page.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.page.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.page[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="pageview" class="page-view view_details mainview">

<{if isset($messages.page) }>
<{foreach from=$messages.page key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.page.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="page_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.page) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.pagegallery) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.pagelink) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.pagesection) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.pagewidget) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="pagetabs" class="section">
                <ul>
                                            <{if Framework::hasModule('Page') && isset($smarty.session.acl.page) }>
                            <li><a href="#tab-pages"><{label key="L_PAGE"}> <span class="badge page-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PageGallery') && isset($smarty.session.acl.pagegallery) }>
                            <li><a href="#tab-pagegalleries"><{label key="L_PAGE_GALLERY"}> <span class="badge pagegallery-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PageLink') && isset($smarty.session.acl.pagelink) }>
                            <li><a href="#tab-pagelinks"><{label key="L_PAGE_LINK"}> <span class="badge pagelink-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PageSection') && isset($smarty.session.acl.pagesection) }>
                            <li><a href="#tab-pagesections"><{label key="L_PAGE_SECTION"}> <span class="badge pagesection-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PageWidget') && isset($smarty.session.acl.pagewidget) }>
                            <li><a href="#tab-pagewidgets"><{label key="L_PAGE_WIDGET"}> <span class="badge pagewidget-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('Page') && isset($smarty.session.acl.page) }>
                        <div id="tab-pages">
                        	<{if true || $tab == 'pages'}>
                            	<h2 class="print"><{label key="L_PAGE"}></h2>
                                                                    <{ajaxmodule class="WidgetListPage" method="" readonly=!WorkflowHelper::isEditable($details->WFID) PARENT="`$details->ID`" where=""  template='widgetlist.page.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PageGallery') && isset($smarty.session.acl.pagegallery) }>
                        <div id="tab-pagegalleries">
                        	<{if true || $tab == 'pagegalleries'}>
                            	<h2 class="print"><{label key="L_PAGE_GALLERY"}></h2>
                                                                    <{ajaxmodule class="WidgetListPageGallery" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PAGE="`$details->ID`" where=""  template='widgetlist.pagegallery.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PageLink') && isset($smarty.session.acl.pagelink) }>
                        <div id="tab-pagelinks">
                        	<{if true || $tab == 'pagelinks'}>
                            	<h2 class="print"><{label key="L_PAGE_LINK"}></h2>
                                                                    <{ajaxmodule class="WidgetListPageLink" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PAGE="`$details->ID`" where=""  template='widgetlist.pagelink.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PageSection') && isset($smarty.session.acl.pagesection) }>
                        <div id="tab-pagesections">
                        	<{if true || $tab == 'pagesections'}>
                            	<h2 class="print"><{label key="L_PAGE_SECTION"}></h2>
                                                                    <{ajaxmodule class="WidgetListPageSection" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PAGE="`$details->ID`" where="" PARENT="`$details->PARENT`" VIEW_MORE_ID_PAGE="`$details->VIEW_MORE_ID_PAGE`" template='widgetlist.pagesection.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PageWidget') && isset($smarty.session.acl.pagewidget) }>
                        <div id="tab-pagewidgets">
                        	<{if true || $tab == 'pagewidgets'}>
                            	<h2 class="print"><{label key="L_PAGE_WIDGET"}></h2>
                                                                    <{ajaxmodule class="WidgetListPageWidget" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PAGE="`$details->ID`" where=""  template='widgetlist.pagewidget.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#pagetabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("page_active_tab", $("#pagetabs").tabs("option", "active"));
//                        },
//                        active: $("#pagetabs").tabs({ active: $.cookie("page_active_tab") })
                    });
                	$("#pagetabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#pagetabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#pagetabs .expand-collapse');

                	var details = $('#pageview .view-main');

                    if ($.cookie('pageexpandcollapse') == 'collapsed') {
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

                            $.cookie('pageexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('pageexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="page-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/page/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#pageview .form-field-value .column-name');
    	var mirror = $('#pageview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pageview', 'f2', '.button-edit');
    	bind_hotkey('#pageview', 'esc', '.button-close');
    	bind_hotkey('#pageview', 'left', '.button-view-prev');
    	bind_hotkey('#pageview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pageview :focusable:first').focus();
        }

    	$('#pageview').click(function(){
    	    var focused = $('#pageview :focus');

    	    if (focused.length == 0) {
                $('#pageview :focusable:first').focus();
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
