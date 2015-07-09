    <{assign var='meta_description' value=$details->TITLE}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('L_VIEW')}>
        <{$tmp2 = strtolower(_t('L_SCREEN'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$previd}>"><{_t('L_PREV')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$nextid}>"><{_t('L_NEXT')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="screen-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#screen-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/screen/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#screenview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.screen.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.screen.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('L_EDIT')}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.screen.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/delete/<{$details->UUID}>" title="<{_t('L_DELETE')}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.screen[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/screen/close/"><span class="button-face"><{_t('L_CLOSE')}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="screenview" class="screen-view view_details mainview">

<{if isset($messages.screen) }>
<{foreach from=$messages.screen key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-title hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.screen.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="screen_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.screenfield) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowtransition) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="screentabs" class="section">
                <ul>
                                            <{if Framework::hasModule('ScreenField') && isset($smarty.session.acl.screenfield) }>
                            <li><a href="#tab-screenfields"><{_t('L_SCREEN_FIELD')}> <span class="badge screenfield-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                            <li><a href="#tab-workflowtransitions"><{_t('L_WORKFLOW_TRANSITION')}> <span class="badge workflowtransition-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('ScreenField') && isset($smarty.session.acl.screenfield) }>
                        <div id="tab-screenfields">
                        	<{if true || $tab == 'screenfields'}>
                            	<h2 class="print"><{_t('L_SCREEN_FIELD')}></h2>
                                                                    <{ajaxmodule class="WidgetListScreenField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_SCREEN="`$details->CODE`" where=""  template='widgetlist.screenfield.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                        <div id="tab-workflowtransitions">
                        	<{if true || $tab == 'workflowtransitions'}>
                            	<h2 class="print"><{_t('L_WORKFLOW_TRANSITION')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowTransition" method="" readonly=!WorkflowHelper::isEditable($details->WFID) TRANSITION_ID_SCREEN="`$details->CODE`" where="" ID_WORKFLOW="`$details->ID_WORKFLOW`" template='widgetlist.workflowtransition.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#screentabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("screen_active_tab", $("#screentabs").tabs("option", "active"));
//                        },
//                        active: $("#screentabs").tabs({ active: $.cookie("screen_active_tab") })
                    });
                	$("#screentabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#screentabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#screentabs .expand-collapse');

                	var details = $('#screenview .view-main');

                    if ($.cookie('screenexpandcollapse') == 'collapsed') {
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

                            $.cookie('screenexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('screenexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="screen-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/screen/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#screenview .form-field-value .column-title');
    	var mirror = $('#screenview .mirror-title');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#screenview', 'f2', '.button-edit');
    	bind_hotkey('#screenview', 'esc', '.button-close');
    	bind_hotkey('#screenview', 'left', '.button-view-prev');
    	bind_hotkey('#screenview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#screenview :focusable:first').focus();
        }

    	$('#screenview').click(function(){
    	    var focused = $('#screenview :focus');

    	    if (focused.length == 0) {
                $('#screenview :focusable:first').focus();
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
