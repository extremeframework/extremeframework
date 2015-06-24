<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_WORKFLOW_STAGE}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowstagequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowstage/search" method="post" enctype="multipart/form-data">
            <input type="text" name="workflowstage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#workflowstagequicksearch').submit(); return false;">
	            <span><{label key="L_SEARCH"}></span>
            </a>
        </form>
    </div>

    <script type="text/javascript">
        $(function() {
            var delay = (function(){
              var timer = 0;
              return function(callback, ms){
                  clearTimeout (timer);
                  timer = setTimeout(callback, ms);
              };
            })();

            var latest = '';
            $('#workflowstagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowstagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.workflowstage) }>
<{foreach from=$messages.workflowstage key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="workflowstagelist" id="workflowstagelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowstage/" method="post">

<input type="hidden" name="workflowstagelist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.workflowstage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflowstage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_WORKFLOW_STAGE|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_WORKFLOW_STAGE|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflowstage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflowstage_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflowstage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflowstage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
                                <{/if}>
                            <{/foreach}>
                        </ul>
            	    </div>
                <{/if}>
            </div>
            </li>
                    </ul>
    </div>
    <div class="clearer"></div>
<{/if}>

<!-- Relations -->
    <{php}>
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_WORKFLOW_STAGE)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_WORKFLOW_STAGE)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_WORKFLOW_STAGE), strtolower(L_WORKFLOW_STAGE)));
    <{/php}>

    <div id="workflowstagecopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_WORKFLOW_STAGE|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="accessright" /> <{label key="L_COPY_ALSO"}> <{label key="L_ACCESS_RIGHT" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AclType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="acltype" /> <{label key="L_COPY_ALSO"}> <{label key="L_ACL_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminfilter" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_FILTER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLabel')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlabel" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LABEL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlanguage" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LANGUAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlanguageitem" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LANGUAGE_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlayoutfield" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlayoutsection" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LAYOUT_SECTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmenu" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_MENU" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmenuitem" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmodule" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_MODULE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminsequence" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_SEQUENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminview" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_VIEW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="changelog" /> <{label key="L_COPY_ALSO"}> <{label key="L_CHANGE_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="dashboard" /> <{label key="L_COPY_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="field" /> <{label key="L_COPY_ALSO"}> <{label key="L_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="fieldacl" /> <{label key="L_COPY_ALSO"}> <{label key="L_FIELD_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="objectacl" /> <{label key="L_COPY_ALSO"}> <{label key="L_OBJECT_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Option')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="option" /> <{label key="L_COPY_ALSO"}> <{label key="L_OPTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="parameter" /> <{label key="L_COPY_ALSO"}> <{label key="L_PARAMETER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="parametergroup" /> <{label key="L_COPY_ALSO"}> <{label key="L_PARAMETER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="parametertype" /> <{label key="L_COPY_ALSO"}> <{label key="L_PARAMETER_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="recyclebin" /> <{label key="L_COPY_ALSO"}> <{label key="L_RECYCLE_BIN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="screen" /> <{label key="L_COPY_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="screenfield" /> <{label key="L_COPY_ALSO"}> <{label key="L_SCREEN_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('User')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="user" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="usergroup" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userlog" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="usermembership" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userpreference" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_PREFERENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserRole')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userrole" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_ROLE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ValueType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="valuetype" /> <{label key="L_COPY_ALSO"}> <{label key="L_VALUE_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Workflow')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflow" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowapplication" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowlog" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowtransition" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="workflowstageapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_WORKFLOW_STAGE|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="accessright" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ACCESS_RIGHT" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AclType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="acltype" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ACL_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminfilter" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_FILTER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLabel')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlabel" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LABEL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlanguage" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LANGUAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlanguageitem" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LANGUAGE_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlayoutfield" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlayoutsection" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LAYOUT_SECTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmenu" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_MENU" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmenuitem" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmodule" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_MODULE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminsequence" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_SEQUENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminview" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_VIEW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="changelog" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_CHANGE_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="dashboard" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="field" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="fieldacl" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_FIELD_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="objectacl" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_OBJECT_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Option')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="option" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_OPTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="parameter" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_PARAMETER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="parametergroup" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_PARAMETER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="parametertype" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_PARAMETER_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="recyclebin" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_RECYCLE_BIN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="screen" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="screenfield" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_SCREEN_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('User')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="user" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="usergroup" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userlog" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="usermembership" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userpreference" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_PREFERENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserRole')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userrole" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_ROLE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ValueType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="valuetype" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_VALUE_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Workflow')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflow" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowapplication" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowlog" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowtransition" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="workflowstagedeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_WORKFLOW_STAGE|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="accessright" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ACCESS_RIGHT" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AclType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="acltype" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ACL_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminfilter" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_FILTER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLabel')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlabel" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LABEL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlanguage" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LANGUAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlanguageitem" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LANGUAGE_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlayoutfield" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlayoutsection" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LAYOUT_SECTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmenu" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_MENU" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmenuitem" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmodule" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_MODULE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminsequence" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_SEQUENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminview" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_VIEW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="changelog" /> <{label key="L_DELETE_ALSO"}> <{label key="L_CHANGE_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="dashboard" /> <{label key="L_DELETE_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="field" /> <{label key="L_DELETE_ALSO"}> <{label key="L_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="fieldacl" /> <{label key="L_DELETE_ALSO"}> <{label key="L_FIELD_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="objectacl" /> <{label key="L_DELETE_ALSO"}> <{label key="L_OBJECT_ACL" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Option')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="option" /> <{label key="L_DELETE_ALSO"}> <{label key="L_OPTION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="parameter" /> <{label key="L_DELETE_ALSO"}> <{label key="L_PARAMETER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="parametergroup" /> <{label key="L_DELETE_ALSO"}> <{label key="L_PARAMETER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ParameterType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="parametertype" /> <{label key="L_DELETE_ALSO"}> <{label key="L_PARAMETER_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="recyclebin" /> <{label key="L_DELETE_ALSO"}> <{label key="L_RECYCLE_BIN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="screen" /> <{label key="L_DELETE_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="screenfield" /> <{label key="L_DELETE_ALSO"}> <{label key="L_SCREEN_FIELD" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('User')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="user" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="usergroup" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_GROUP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userlog" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="usermembership" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userpreference" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_PREFERENCE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('UserRole')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userrole" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_ROLE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('ValueType')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="valuetype" /> <{label key="L_DELETE_ALSO"}> <{label key="L_VALUE_TYPE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Workflow')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflow" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowapplication" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowlog" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowtransition" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflowstage_reset() {
	$('input, select', '#workflowstage-search').val('');
}

function workflowstage_search() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/search/');
	$('#workflowstagelistform').submit();
}

function workflowstage_save() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/save/?back=0');
	$('#workflowstagelistform').submit();
}

function workflowstage_delete() {
	var dialog = $( "#workflowstagedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/delete/');
            	$('#workflowstagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowstagelistform'));
}

function workflowstage_copy() {
	var dialog = $( "#workflowstagecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/copy/');
            	$('#workflowstagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowstagelistform'));
}

function workflowstage_approve() {
	var dialog = $( "#workflowstageapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/approve/');
            	$('#workflowstagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowstagelistform'));
}

function workflowstage_batchedit() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/batchedit/');
	$('#workflowstagelistform').submit();
}

function workflowstage_update(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/bulkupdate/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

function workflowstage_dupdate(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/bulkdupdate/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

function workflowstage_customaction(controller, action) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowstagelistform').submit();
}

function workflowstage_filter(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/filter/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflowstage_<{$item->ACTION}>() {
        	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/<{$item->ACTION}>/');
        	$('#workflowstagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflowstage_checkall(checked) {
	$('#workflowstagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowstagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowstagelist .top-holder').show();

		$('#workflowstagelist .top-holder .selectall').show();
		$('#workflowstagelist .top-holder .clearselection').hide();
	} else {
		$('#workflowstagelist .top-holder').hide();

	    document.workflowstagelist.workflowstagelist_selection_selectall.value = 0;
	}
}

function workflowstage_selectall() {
	workflowstage_checkall(true);

    document.workflowstagelist.workflowstagelist_selection_selectall.value = 1;

	$('#workflowstagelist .top-holder .selectall').hide();
	$('#workflowstagelist .top-holder .clearselection').show();
}

function workflowstage_clearselection() {
	workflowstage_checkall(false);

    document.workflowstagelist.workflowstagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflowstage.tpl"}>
<{/if}>

<{if $pagination || $total > 10}>
	<br>
	<div class="pagination-sizes hidden-print" style="float:right">
	<{php}>
	    $template->assign('pagesizes', array(10, 20, 30, 50, 100, 200, 500, '*'));
	<{/php}>
	<{foreach from=$pagesizes key=key item=item}>
	    <{if $key > 0}> | <{/if}>
	    <{if $item == $limit}>
	        <{$item}>
	    <{else}>
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflowstage-pagination-from"><{$limit_from}>-<span class="workflowstage-pagination-to"><{$limit_to}></span> of <span class="workflowstage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

    <{else}>
	<br>
	<div style="float:left">
		<span class="workflowstage-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflowstage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflowstage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowstagelistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowstagelistform :focusable:first').focus();
        }

    	$('#workflowstagelistform').click(function(){
    	    var focused = $('#workflowstagelistform :focus');

    	    if (focused.length == 0) {
                $('#workflowstagelistform :focusable:first').focus();
    	    }
    	});
    });
</script>

<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{time_elapsed}>

<!--:listbodyend:-->
</div>

</form>

<{include file="footer.tpl"}>
