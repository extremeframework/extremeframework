    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_ADMIN_MENU)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="adminmenu-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminmenu-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminmenu/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminmenuview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.adminmenu.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.adminmenu.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.adminmenu.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.adminmenu[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminmenu/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="adminmenuview" class="adminmenu-view view_details mainview">

<{if isset($messages.adminmenu) }>
<{foreach from=$messages.adminmenu key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.adminmenu.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="adminmenu_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminmenuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.dashboard) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="adminmenutabs" class="section">
                <ul>
                                            <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                            <li><a href="#tab-adminmenuitems"><{label key="L_ADMIN_MENU_ITEM"}> <span class="badge adminmenuitem-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Dashboard') && isset($smarty.session.acl.dashboard) }>
                            <li><a href="#tab-dashboards"><{label key="L_DASHBOARD"}> <span class="badge dashboard-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                        <div id="tab-adminmenuitems">
                        	<{if true || $tab == 'adminmenuitems'}>
                            	<h2 class="print"><{label key="L_ADMIN_MENU_ITEM"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.adminmenuitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Dashboard') && isset($smarty.session.acl.dashboard) }>
                        <div id="tab-dashboards">
                        	<{if true || $tab == 'dashboards'}>
                            	<h2 class="print"><{label key="L_DASHBOARD"}></h2>
                                                                    <{ajaxmodule class="WidgetListDashboard" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.dashboard.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#adminmenutabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("adminmenu_active_tab", $("#adminmenutabs").tabs("option", "active"));
//                        },
//                        active: $("#adminmenutabs").tabs({ active: $.cookie("adminmenu_active_tab") })
                    });
                	$("#adminmenutabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#adminmenutabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#adminmenutabs .expand-collapse');

                	var details = $('#adminmenuview .view-main');

                    if ($.cookie('adminmenuexpandcollapse') == 'collapsed') {
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

                            $.cookie('adminmenuexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('adminmenuexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="adminmenu-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/adminmenu/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#adminmenuview .form-field-value .column-name');
    	var mirror = $('#adminmenuview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuview', 'f2', '.button-edit');
    	bind_hotkey('#adminmenuview', 'esc', '.button-close');
    	bind_hotkey('#adminmenuview', 'left', '.button-view-prev');
    	bind_hotkey('#adminmenuview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmenuview :focusable:first').focus();
        }

    	$('#adminmenuview').click(function(){
    	    var focused = $('#adminmenuview :focus');

    	    if (focused.length == 0) {
                $('#adminmenuview :focusable:first').focus();
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
