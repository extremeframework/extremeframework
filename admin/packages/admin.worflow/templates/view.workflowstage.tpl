    <{assign var='meta_description' value=$details->NAME}>
    <{include file="header.tpl"}>
    </head>

    <body class="module module-<{$module}>" id="<{$module}>">

            <{$tmp = strtolower($smarty.const.L_WORKFLOW_STAGE)}>
        <{$title = "`$smarty.const.L_VIEW` $tmp"}>
    
    <{include file="top.tpl"}>

    <h1 class="heading">
        <span class="h"><{$title}></span>

        <!-- Prev / Next -->
        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <{if $previd}>
                <a style="text-decoration: none" class="button-view-prev scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$previd}>"><{label key="L_PREV"}></a>&nbsp;
            <{/if}>
            <{if $nextid}>
                <a style="text-decoration: none" class="button-view-next scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$nextid}>"><{label key="L_NEXT"}></a>
            <{/if}>
            &nbsp;&nbsp;<a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->UUID}>"><i class="fa fa-refresh"></i></a>

            <!-- Live search -->
            <span id="workflowstage-live-search" class="live-search view-live-search"><input type="text" onfocus="if (this.value == '<{label text="Quick search" insidequote=true}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{label text="Quick search" insidequote=true}>...';}" value="<{label text="Quick search" insidequote=true}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#workflowstage-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/workflowstage/liveSearch?term='});

            	    $('#jquery-live-search').hide();
            	    $('#workflowstageview .button-edit').focus();
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
    		    			<{if isset($smarty.session.acl.workflowstage.edit) && WorkflowHelper::isEditable($details->WFID)}>
        		    <div class="button-general">
        		        <a class="button-edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/edit/<{$details->UUID}><{if isset($preset)}>/preset/<{$preset}><{/if}><{if isset($presetvalue)}>/presetvalue/<{$presetvalue}><{/if}>" title="<{$smarty.const.L_EDIT}>"><i class="fa fa-pencil"></i></a>
        		    </div>
    		    <{/if}>
    		    	    <{foreach from=$additional_view_buttons item=button}>
    		    <div class="button-general button-additional">
    		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>" title="<{$button.title}>"><{if $button.code == 'delete'}><i class="fa fa-trash-o"></i><{else}><span class="button-face"><{$button.title}></span><{/if}></a>
    		    </div>
    	    <{/foreach}>
    	        	        
    	    	    		            		            <{if isset($smarty.session.acl.workflowstage.delete) && WorkflowHelper::isDeletable($details->WFID)}>
    		            		            <div class="button-general">
    		                <a class="button-delete scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/delete/<{$details->UUID}>" title="<{$smarty.const.L_DELETE}>"><i class="fa fa-trash-o"></i></a>
    		            </div>
    		            		            <{/if}>
    		            	            	            <{else}>
    		        <{/if}>

    	            <{if $admin_view_actions || $admin_view_options}>
        	    <div class="button-general dropdown">
        	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
        	        <ul class="dropdown-menu pull-right">
                        <{foreach from=$admin_view_actions item=item}>
                            <{if empty($item->ACL) || isset($smarty.session.acl.workflowstage[$item->ACL])}>
                                <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> href="<{framework_report_link format=$item->LINK data=$details}>"><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                            <{/if}>
                        <{/foreach}>
        	            <{foreach from=$admin_view_options item=item}>
                            <li><a <{if $item->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/workflowstage/view/<{$details->UUID}>/<{$item->CODE}>"><{$item->TITLE}></a></li>
                        <{/foreach}>
                    </ul>
        	    </div>
            <{/if}>
            <div class="button-general">
                <a class="button-close scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/close/"><span class="button-face"><{label key="L_CLOSE"}></span></a>
            </div>
    	        <div class="clearer"></div>
    </div>
</div>

<div id="workflowstageview" class="workflowstage-view view_details mainview">

<{if isset($messages.workflowstage) }>
<{foreach from=$messages.workflowstage key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<!-- Details -->
<div class="section">
    
    <div>
        <{if $details->WFID}><div class="corner-ribbon top-right sticky blue <{$details->WFID}>"><{$details->WFID}></div><{/if}>
        <div class="mirror-name hidden-print" style="clear:none;display:none;"></div>
        <div style="clear:both"></div>
        <{include file="view-main.workflowstage.tpl"}>
    </div>

    <!--div class="right-ads">
        <{module class="AdsModule" position="right" template="mod.ads.tpl"}>
    </div-->

    <div class="clearer"></div>
</div>

    <{plugin key="workflowstage_view_before_tabs" args=$details}>

    <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.accessright) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.acltype) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminfilter) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlabel) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlanguage) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlanguageitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlayoutfield) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminlayoutsection) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminmenu) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminmenuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.adminmodule) }>
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
            <{if isset($smarty.session.acl.dashboard) }>
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
            <{if isset($smarty.session.acl.option) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.parameter) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.parametergroup) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.parametertype) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.recyclebin) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.screen) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.screenfield) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.user) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.usergroup) }>
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
            <{if isset($smarty.session.acl.userrole) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.valuetype) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflow) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowapplication) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowlog) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.workflowtransition) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
            <{if $canaccess2anytab}>
            <div id="workflowstagetabs" class="section">
                <ul>
                                            <{if Framework::hasModule('AccessRight') && isset($smarty.session.acl.accessright) }>
                            <li><a href="#tab-accessrights"><{label key="L_ACCESS_RIGHT"}> <span class="badge accessright-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AclType') && isset($smarty.session.acl.acltype) }>
                            <li><a href="#tab-acltypes"><{label key="L_ACL_TYPE"}> <span class="badge acltype-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminFilter') && isset($smarty.session.acl.adminfilter) }>
                            <li><a href="#tab-adminfilters"><{label key="L_ADMIN_FILTER"}> <span class="badge adminfilter-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLabel') && isset($smarty.session.acl.adminlabel) }>
                            <li><a href="#tab-adminlabels"><{label key="L_ADMIN_LABEL"}> <span class="badge adminlabel-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLanguage') && isset($smarty.session.acl.adminlanguage) }>
                            <li><a href="#tab-adminlanguages"><{label key="L_ADMIN_LANGUAGE"}> <span class="badge adminlanguage-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLanguageItem') && isset($smarty.session.acl.adminlanguageitem) }>
                            <li><a href="#tab-adminlanguageitems"><{label key="L_ADMIN_LANGUAGE_ITEM"}> <span class="badge adminlanguageitem-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLayoutField') && isset($smarty.session.acl.adminlayoutfield) }>
                            <li><a href="#tab-adminlayoutfields"><{label key="L_ADMIN_LAYOUT_FIELD"}> <span class="badge adminlayoutfield-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminLayoutSection') && isset($smarty.session.acl.adminlayoutsection) }>
                            <li><a href="#tab-adminlayoutsections"><{label key="L_ADMIN_LAYOUT_SECTION"}> <span class="badge adminlayoutsection-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminMenu') && isset($smarty.session.acl.adminmenu) }>
                            <li><a href="#tab-adminmenus"><{label key="L_ADMIN_MENU"}> <span class="badge adminmenu-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                            <li><a href="#tab-adminmenuitems"><{label key="L_ADMIN_MENU_ITEM"}> <span class="badge adminmenuitem-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminModule') && isset($smarty.session.acl.adminmodule) }>
                            <li><a href="#tab-adminmodules"><{label key="L_ADMIN_MODULE"}> <span class="badge adminmodule-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminSequence') && isset($smarty.session.acl.adminsequence) }>
                            <li><a href="#tab-adminsequences"><{label key="L_ADMIN_SEQUENCE"}> <span class="badge adminsequence-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('AdminView') && isset($smarty.session.acl.adminview) }>
                            <li><a href="#tab-adminviews"><{label key="L_ADMIN_VIEW"}> <span class="badge adminview-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                            <li><a href="#tab-changelogs"><{label key="L_CHANGE_LOG"}> <span class="badge changelog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Dashboard') && isset($smarty.session.acl.dashboard) }>
                            <li><a href="#tab-dashboards"><{label key="L_DASHBOARD"}> <span class="badge dashboard-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Field') && isset($smarty.session.acl.field) }>
                            <li><a href="#tab-fields"><{label key="L_FIELD"}> <span class="badge field-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                            <li><a href="#tab-fieldacls"><{label key="L_FIELD_ACL"}> <span class="badge fieldacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                            <li><a href="#tab-objectacls"><{label key="L_OBJECT_ACL"}> <span class="badge objectacl-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Option') && isset($smarty.session.acl.option) }>
                            <li><a href="#tab-options"><{label key="L_OPTION"}> <span class="badge option-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Parameter') && isset($smarty.session.acl.parameter) }>
                            <li><a href="#tab-parameters"><{label key="L_PARAMETER"}> <span class="badge parameter-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ParameterGroup') && isset($smarty.session.acl.parametergroup) }>
                            <li><a href="#tab-parametergroups"><{label key="L_PARAMETER_GROUP"}> <span class="badge parametergroup-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ParameterType') && isset($smarty.session.acl.parametertype) }>
                            <li><a href="#tab-parametertypes"><{label key="L_PARAMETER_TYPE"}> <span class="badge parametertype-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                            <li><a href="#tab-recyclebins"><{label key="L_RECYCLE_BIN"}> <span class="badge recyclebin-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Screen') && isset($smarty.session.acl.screen) }>
                            <li><a href="#tab-screens"><{label key="L_SCREEN"}> <span class="badge screen-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ScreenField') && isset($smarty.session.acl.screenfield) }>
                            <li><a href="#tab-screenfields"><{label key="L_SCREEN_FIELD"}> <span class="badge screenfield-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('User') && isset($smarty.session.acl.user) }>
                            <li><a href="#tab-users"><{label key="L_USER"}> <span class="badge user-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('UserGroup') && isset($smarty.session.acl.usergroup) }>
                            <li><a href="#tab-usergroups"><{label key="L_USER_GROUP"}> <span class="badge usergroup-badge-count"></span></a></li>
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
                                            <{if Framework::hasModule('UserRole') && isset($smarty.session.acl.userrole) }>
                            <li><a href="#tab-userroles"><{label key="L_USER_ROLE"}> <span class="badge userrole-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('ValueType') && isset($smarty.session.acl.valuetype) }>
                            <li><a href="#tab-valuetypes"><{label key="L_VALUE_TYPE"}> <span class="badge valuetype-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('Workflow') && isset($smarty.session.acl.workflow) }>
                            <li><a href="#tab-workflows"><{label key="L_WORKFLOW"}> <span class="badge workflow-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                            <li><a href="#tab-workflowapplications"><{label key="L_WORKFLOW_APPLICATION"}> <span class="badge workflowapplication-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                            <li><a href="#tab-workflowlogs"><{label key="L_WORKFLOW_LOG"}> <span class="badge workflowlog-badge-count"></span></a></li>
                        <{/if}>
                                            <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                            <li><a href="#tab-workflowtransitions"><{label key="L_WORKFLOW_TRANSITION"}> <span class="badge workflowtransition-badge-count"></span></a></li>
                        <{/if}>
                                    </ul>

                                    <{if Framework::hasModule('AccessRight') && isset($smarty.session.acl.accessright) }>
                        <div id="tab-accessrights">
                        	<{if true || $tab == 'accessrights'}>
                            	<h2 class="print"><{label key="L_ACCESS_RIGHT"}></h2>
                                                                    <{ajaxmodule class="WidgetListAccessRight" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.accessright.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AclType') && isset($smarty.session.acl.acltype) }>
                        <div id="tab-acltypes">
                        	<{if true || $tab == 'acltypes'}>
                            	<h2 class="print"><{label key="L_ACL_TYPE"}></h2>
                                                                    <{ajaxmodule class="WidgetListAclType" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.acltype.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminFilter') && isset($smarty.session.acl.adminfilter) }>
                        <div id="tab-adminfilters">
                        	<{if true || $tab == 'adminfilters'}>
                            	<h2 class="print"><{label key="L_ADMIN_FILTER"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminFilter" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminfilter.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLabel') && isset($smarty.session.acl.adminlabel) }>
                        <div id="tab-adminlabels">
                        	<{if true || $tab == 'adminlabels'}>
                            	<h2 class="print"><{label key="L_ADMIN_LABEL"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLabel" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminlabel.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLanguage') && isset($smarty.session.acl.adminlanguage) }>
                        <div id="tab-adminlanguages">
                        	<{if true || $tab == 'adminlanguages'}>
                            	<h2 class="print"><{label key="L_ADMIN_LANGUAGE"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLanguage" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminlanguage.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLanguageItem') && isset($smarty.session.acl.adminlanguageitem) }>
                        <div id="tab-adminlanguageitems">
                        	<{if true || $tab == 'adminlanguageitems'}>
                            	<h2 class="print"><{label key="L_ADMIN_LANGUAGE_ITEM"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLanguageItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminlanguageitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLayoutField') && isset($smarty.session.acl.adminlayoutfield) }>
                        <div id="tab-adminlayoutfields">
                        	<{if true || $tab == 'adminlayoutfields'}>
                            	<h2 class="print"><{label key="L_ADMIN_LAYOUT_FIELD"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLayoutField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminlayoutfield.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminLayoutSection') && isset($smarty.session.acl.adminlayoutsection) }>
                        <div id="tab-adminlayoutsections">
                        	<{if true || $tab == 'adminlayoutsections'}>
                            	<h2 class="print"><{label key="L_ADMIN_LAYOUT_SECTION"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminLayoutSection" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminlayoutsection.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminMenu') && isset($smarty.session.acl.adminmenu) }>
                        <div id="tab-adminmenus">
                        	<{if true || $tab == 'adminmenus'}>
                            	<h2 class="print"><{label key="L_ADMIN_MENU"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminMenu" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminmenu.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminMenuItem') && isset($smarty.session.acl.adminmenuitem) }>
                        <div id="tab-adminmenuitems">
                        	<{if true || $tab == 'adminmenuitems'}>
                            	<h2 class="print"><{label key="L_ADMIN_MENU_ITEM"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminmenuitem.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminModule') && isset($smarty.session.acl.adminmodule) }>
                        <div id="tab-adminmodules">
                        	<{if true || $tab == 'adminmodules'}>
                            	<h2 class="print"><{label key="L_ADMIN_MODULE"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminModule" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminmodule.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminSequence') && isset($smarty.session.acl.adminsequence) }>
                        <div id="tab-adminsequences">
                        	<{if true || $tab == 'adminsequences'}>
                            	<h2 class="print"><{label key="L_ADMIN_SEQUENCE"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminSequence" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminsequence.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('AdminView') && isset($smarty.session.acl.adminview) }>
                        <div id="tab-adminviews">
                        	<{if true || $tab == 'adminviews'}>
                            	<h2 class="print"><{label key="L_ADMIN_VIEW"}></h2>
                                                                    <{ajaxmodule class="WidgetListAdminView" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.adminview.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ChangeLog') && isset($smarty.session.acl.changelog) }>
                        <div id="tab-changelogs">
                        	<{if true || $tab == 'changelogs'}>
                            	<h2 class="print"><{label key="L_CHANGE_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListChangeLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.changelog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Dashboard') && isset($smarty.session.acl.dashboard) }>
                        <div id="tab-dashboards">
                        	<{if true || $tab == 'dashboards'}>
                            	<h2 class="print"><{label key="L_DASHBOARD"}></h2>
                                                                    <{ajaxmodule class="WidgetListDashboard" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.dashboard.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Field') && isset($smarty.session.acl.field) }>
                        <div id="tab-fields">
                        	<{if true || $tab == 'fields'}>
                            	<h2 class="print"><{label key="L_FIELD"}></h2>
                                                                    <{ajaxmodule class="WidgetListField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.field.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('FieldAcl') && isset($smarty.session.acl.fieldacl) }>
                        <div id="tab-fieldacls">
                        	<{if true || $tab == 'fieldacls'}>
                            	<h2 class="print"><{label key="L_FIELD_ACL"}></h2>
                                                                    <{ajaxmodule class="WidgetListFieldAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.fieldacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ObjectAcl') && isset($smarty.session.acl.objectacl) }>
                        <div id="tab-objectacls">
                        	<{if true || $tab == 'objectacls'}>
                            	<h2 class="print"><{label key="L_OBJECT_ACL"}></h2>
                                                                    <{ajaxmodule class="WidgetListObjectAcl" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.objectacl.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Option') && isset($smarty.session.acl.option) }>
                        <div id="tab-options">
                        	<{if true || $tab == 'options'}>
                            	<h2 class="print"><{label key="L_OPTION"}></h2>
                                                                    <{ajaxmodule class="WidgetListOption" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.option.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Parameter') && isset($smarty.session.acl.parameter) }>
                        <div id="tab-parameters">
                        	<{if true || $tab == 'parameters'}>
                            	<h2 class="print"><{label key="L_PARAMETER"}></h2>
                                                                    <{ajaxmodule class="WidgetListParameter" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.parameter.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ParameterGroup') && isset($smarty.session.acl.parametergroup) }>
                        <div id="tab-parametergroups">
                        	<{if true || $tab == 'parametergroups'}>
                            	<h2 class="print"><{label key="L_PARAMETER_GROUP"}></h2>
                                                                    <{ajaxmodule class="WidgetListParameterGroup" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.parametergroup.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ParameterType') && isset($smarty.session.acl.parametertype) }>
                        <div id="tab-parametertypes">
                        	<{if true || $tab == 'parametertypes'}>
                            	<h2 class="print"><{label key="L_PARAMETER_TYPE"}></h2>
                                                                    <{ajaxmodule class="WidgetListParameterType" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.parametertype.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('RecycleBin') && isset($smarty.session.acl.recyclebin) }>
                        <div id="tab-recyclebins">
                        	<{if true || $tab == 'recyclebins'}>
                            	<h2 class="print"><{label key="L_RECYCLE_BIN"}></h2>
                                                                    <{ajaxmodule class="WidgetListRecycleBin" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.recyclebin.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Screen') && isset($smarty.session.acl.screen) }>
                        <div id="tab-screens">
                        	<{if true || $tab == 'screens'}>
                            	<h2 class="print"><{label key="L_SCREEN"}></h2>
                                                                    <{ajaxmodule class="WidgetListScreen" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.screen.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ScreenField') && isset($smarty.session.acl.screenfield) }>
                        <div id="tab-screenfields">
                        	<{if true || $tab == 'screenfields'}>
                            	<h2 class="print"><{label key="L_SCREEN_FIELD"}></h2>
                                                                    <{ajaxmodule class="WidgetListScreenField" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.screenfield.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('User') && isset($smarty.session.acl.user) }>
                        <div id="tab-users">
                        	<{if true || $tab == 'users'}>
                            	<h2 class="print"><{label key="L_USER"}></h2>
                                                                    <{ajaxmodule class="WidgetListUser" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.user.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserGroup') && isset($smarty.session.acl.usergroup) }>
                        <div id="tab-usergroups">
                        	<{if true || $tab == 'usergroups'}>
                            	<h2 class="print"><{label key="L_USER_GROUP"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserGroup" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.usergroup.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserLog') && isset($smarty.session.acl.userlog) }>
                        <div id="tab-userlogs">
                        	<{if true || $tab == 'userlogs'}>
                            	<h2 class="print"><{label key="L_USER_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.userlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserMembership') && isset($smarty.session.acl.usermembership) }>
                        <div id="tab-usermemberships">
                        	<{if true || $tab == 'usermemberships'}>
                            	<h2 class="print"><{label key="L_USER_MEMBERSHIP"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserMembership" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.usermembership.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserPreference') && isset($smarty.session.acl.userpreference) }>
                        <div id="tab-userpreferences">
                        	<{if true || $tab == 'userpreferences'}>
                            	<h2 class="print"><{label key="L_USER_PREFERENCE"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserPreference" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.userpreference.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('UserRole') && isset($smarty.session.acl.userrole) }>
                        <div id="tab-userroles">
                        	<{if true || $tab == 'userroles'}>
                            	<h2 class="print"><{label key="L_USER_ROLE"}></h2>
                                                                    <{ajaxmodule class="WidgetListUserRole" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.userrole.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('ValueType') && isset($smarty.session.acl.valuetype) }>
                        <div id="tab-valuetypes">
                        	<{if true || $tab == 'valuetypes'}>
                            	<h2 class="print"><{label key="L_VALUE_TYPE"}></h2>
                                                                    <{ajaxmodule class="WidgetListValueType" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.valuetype.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('Workflow') && isset($smarty.session.acl.workflow) }>
                        <div id="tab-workflows">
                        	<{if true || $tab == 'workflows'}>
                            	<h2 class="print"><{label key="L_WORKFLOW"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflow" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.workflow.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowApplication') && isset($smarty.session.acl.workflowapplication) }>
                        <div id="tab-workflowapplications">
                        	<{if true || $tab == 'workflowapplications'}>
                            	<h2 class="print"><{label key="L_WORKFLOW_APPLICATION"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowApplication" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.workflowapplication.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowLog') && isset($smarty.session.acl.workflowlog) }>
                        <div id="tab-workflowlogs">
                        	<{if true || $tab == 'workflowlogs'}>
                            	<h2 class="print"><{label key="L_WORKFLOW_LOG"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowLog" method="" readonly=!WorkflowHelper::isEditable($details->WFID) WFID="`$details->CODE`" where=""  template='widgetlist.workflowlog.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                                    <{if Framework::hasModule('WorkflowTransition') && isset($smarty.session.acl.workflowtransition) }>
                        <div id="tab-workflowtransitions">
                        	<{if true || $tab == 'workflowtransitions'}>
                            	<h2 class="print"><{label key="L_WORKFLOW_TRANSITION"}></h2>
                                                                    <{ajaxmodule class="WidgetListWorkflowTransition" method="" readonly=!WorkflowHelper::isEditable($details->WFID) START_ID_WORKFLOW_STAGE="`$details->CODE`" where="" ID_WORKFLOW="`$details->ID_WORKFLOW`" template='widgetlist.workflowtransition.tpl'}>
                                                            <{/if}>
                        </div>
                    <{/if}>
                
                <script type="text/javascript">
                $(document).ready(function(){
                	$("#workflowstagetabs").tabs({
//                        activate: function( event, ui ) {
//                            $.cookie("workflowstage_active_tab", $("#workflowstagetabs").tabs("option", "active"));
//                        },
//                        active: $("#workflowstagetabs").tabs({ active: $.cookie("workflowstage_active_tab") })
                    });
                	$("#workflowstagetabs").tabs("paging", {cycle: false, follow: true});
                });
                </script>

                <script type="text/javascript">
                $(document).ready(function(){
                    $('#workflowstagetabs').prepend('<div class="expand-collapse" style="float:right;"></div>');
                    var handler = $('#workflowstagetabs .expand-collapse');

                	var details = $('#workflowstageview .view-main');

                    if ($.cookie('workflowstageexpandcollapse') == 'collapsed') {
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

                            $.cookie('workflowstageexpandcollapse', 'collapsed');
                        } else {
                            details.animate({ height: 'show' }, 'slow');

                            handler.removeClass('collapsed');
                            handler.addClass('expanded');

                            $.cookie('workflowstageexpandcollapse', 'expanded');
                        }
                	});
                });
                </script>

            </div>
        <{/if}>
    
<{if Framework::hasModule('AdminComment')}>
    <!-- Comments start -->
    <div class="workflowstage-comments" data-type="ajax" data-source="<{$smarty.const.APPLICATION_URL}>/admincomment/ajaxGetComments/workflowstage/<{$details->UUID}>">
    <!-- Comments end -->
<{/if}>

</div>


<script type="text/javascript">
    $(document).ready(function(){
    	var origin = $('#workflowstageview .form-field-value .column-name');
    	var mirror = $('#workflowstageview .mirror-name');

    	mirror.html(origin.html());
    	mirror.addClass('mirror-name attribute-line column-name');
        mirror.show();
        //origin.hide();
    });
</script>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#workflowstageview', 'f2', '.button-edit');
    	bind_hotkey('#workflowstageview', 'esc', '.button-close');
    	bind_hotkey('#workflowstageview', 'left', '.button-view-prev');
    	bind_hotkey('#workflowstageview', 'right', '.button-view-next');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowstageview :focusable:first').focus();
        }

    	$('#workflowstageview').click(function(){
    	    var focused = $('#workflowstageview :focus');

    	    if (focused.length == 0) {
                $('#workflowstageview :focusable:first').focus();
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
