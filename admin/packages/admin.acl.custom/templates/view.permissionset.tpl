    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('Permission Set'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="permissionset-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#permissionset-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/permissionset/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#permissionsetview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.permissionset.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.permissionset.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.permissionset.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/permissionset/delete/<{$details->UUID}>" title="<{_t('Delete', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options || isset($smarty.session.acl.permissionset.customfields)}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.permissionset[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                        <{if isset($smarty.session.acl.permissionset.customfields)}>
                            <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/customfield/manage/permissionset"><{_t('Manage custom fields')}></a></li>
                        <{/if}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/close/"><span class="button-face"><{_t('Close')}></span></a>
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

<div id="permissionsetview" class="permissionset-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.permissionset.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="permissionset_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminpackagepermission) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.customaccessright) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.permissionsetitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="permissionsettabs" class="section">
                <ul>
                                            <{if Framework::hasModule('AdminPackagePermission') && isset($smarty.session.acl.adminpackagepermission) }>
                            <li><a href="#tab-adminpackagepermissions"><{_t('Admin package permission')}> <span class="badge adminpackagepermission-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('CustomAccessRight') && isset($smarty.session.acl.customaccessright) }>
                            <li><a href="#tab-customaccessrights"><{_t('Custom access right')}> <span class="badge customaccessright-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('PermissionSetItem') && isset($smarty.session.acl.permissionsetitem) }>
                            <li><a href="#tab-permissionsetitems"><{_t('Permission set item')}> <span class="badge permissionsetitem-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('AdminPackagePermission') && isset($smarty.session.acl.adminpackagepermission) }>
                        <div id="tab-adminpackagepermissions">
                        	<{if true || $tab == 'adminpackagepermissions'}>
                            	<h2 class="print"><{_t('Admin package permission')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminPackagePermission" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.adminpackagepermission.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('CustomAccessRight') && isset($smarty.session.acl.customaccessright) }>
                        <div id="tab-customaccessrights">
                        	<{if true || $tab == 'customaccessrights'}>
                            	<h2 class="print"><{_t('Custom access right')}></h2>
                                                                    <{ajaxmodule class="WidgetListCustomAccessRight" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.customaccessright.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('PermissionSetItem') && isset($smarty.session.acl.permissionsetitem) }>
                        <div id="tab-permissionsetitems">
                        	<{if true || $tab == 'permissionsetitems'}>
                            	<h2 class="print"><{_t('Permission set item')}></h2>
                                                                    <{ajaxmodule class="WidgetListPermissionSetItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.permissionsetitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#permissionsettabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("permissionset_active_tab", $("#permissionsettabs").tabs("option", "active"));
//                        },
//                        active: $("#permissionsettabs").tabs({ active: $.cookie("permissionset_active_tab") })
                    });
                	$("#permissionsettabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#permissionsettabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#permissionsettabs .expand-collapse');

                	var details = $('#permissionsetview .view-main');

                    if ($.cookie('permissionsetexpandcollapse') == 'collapsed') {
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

                            $.cookie('permissionsetexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('permissionsetexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="permissionset-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/permissionset/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#permissionsetview .form-field-value .column-name');
    	var mirror = $('#permissionsetview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#permissionsetview', 'f2', '.button-edit');
    	bind_hotkey('#permissionsetview', 'esc', '.button-close');
    	bind_hotkey('#permissionsetview', 'left', '.button-view-prev');
    	bind_hotkey('#permissionsetview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#permissionsetview :focusable:first').focus();
        }

    	$('#permissionsetview').click(function(){
    	    var focused = $('#permissionsetview :focus');

    	    if (focused.length == 0) {
                $('#permissionsetview :focusable:first').focus();
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
