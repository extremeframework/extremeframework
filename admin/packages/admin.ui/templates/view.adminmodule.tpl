    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp1 = _t('View')}>
        <{$tmp2 = strtolower(_t('Admin Module'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$previd}>"><{_t('Prev')}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$nextid}>"><{_t('Next')}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="adminmodule-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#adminmodule-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/adminmodule/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#adminmoduleview .button-edit').focus();
                });
            </script>

            <{if isset($smarty.session.acl.adminmodule.new) }>
                &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new"><i class="fa fa-plus"></i></a>
            <{/if}>
        </span>
    </h1>

<!-- Control bar -->
<div class="view-control-bar hidden-print">
    <!-- Language bar -->
    
    <!-- Control buttons -->
    <div class="view-buttons">
    	<{if $details->UUID}>
    		    			<{if isset($smarty.session.acl.adminmodule.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{_t('Edit', true)}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.adminmodule.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/delete/<{$details->UUID}>" title="<{_t('Delete', true)}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.adminmodule[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{_t($item->TITLE)}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/close/"><span class="button-face"><{_t('Close')}></span></a>
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

<div id="adminmoduleview" class="adminmodule-view view_details mainview">

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue wf-<{$details->WFID}>"><{_t($details->WFID)}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.adminmodule.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="adminmodule_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.accessright) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminfilter) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlayoutfield) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlayoutsection) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminmenuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminsequence) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminview) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.changelog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.field) }>
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
            <{if isset($smarty.session.acl.template) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowapplication) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowlog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="adminmoduletabs" class="section">
                <ul>
                                            <{if Framework::hasModule('AccessRight') && isset($smarty.session.acl.accessright) }>
                            <li><a href="#tab-accessrights"><{_t('Access right')}> <span class="badge accessright-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminFilter') && isset($smarty.session.acl.adminfilter) }>
                            <li><a href="#tab-adminfilters"><{_t('Admin filter')}> <span class="badge adminfilter-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLayoutField') && isset($smarty.session.acl.adminlayoutfield) }>
                            <li><a href="#tab-adminlayoutfields"><{_t('Admin layout field')}> <span class="badge adminlayoutfield-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLayoutSection') && isset($smarty.session.acl.adminlayoutsection) }>
                            <li><a href="#tab-adminlayoutsections"><{_t('Admin layout section')}> <span class="badge adminlayoutsection-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                            <li><a href="#tab-adminmenuitems"><{_t('Admin menu item')}> <span class="badge adminmenuitem-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminSequence') && isset($smarty.session.acl.adminsequence) }>
                            <li><a href="#tab-adminsequences"><{_t('Admin sequence')}> <span class="badge adminsequence-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminView') && isset($smarty.session.acl.adminview) }>
                            <li><a href="#tab-adminviews"><{_t('Admin view')}> <span class="badge adminview-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                            <li><a href="#tab-changelogs"><{_t('Change log')}> <span class="badge changelog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Field') && isset($smarty.session.acl.field) }>
                            <li><a href="#tab-fields"><{_t('Field')}> <span class="badge field-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                            <li><a href="#tab-fieldacls"><{_t('Field acl')}> <span class="badge fieldacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                            <li><a href="#tab-objectacls"><{_t('Object acl')}> <span class="badge objectacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                            <li><a href="#tab-recyclebins"><{_t('Recycle bin')}> <span class="badge recyclebin-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Template') && isset($smarty.session.acl.template) }>
                            <li><a href="#tab-templates"><{_t('Template')}> <span class="badge template-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                            <li><a href="#tab-workflowapplications"><{_t('Workflow application')}> <span class="badge workflowapplication-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                            <li><a href="#tab-workflowlogs"><{_t('Workflow log')}> <span class="badge workflowlog-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('AccessRight') && isset($smarty.session.acl.accessright) }>
                        <div id="tab-accessrights">
                        	<{if true || $tab == 'accessrights'}>
                            	<h2 class="print"><{_t('Access right')}></h2>
                                                                    <{ajaxmodule class="WidgetListAccessRight" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.accessright.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminFilter') && isset($smarty.session.acl.adminfilter) }>
                        <div id="tab-adminfilters">
                        	<{if true || $tab == 'adminfilters'}>
                            	<h2 class="print"><{_t('Admin filter')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminFilter" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminfilter.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLayoutField') && isset($smarty.session.acl.adminlayoutfield) }>
                        <div id="tab-adminlayoutfields">
                        	<{if true || $tab == 'adminlayoutfields'}>
                            	<h2 class="print"><{_t('Admin layout field')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLayoutField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminlayoutfield.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLayoutSection') && isset($smarty.session.acl.adminlayoutsection) }>
                        <div id="tab-adminlayoutsections">
                        	<{if true || $tab == 'adminlayoutsections'}>
                            	<h2 class="print"><{_t('Admin layout section')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLayoutSection" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminlayoutsection.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                        <div id="tab-adminmenuitems">
                        	<{if true || $tab == 'adminmenuitems'}>
                            	<h2 class="print"><{_t('Admin menu item')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminmenuitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminSequence') && isset($smarty.session.acl.adminsequence) }>
                        <div id="tab-adminsequences">
                        	<{if true || $tab == 'adminsequences'}>
                            	<h2 class="print"><{_t('Admin sequence')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminSequence" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminsequence.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminView') && isset($smarty.session.acl.adminview) }>
                        <div id="tab-adminviews">
                        	<{if true || $tab == 'adminviews'}>
                            	<h2 class="print"><{_t('Admin view')}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminView" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.adminview.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                        <div id="tab-changelogs">
                        	<{if true || $tab == 'changelogs'}>
                            	<h2 class="print"><{_t('Change log')}></h2>
                                                                    <{ajaxmodule class="WidgetListChangeLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.changelog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Field') && isset($smarty.session.acl.field) }>
                        <div id="tab-fields">
                        	<{if true || $tab == 'fields'}>
                            	<h2 class="print"><{_t('Field')}></h2>
                                                                    <{ajaxmodule class="WidgetListField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.field.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                        <div id="tab-fieldacls">
                        	<{if true || $tab == 'fieldacls'}>
                            	<h2 class="print"><{_t('Field acl')}></h2>
                                                                    <{ajaxmodule class="WidgetListFieldAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.fieldacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                        <div id="tab-objectacls">
                        	<{if true || $tab == 'objectacls'}>
                            	<h2 class="print"><{_t('Object acl')}></h2>
                                                                    <{ajaxmodule class="WidgetListObjectAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.objectacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                        <div id="tab-recyclebins">
                        	<{if true || $tab == 'recyclebins'}>
                            	<h2 class="print"><{_t('Recycle bin')}></h2>
                                                                    <{ajaxmodule class="WidgetListRecycleBin" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.recyclebin.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Template') && isset($smarty.session.acl.template) }>
                        <div id="tab-templates">
                        	<{if true || $tab == 'templates'}>
                            	<h2 class="print"><{_t('Template')}></h2>
                                                                    <{ajaxmodule class="WidgetListTemplate" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.template.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                        <div id="tab-workflowapplications">
                        	<{if true || $tab == 'workflowapplications'}>
                            	<h2 class="print"><{_t('Workflow application')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowApplication" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where=""  template='widgetlist.workflowapplication.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                        <div id="tab-workflowlogs">
                        	<{if true || $tab == 'workflowlogs'}>
                            	<h2 class="print"><{_t('Workflow log')}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) MODULE="`$details->ID`" where="" MODULE="`$details->MODULE`" template='widgetlist.workflowlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#adminmoduletabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("adminmodule_active_tab", $("#adminmoduletabs").tabs("option", "active"));
//                        },
//                        active: $("#adminmoduletabs").tabs({ active: $.cookie("adminmodule_active_tab") })
                    });
                	$("#adminmoduletabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#adminmoduletabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#adminmoduletabs .expand-collapse');

                	var details = $('#adminmoduleview .view-main');

                    if ($.cookie('adminmoduleexpandcollapse') == 'collapsed') {
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

                            $.cookie('adminmoduleexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('adminmoduleexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="adminmodule-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/adminmodule/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#adminmoduleview .form-field-value .column-name');
    	var mirror = $('#adminmoduleview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmoduleview', 'f2', '.button-edit');
    	bind_hotkey('#adminmoduleview', 'esc', '.button-close');
    	bind_hotkey('#adminmoduleview', 'left', '.button-view-prev');
    	bind_hotkey('#adminmoduleview', 'right', '.button-view-next');
    });

    $(function() {
    	$('body').attr('data-type', 'view');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmoduleview :focusable:first').focus();
        }

    	$('#adminmoduleview').click(function(){
    	    var focused = $('#adminmoduleview :focus');

    	    if (focused.length == 0) {
                $('#adminmoduleview :focusable:first').focus();
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
