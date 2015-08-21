    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('User Invitation Status'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="userinvitationstatus-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#userinvitationstatus-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#userinvitationstatusview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.userinvitationstatus.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.userinvitationstatus.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.userinvitationstatus.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/delete/<{$details->UUID}>" title="<{_t('Delete', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options || isset($smarty.session.acl.userinvitationstatus.customfields)}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.userinvitationstatus[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                        <{if isset($smarty.session.acl.userinvitationstatus.customfields)}>
                            <li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/customfield/manage/userinvitationstatus"><{_t('Manage custom fields')}></a></li>
                        <{/if}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/close/"><span class="button-face"><{_t('Close')}></span></a>
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

<div id="userinvitationstatusview" class="userinvitationstatus-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.userinvitationstatus.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="userinvitationstatus_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.userinvitation) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="userinvitationstatustabs" class="section">
                <ul>
                                            <{if Framework::hasModule('UserInvitation') && isset($smarty.session.acl.userinvitation) }>
                            <li><a href="#tab-userinvitations"><{_t('User invitation')}> <span class="badge userinvitation-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('UserInvitation') && isset($smarty.session.acl.userinvitation) }>
                        <div id="tab-userinvitations">
                        	<{if true || $tab == 'userinvitations'}>
                            	<h2 class="print"><{_t('User invitation')}></h2>
                                                                    <{ajaxmodule class="WidgetListUserInvitation" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_USER_INVITATION_STATUS="`$details->CODE`" where=""  template='widgetlist.userinvitation.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#userinvitationstatustabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("userinvitationstatus_active_tab", $("#userinvitationstatustabs").tabs("option", "active"));
//                        },
//                        active: $("#userinvitationstatustabs").tabs({ active: $.cookie("userinvitationstatus_active_tab") })
                    });
                	$("#userinvitationstatustabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#userinvitationstatustabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#userinvitationstatustabs .expand-collapse');

                	var details = $('#userinvitationstatusview .view-main');

                    if ($.cookie('userinvitationstatusexpandcollapse') == 'collapsed') {
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

                            $.cookie('userinvitationstatusexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('userinvitationstatusexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="userinvitationstatus-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/userinvitationstatus/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#userinvitationstatusview .form-field-value .column-name');
    	var mirror = $('#userinvitationstatusview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userinvitationstatusview', 'f2', '.button-edit');
    	bind_hotkey('#userinvitationstatusview', 'esc', '.button-close');
    	bind_hotkey('#userinvitationstatusview', 'left', '.button-view-prev');
    	bind_hotkey('#userinvitationstatusview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userinvitationstatusview :focusable:first').focus();
        }

    	$('#userinvitationstatusview').click(function(){
    	    var focused = $('#userinvitationstatusview :focus');

    	    if (focused.length == 0) {
                $('#userinvitationstatusview :focusable:first').focus();
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
