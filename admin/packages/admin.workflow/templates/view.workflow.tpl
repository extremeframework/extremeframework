    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('L_WORKFLOW'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="workflow-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#workflow-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/workflow/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#workflowview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.workflow.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.workflow.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.workflow.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/delete/<{$details->UUID}>" title="<{_t('L_DELETE', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.workflow[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/close/?return=<{ContextStack::getRecentContext()}>"><span class="button-face"><{_t('Close')}></span></a>
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

<div id="workflowview" class="workflow-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.workflow.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="workflow_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.screen) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowapplication) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowlog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowstage) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowtransition) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="workflowtabs" class="section">
                <ul>
                                            <{if Framework::hasModule('Screen') && isset($smarty.session.acl.screen) }>
                            <li><a href="#tab-screens"><{_t('L_SCREEN')}> <span class="badge screen-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                            <li><a href="#tab-workflowapplications"><{_t('L_WORKFLOW_APPLICATION')}> <span class="badge workflowapplication-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                            <li><a href="#tab-workflowlogs"><{_t('L_WORKFLOW_LOG')}> <span class="badge workflowlog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowStage') && isset($smarty.session.acl.workflowstage) }>
                            <li><a href="#tab-workflowstages"><{_t('L_WORKFLOW_STAGE')}> <span class="badge workflowstage-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                            <li><a href="#tab-workflowtransitions"><{_t('L_WORKFLOW_TRANSITION')}> <span class="badge workflowtransition-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('Screen') && isset($smarty.session.acl.screen) }>
                        <div id="tab-screens">
                        	<{if true || $tab == 'screens'}>
                            	<h2 class="print"><{_t('L_SCREEN')}></h2>
                                                                    <{ajaxmodule class="WidgetListScreen" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_WORKFLOW="`$details->CODE`" where=""  template='widgetlist.screen.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                        <div id="tab-workflowapplications">
                        	<{if true || $tab == 'workflowapplications'}>
                            	<h2 class="print"><{_t('L_WORKFLOW_APPLICATION')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowApplication" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_WORKFLOW="`$details->CODE`" where=""  template='widgetlist.workflowapplication.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                        <div id="tab-workflowlogs">
                        	<{if true || $tab == 'workflowlogs'}>
                            	<h2 class="print"><{_t('L_WORKFLOW_LOG')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_WORKFLOW="`$details->CODE`" where=""  template='widgetlist.workflowlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowStage') && isset($smarty.session.acl.workflowstage) }>
                        <div id="tab-workflowstages">
                        	<{if true || $tab == 'workflowstages'}>
                            	<h2 class="print"><{_t('L_WORKFLOW_STAGE')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowStage" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_WORKFLOW="`$details->CODE`" where=""  template='widgetlist.workflowstage.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                        <div id="tab-workflowtransitions">
                        	<{if true || $tab == 'workflowtransitions'}>
                            	<h2 class="print"><{_t('L_WORKFLOW_TRANSITION')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowTransition" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_WORKFLOW="`$details->CODE`" where=""  template='widgetlist.workflowtransition.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#workflowtabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("workflow_active_tab", $("#workflowtabs").tabs("option", "active"));
//                        },
//                        active: $("#workflowtabs").tabs({ active: $.cookie("workflow_active_tab") })
                    });
                	$("#workflowtabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#workflowtabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#workflowtabs .expand-collapse');

                	var details = $('#workflowview .view-main');

                    if ($.cookie('workflowexpandcollapse') == 'collapsed') {
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

                            $.cookie('workflowexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('workflowexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="workflow-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/workflow/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#workflowview .form-field-value .column-name');
    	var mirror = $('#workflowview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#workflowview', 'f2', '.button-edit');
    	bind_hotkey('#workflowview', 'esc', '.button-close');
    	bind_hotkey('#workflowview', 'left', '.button-view-prev');
    	bind_hotkey('#workflowview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowview :focusable:first').focus();
        }

    	$('#workflowview').click(function(){
    	    var focused = $('#workflowview :focus');

    	    if (focused.length == 0) {
                $('#workflowview :focusable:first').focus();
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
