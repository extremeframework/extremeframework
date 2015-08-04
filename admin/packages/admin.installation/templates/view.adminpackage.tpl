    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('Admin Package'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="adminpackage-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminpackage-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminpackage/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminpackageview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.adminpackage.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.adminpackage.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.adminpackage.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/delete/<{$details->UUID}>" title="<{_t('Delete', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.adminpackage[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminpackage/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/close/"><span class="button-face"><{_t('Close')}></span></a>
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

<div id="adminpackageview" class="adminpackage-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.adminpackage.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="adminpackage_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminmodule) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminpackagemenu) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminpackagepermission) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminpackageshortcut) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.userpackage) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="adminpackagetabs" class="section">
                <ul>
                                            <{if Framework::hasModule('AdminModule') && isset($smarty.session.acl.adminmodule) }>
                            <li><a href="#tab-adminmodules"><{_t('Admin module')}> <span class="badge adminmodule-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminPackageMenu') && isset($smarty.session.acl.adminpackagemenu) }>
                            <li><a href="#tab-adminpackagemenus"><{_t('Admin package menu')}> <span class="badge adminpackagemenu-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminPackagePermission') && isset($smarty.session.acl.adminpackagepermission) }>
                            <li><a href="#tab-adminpackagepermissions"><{_t('Admin package permission')}> <span class="badge adminpackagepermission-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminPackageShortcut') && isset($smarty.session.acl.adminpackageshortcut) }>
                            <li><a href="#tab-adminpackageshortcuts"><{_t('Admin package shortcut')}> <span class="badge adminpackageshortcut-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserPackage') && isset($smarty.session.acl.userpackage) }>
                            <li><a href="#tab-userpackages"><{_t('User package')}> <span class="badge userpackage-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('AdminModule') && isset($smarty.session.acl.adminmodule) }>
                        <div id="tab-adminmodules">
                        	<{if true || $tab == 'adminmodules'}>
                            	<h2 class="print"><{_t('Admin module')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminModule" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_PACKAGE="`$details->CODE`" where=""  template='widgetlist.adminmodule.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminPackageMenu') && isset($smarty.session.acl.adminpackagemenu) }>
                        <div id="tab-adminpackagemenus">
                        	<{if true || $tab == 'adminpackagemenus'}>
                            	<h2 class="print"><{_t('Admin package menu')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminPackageMenu" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_PACKAGE="`$details->CODE`" where=""  template='widgetlist.adminpackagemenu.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminPackagePermission') && isset($smarty.session.acl.adminpackagepermission) }>
                        <div id="tab-adminpackagepermissions">
                        	<{if true || $tab == 'adminpackagepermissions'}>
                            	<h2 class="print"><{_t('Admin package permission')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminPackagePermission" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_PACKAGE="`$details->CODE`" where=""  template='widgetlist.adminpackagepermission.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminPackageShortcut') && isset($smarty.session.acl.adminpackageshortcut) }>
                        <div id="tab-adminpackageshortcuts">
                        	<{if true || $tab == 'adminpackageshortcuts'}>
                            	<h2 class="print"><{_t('Admin package shortcut')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminPackageShortcut" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_PACKAGE="`$details->CODE`" where=""  template='widgetlist.adminpackageshortcut.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserPackage') && isset($smarty.session.acl.userpackage) }>
                        <div id="tab-userpackages">
                        	<{if true || $tab == 'userpackages'}>
                            	<h2 class="print"><{_t('User package')}></h2>
                                                                    <{ajaxmodule class="WidgetListUserPackage" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_PACKAGE="`$details->CODE`" where=""  template='widgetlist.userpackage.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#adminpackagetabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("adminpackage_active_tab", $("#adminpackagetabs").tabs("option", "active"));
//                        },
//                        active: $("#adminpackagetabs").tabs({ active: $.cookie("adminpackage_active_tab") })
                    });
                	$("#adminpackagetabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#adminpackagetabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#adminpackagetabs .expand-collapse');

                	var details = $('#adminpackageview .view-main');

                    if ($.cookie('adminpackageexpandcollapse') == 'collapsed') {
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

                            $.cookie('adminpackageexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('adminpackageexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="adminpackage-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/adminpackage/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#adminpackageview .form-field-value .column-name');
    	var mirror = $('#adminpackageview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminpackageview', 'f2', '.button-edit');
    	bind_hotkey('#adminpackageview', 'esc', '.button-close');
    	bind_hotkey('#adminpackageview', 'left', '.button-view-prev');
    	bind_hotkey('#adminpackageview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackageview :focusable:first').focus();
        }

    	$('#adminpackageview').click(function(){
    	    var focused = $('#adminpackageview :focus');

    	    if (focused.length == 0) {
                $('#adminpackageview :focusable:first').focus();
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
