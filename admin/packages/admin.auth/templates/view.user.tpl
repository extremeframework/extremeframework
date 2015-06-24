    <{assign var='meta_description' value=$details->FIRST_NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_USER)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="user-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#user-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/user/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#userview .button-edit').focus();
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
    		    			<{if isset($smarty.session.acl.user.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.user.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.user[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="userview" class="user-view view_details mainview">

<{if isset($messages.user) }>
<{foreach from=$messages.user key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-first-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.user.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="user_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.changelog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.fieldacl) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.objectacl) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.recyclebin) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.userlog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.usermembership) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.userpreference) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowlog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="usertabs" class="section">
                <ul>
                                            <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                            <li><a href="#tab-changelogs"><{label key="L_CHANGE_LOG"}> <span class="badge changelog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                            <li><a href="#tab-fieldacls"><{label key="L_FIELD_ACL"}> <span class="badge fieldacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                            <li><a href="#tab-objectacls"><{label key="L_OBJECT_ACL"}> <span class="badge objectacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                            <li><a href="#tab-recyclebins"><{label key="L_RECYCLE_BIN"}> <span class="badge recyclebin-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserLog') && isset($smarty.session.acl.userlog) }>
                            <li><a href="#tab-userlogs"><{label key="L_USER_LOG"}> <span class="badge userlog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserMembership') && isset($smarty.session.acl.usermembership) }>
                            <li><a href="#tab-usermemberships"><{label key="L_USER_MEMBERSHIP"}> <span class="badge usermembership-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserPreference') && isset($smarty.session.acl.userpreference) }>
                            <li><a href="#tab-userpreferences"><{label key="L_USER_PREFERENCE"}> <span class="badge userpreference-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                            <li><a href="#tab-workflowlogs"><{label key="L_WORKFLOW_LOG"}> <span class="badge workflowlog-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                        <div id="tab-changelogs">
                        	<{if true || $tab == 'changelogs'}>
                            	<h2 class="print"><{label key="L_CHANGE_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListChangeLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.changelog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                        <div id="tab-fieldacls">
                        	<{if true || $tab == 'fieldacls'}>
                            	<h2 class="print"><{label key="L_FIELD_ACL"}></h2>
                                                                    <{ajaxmodule class="WidgetListFieldAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.fieldacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                        <div id="tab-objectacls">
                        	<{if true || $tab == 'objectacls'}>
                            	<h2 class="print"><{label key="L_OBJECT_ACL"}></h2>
                                                                    <{ajaxmodule class="WidgetListObjectAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.objectacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                        <div id="tab-recyclebins">
                        	<{if true || $tab == 'recyclebins'}>
                            	<h2 class="print"><{label key="L_RECYCLE_BIN"}></h2>
                                                                    <{ajaxmodule class="WidgetListRecycleBin" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.recyclebin.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserLog') && isset($smarty.session.acl.userlog) }>
                        <div id="tab-userlogs">
                        	<{if true || $tab == 'userlogs'}>
                            	<h2 class="print"><{label key="L_USER_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.userlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserMembership') && isset($smarty.session.acl.usermembership) }>
                        <div id="tab-usermemberships">
                        	<{if true || $tab == 'usermemberships'}>
                            	<h2 class="print"><{label key="L_USER_MEMBERSHIP"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserMembership" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.usermembership.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserPreference') && isset($smarty.session.acl.userpreference) }>
                        <div id="tab-userpreferences">
                        	<{if true || $tab == 'userpreferences'}>
                            	<h2 class="print"><{label key="L_USER_PREFERENCE"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserPreference" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.userpreference.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                        <div id="tab-workflowlogs">
                        	<{if true || $tab == 'workflowlogs'}>
                            	<h2 class="print"><{label key="L_WORKFLOW_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER="`$details->ID`" where=""  template='widgetlist.workflowlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#usertabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("user_active_tab", $("#usertabs").tabs("option", "active"));
//                        },
//                        active: $("#usertabs").tabs({ active: $.cookie("user_active_tab") })
                    });
                	$("#usertabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#usertabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#usertabs .expand-collapse');

                	var details = $('#userview .view-main');

                    if ($.cookie('userexpandcollapse') == 'collapsed') {
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

                            $.cookie('userexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('userexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="user-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/user/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#userview .form-field-value .column-first-name');
    	var mirror = $('#userview .mirror-first-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userview', 'f2', '.button-edit');
    	bind_hotkey('#userview', 'esc', '.button-close');
    	bind_hotkey('#userview', 'left', '.button-view-prev');
    	bind_hotkey('#userview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userview :focusable:first').focus();
        }

    	$('#userview').click(function(){
    	    var focused = $('#userview :focus');

    	    if (focused.length == 0) {
                $('#userview :focusable:first').focus();
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
