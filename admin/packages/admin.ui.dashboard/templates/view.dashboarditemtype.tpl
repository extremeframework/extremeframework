    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('Dashboard Item Type'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="dashboarditemtype-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#dashboarditemtype-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#dashboarditemtypeview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.dashboarditemtype.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.dashboarditemtype.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.dashboarditemtype.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/delete/<{$details->UUID}>" title="<{_t('Delete', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options || isset($smarty.session.acl.dashboarditemtype.customfields)}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.dashboarditemtype[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                        <{if isset($smarty.session.acl.dashboarditemtype.customfields)}>
                            <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/customfield/manage/dashboarditemtype"><{_t('Manage custom fields')}></a></li>
                        <{/if}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/close/"><span class="button-face"><{_t('Close')}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<div id="dashboarditemtypeview" class="dashboarditemtype-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.dashboarditemtype.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="dashboarditemtype_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.dashboarditem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="dashboarditemtypetabs" class="section">
                <ul>
                                            <{if Framework::hasModule('DashboardItem') && isset($smarty.session.acl.dashboarditem) }>
                            <li><a href="#tab-dashboarditems"><{_t('Dashboard item')}> <span class="badge dashboarditem-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('DashboardItem') && isset($smarty.session.acl.dashboarditem) }>
                        <div id="tab-dashboarditems">
                        	<{if true || $tab == 'dashboarditems'}>
                            	<h2 class="print"><{_t('Dashboard item')}></h2>
                                                                    <{ajaxmodule class="WidgetListDashboardItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_DASHBOARD_ITEM_TYPE="`$details->CODE`" where=""  template='widgetlist.dashboarditem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#dashboarditemtypetabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("dashboarditemtype_active_tab", $("#dashboarditemtypetabs").tabs("option", "active"));
//                        },
//                        active: $("#dashboarditemtypetabs").tabs({ active: $.cookie("dashboarditemtype_active_tab") })
                    });
                	$("#dashboarditemtypetabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#dashboarditemtypetabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#dashboarditemtypetabs .expand-collapse');

                	var details = $('#dashboarditemtypeview .view-main');

                    if ($.cookie('dashboarditemtypeexpandcollapse') == 'collapsed') {
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

                            $.cookie('dashboarditemtypeexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('dashboarditemtypeexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="dashboarditemtype-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/dashboarditemtype/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#dashboarditemtypeview .form-field-value .column-name');
    	var mirror = $('#dashboarditemtypeview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#dashboarditemtypeview', 'f2', '.button-edit');
    	bind_hotkey('#dashboarditemtypeview', 'esc', '.button-close');
    	bind_hotkey('#dashboarditemtypeview', 'left', '.button-view-prev');
    	bind_hotkey('#dashboarditemtypeview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#dashboarditemtypeview :focusable:first').focus();
        }

    	$('#dashboarditemtypeview').click(function(){
    	    var focused = $('#dashboarditemtypeview :focus');

    	    if (focused.length == 0) {
                $('#dashboarditemtypeview :focusable:first').focus();
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
