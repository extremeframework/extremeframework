    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_USER_ROLE)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="userrole-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#userrole-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/userrole/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#userroleview .button-edit').focus();
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
    		    			<{if isset($smarty.session.acl.userrole.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.userrole.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.userrole[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="userroleview" class="userrole-view view_details mainview">

<{if isset($messages.userrole) }>
<{foreach from=$messages.userrole key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.userrole.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="userrole_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.usermembership) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowtransition) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="userroletabs" class="section">
                <ul>
                                            <{if Framework::hasModule('UserMembership') && isset($smarty.session.acl.usermembership) }>
                            <li><a href="#tab-usermemberships"><{label key="L_USER_MEMBERSHIP"}> <span class="badge usermembership-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                            <li><a href="#tab-workflowtransitions"><{label key="L_WORKFLOW_TRANSITION"}> <span class="badge workflowtransition-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('UserMembership') && isset($smarty.session.acl.usermembership) }>
                        <div id="tab-usermemberships">
                        	<{if true || $tab == 'usermemberships'}>
                            	<h2 class="print"><{label key="L_USER_MEMBERSHIP"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserMembership" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER_ROLE="`$details->ID`" where=""  template='widgetlist.usermembership.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                        <div id="tab-workflowtransitions">
                        	<{if true || $tab == 'workflowtransitions'}>
                            	<h2 class="print"><{label key="L_WORKFLOW_TRANSITION"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowTransition" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER_ROLE="`$details->ID`" where=""  template='widgetlist.workflowtransition.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#userroletabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("userrole_active_tab", $("#userroletabs").tabs("option", "active"));
//                        },
//                        active: $("#userroletabs").tabs({ active: $.cookie("userrole_active_tab") })
                    });
                	$("#userroletabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#userroletabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#userroletabs .expand-collapse');

                	var details = $('#userroleview .view-main');

                    if ($.cookie('userroleexpandcollapse') == 'collapsed') {
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

                            $.cookie('userroleexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('userroleexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="userrole-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/userrole/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#userroleview .form-field-value .column-name');
    	var mirror = $('#userroleview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userroleview', 'f2', '.button-edit');
    	bind_hotkey('#userroleview', 'esc', '.button-close');
    	bind_hotkey('#userroleview', 'left', '.button-view-prev');
    	bind_hotkey('#userroleview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userroleview :focusable:first').focus();
        }

    	$('#userroleview').click(function(){
    	    var focused = $('#userroleview :focus');

    	    if (focused.length == 0) {
                $('#userroleview :focusable:first').focus();
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
