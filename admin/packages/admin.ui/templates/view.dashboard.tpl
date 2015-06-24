    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_DASHBOARD)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="dashboard-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#dashboard-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/dashboard/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#dashboardview .button-edit').focus();
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
    		    			<{if isset($smarty.session.acl.dashboard.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.dashboard.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.dashboard[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="dashboardview" class="dashboard-view view_details mainview">

<{if isset($messages.dashboard) }>
<{foreach from=$messages.dashboard key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.dashboard.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="dashboard_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.usergroup) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.userpreference) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="dashboardtabs" class="section">
                <ul>
                                            <{if Framework::hasModule('UserGroup') && isset($smarty.session.acl.usergroup) }>
                            <li><a href="#tab-usergroups"><{label key="L_USER_GROUP"}> <span class="badge usergroup-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserPreference') && isset($smarty.session.acl.userpreference) }>
                            <li><a href="#tab-userpreferences"><{label key="L_USER_PREFERENCE"}> <span class="badge userpreference-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('UserGroup') && isset($smarty.session.acl.usergroup) }>
                        <div id="tab-usergroups">
                        	<{if true || $tab == 'usergroups'}>
                            	<h2 class="print"><{label key="L_USER_GROUP"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserGroup" method="" readonly=!WorkflowHelper::isEditable($details->WFID) DEFAULT_ID_DASHBOARD="`$details->ID`" where=""  template='widgetlist.usergroup.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserPreference') && isset($smarty.session.acl.userpreference) }>
                        <div id="tab-userpreferences">
                        	<{if true || $tab == 'userpreferences'}>
                            	<h2 class="print"><{label key="L_USER_PREFERENCE"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserPreference" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_DASHBOARD="`$details->ID`" where=""  template='widgetlist.userpreference.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#dashboardtabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("dashboard_active_tab", $("#dashboardtabs").tabs("option", "active"));
//                        },
//                        active: $("#dashboardtabs").tabs({ active: $.cookie("dashboard_active_tab") })
                    });
                	$("#dashboardtabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#dashboardtabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#dashboardtabs .expand-collapse');

                	var details = $('#dashboardview .view-main');

                    if ($.cookie('dashboardexpandcollapse') == 'collapsed') {
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

                            $.cookie('dashboardexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('dashboardexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="dashboard-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/dashboard/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#dashboardview .form-field-value .column-name');
    	var mirror = $('#dashboardview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#dashboardview', 'f2', '.button-edit');
    	bind_hotkey('#dashboardview', 'esc', '.button-close');
    	bind_hotkey('#dashboardview', 'left', '.button-view-prev');
    	bind_hotkey('#dashboardview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#dashboardview :focusable:first').focus();
        }

    	$('#dashboardview').click(function(){
    	    var focused = $('#dashboardview :focus');

    	    if (focused.length == 0) {
                $('#dashboardview :focusable:first').focus();
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
