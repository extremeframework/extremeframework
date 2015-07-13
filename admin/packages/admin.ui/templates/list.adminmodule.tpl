<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_ADMIN_MODULE')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminmodulequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmodule/search" method="get">
            <input type="text" name="adminmodule_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminmodulequicksearch').submit(); return false;">
	            <span><{_t('L_SEARCH')}></span>
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
            $('#adminmodulequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminmodulequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminmodule) }>
<{foreach from=$messages.adminmodule key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminmodule.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminmodule.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_ADMIN_MODULE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_MODULE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminmodule.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminmodule_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminmodule[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminmodule_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('L_ADMIN_MODULE'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('L_ADMIN_MODULE'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('L_ADMIN_MODULE')), strtolower(_t('L_ADMIN_MODULE'))));
    <{/php}>

    <div id="adminmodulecopyrelations" style="display:none" title="<{_t('L_COPY', true)}> <{_t('L_ADMIN_MODULE', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="accessright" /> <{_t('L_COPY_ALSO')}> <{_t('L_ACCESS_RIGHT')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminfilter" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_FILTER')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlayoutfield" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_LAYOUT_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlayoutsection" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_LAYOUT_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmenuitem" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminsequence" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_SEQUENCE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminview" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_VIEW')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="changelog" /> <{_t('L_COPY_ALSO')}> <{_t('L_CHANGE_LOG')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="field" /> <{_t('L_COPY_ALSO')}> <{_t('L_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="fieldacl" /> <{_t('L_COPY_ALSO')}> <{_t('L_FIELD_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="objectacl" /> <{_t('L_COPY_ALSO')}> <{_t('L_OBJECT_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="recyclebin" /> <{_t('L_COPY_ALSO')}> <{_t('L_RECYCLE_BIN')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Template')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="template" /> <{_t('L_COPY_ALSO')}> <{_t('L_TEMPLATE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowapplication" /> <{_t('L_COPY_ALSO')}> <{_t('L_WORKFLOW_APPLICATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowlog" /> <{_t('L_COPY_ALSO')}> <{_t('L_WORKFLOW_LOG')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmoduleapproverelations" style="display:none" title="<{_t('L_APPROVE', true)}> <{_t('L_ADMIN_MODULE', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="accessright" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ACCESS_RIGHT')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminfilter" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_FILTER')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlayoutfield" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_LAYOUT_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlayoutsection" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_LAYOUT_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmenuitem" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminsequence" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_SEQUENCE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminview" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_VIEW')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="changelog" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_CHANGE_LOG')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="field" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="fieldacl" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_FIELD_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="objectacl" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_OBJECT_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="recyclebin" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_RECYCLE_BIN')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Template')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="template" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_TEMPLATE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowapplication" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_WORKFLOW_APPLICATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowlog" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_WORKFLOW_LOG')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmoduledeleterelations" style="display:none" title="<{_t('L_DELETE', true)}> <{_t('L_ADMIN_MODULE', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="accessright" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ACCESS_RIGHT')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminFilter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminfilter" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_FILTER')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlayoutfield" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_LAYOUT_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminLayoutSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlayoutsection" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_LAYOUT_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmenuitem" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminSequence')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminsequence" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_SEQUENCE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminView')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminview" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_VIEW')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ChangeLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="changelog" /> <{_t('L_DELETE_ALSO')}> <{_t('L_CHANGE_LOG')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Field')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="field" /> <{_t('L_DELETE_ALSO')}> <{_t('L_FIELD')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="fieldacl" /> <{_t('L_DELETE_ALSO')}> <{_t('L_FIELD_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="objectacl" /> <{_t('L_DELETE_ALSO')}> <{_t('L_OBJECT_ACL')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('RecycleBin')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="recyclebin" /> <{_t('L_DELETE_ALSO')}> <{_t('L_RECYCLE_BIN')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Template')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="template" /> <{_t('L_DELETE_ALSO')}> <{_t('L_TEMPLATE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowapplication" /> <{_t('L_DELETE_ALSO')}> <{_t('L_WORKFLOW_APPLICATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowlog" /> <{_t('L_DELETE_ALSO')}> <{_t('L_WORKFLOW_LOG')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="adminmodulelist" id="adminmodulelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmodule/" method="post">
<input type="hidden" name="adminmodulelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminmodule_reset() {
	$('input, select', '#adminmodule-search').val('');
}

function adminmodule_search() {
	$('#adminmodule-search').submit();
}

function adminmodule_save() {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/save/?back=0');
	$('#adminmodulelistform').submit();
}

function adminmodule_delete() {
	var dialog = $( "#adminmoduledeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE', true)}>": function() {
            	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/delete/');
            	$('#adminmodulelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmodulelistform'));
}

function adminmodule_copy() {
	var dialog = $( "#adminmodulecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY', true)}>": function() {
            	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/copy/');
            	$('#adminmodulelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmodulelistform'));
}

function adminmodule_approve() {
	var dialog = $( "#adminmoduleapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE', true)}>": function() {
            	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/approve/');
            	$('#adminmodulelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmodulelistform'));
}

function adminmodule_batchedit() {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/batchedit/');
	$('#adminmodulelistform').submit();
}

function adminmodule_update(col, val) {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/bulkupdate/' + col + '/' + val);
	$('#adminmodulelistform').submit();
}

function adminmodule_dupdate(col, val) {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/bulkdupdate/' + col + '/' + val);
	$('#adminmodulelistform').submit();
}

function adminmodule_customaction(controller, action) {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminmodulelistform').submit();
}

function adminmodule_filter(col, val) {
	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/filter/' + col + '/' + val);
	$('#adminmodulelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminmodule_<{$item->ACTION}>() {
        	$('#adminmodulelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmodule/<{$item->ACTION}>/');
        	$('#adminmodulelistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminmodule_checkall(checked) {
	$('#adminmodulelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminmodulelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminmodulelist .top-holder').show();

		$('#adminmodulelist .top-holder .selectall').show();
		$('#adminmodulelist .top-holder .clearselection').hide();
	} else {
		$('#adminmodulelist .top-holder').hide();

	    document.adminmodulelist.adminmodulelist_selection_selectall.value = 0;
	}
}

function adminmodule_selectall() {
	adminmodule_checkall(true);

    document.adminmodulelist.adminmodulelist_selection_selectall.value = 1;

	$('#adminmodulelist .top-holder .selectall').hide();
	$('#adminmodulelist .top-holder .clearselection').show();
}

function adminmodule_clearselection() {
	adminmodule_checkall(false);

    document.adminmodulelist.adminmodulelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminmodule.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminmodule-pagination-from"><{$limit_from}>-<span class="adminmodule-pagination-to"><{$limit_to}></span> of <span class="adminmodule-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminmodule-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminmodule-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminmodule-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminmodulelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmodulelistform :focusable:first').focus();
        }

    	$('#adminmodulelistform').click(function(){
    	    var focused = $('#adminmodulelistform :focus');

    	    if (focused.length == 0) {
                $('#adminmodulelistform :focusable:first').focus();
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
