<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Permission Set')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="permissionsetquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/permissionset/search" method="get">
            <input type="text" name="permissionset_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#permissionsetquicksearch').submit(); return false;">
	            <span><{_t('Search')}></span>
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
            $('#permissionsetquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#permissionsetquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=ignored item=message}>
            <li><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.permissionset.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.permissionset.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Permission Set', true)|strtolower}>"/><{_t('New')}> <{_t('Permission Set')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.permissionset.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="permissionset_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.permissionset.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/permissionset/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.permissionset.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/permissionset/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.permissionset[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="permissionset_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Permission Set', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Permission Set', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Permission Set', true)), strtolower(_t('Permission Set', true))));
    <{/php}>

    <div id="permissionsetcopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Permission Set', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminpackagepermission" /> <{_t('Copy also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('CustomAccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="customaccessright" /> <{_t('Copy also')}> <{_t('Custom Access Right')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PermissionSetItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="permissionsetitem" /> <{_t('Copy also')}> <{_t('Permission Set Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="permissionsetapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Permission Set', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminpackagepermission" /> <{_t('Approve also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('CustomAccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="customaccessright" /> <{_t('Approve also')}> <{_t('Custom Access Right')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PermissionSetItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="permissionsetitem" /> <{_t('Approve also')}> <{_t('Permission Set Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="permissionsetdeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Permission Set', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminpackagepermission" /> <{_t('Delete also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('CustomAccessRight')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="customaccessright" /> <{_t('Delete also')}> <{_t('Custom Access Right')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PermissionSetItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="permissionsetitem" /> <{_t('Delete also')}> <{_t('Permission Set Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="permissionsetlist" id="permissionsetlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/permissionset/" method="post">
<input type="hidden" name="permissionsetlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function permissionset_reset() {
	$('input, select', '#permissionset-search').val('');
}

function permissionset_search() {
	$('#permissionset-search').submit();
}

function permissionset_save() {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/save/?back=0');
	$('#permissionsetlistform').submit();
}

function permissionset_delete() {
	var dialog = $( "#permissionsetdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/delete/');
            	$('#permissionsetlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#permissionsetlistform'));
}

function permissionset_copy() {
	var dialog = $( "#permissionsetcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/copy/');
            	$('#permissionsetlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#permissionsetlistform'));
}

function permissionset_approve() {
	var dialog = $( "#permissionsetapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/approve/');
            	$('#permissionsetlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#permissionsetlistform'));
}

function permissionset_batchedit() {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/batchedit/');
	$('#permissionsetlistform').submit();
}

function permissionset_update(col, val) {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/bulkupdate/' + col + '/' + val);
	$('#permissionsetlistform').submit();
}

function permissionset_dupdate(col, val) {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/bulkdupdate/' + col + '/' + val);
	$('#permissionsetlistform').submit();
}

function permissionset_customaction(controller, action) {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#permissionsetlistform').submit();
}

function permissionset_filter(col, val) {
	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/filter/' + col + '/' + val);
	$('#permissionsetlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function permissionset_<{$item->ACTION}>() {
        	$('#permissionsetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/<{$item->ACTION}>/');
        	$('#permissionsetlistform').submit();
		}
	<{/if}>
<{/foreach}>

function permissionset_checkall(checked) {
	$('#permissionsetlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('permissionsetlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#permissionsetlist .top-holder').show();

		$('#permissionsetlist .top-holder .selectall').show();
		$('#permissionsetlist .top-holder .clearselection').hide();
	} else {
		$('#permissionsetlist .top-holder').hide();

	    document.permissionsetlist.permissionsetlist_selection_selectall.value = 0;
	}
}

function permissionset_selectall() {
	permissionset_checkall(true);

    document.permissionsetlist.permissionsetlist_selection_selectall.value = 1;

	$('#permissionsetlist .top-holder .selectall').hide();
	$('#permissionsetlist .top-holder .clearselection').show();
}

function permissionset_clearselection() {
	permissionset_checkall(false);

    document.permissionsetlist.permissionsetlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.permissionset.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionset/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="permissionset-pagination-from"><{$limit_from}>-<span class="permissionset-pagination-to"><{$limit_to}></span> of <span class="permissionset-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionset/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="permissionset-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.permissionset-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.permissionset-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#permissionsetlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#permissionsetlistform :focusable:first').focus();
        }

    	$('#permissionsetlistform').click(function(){
    	    var focused = $('#permissionsetlistform :focus');

    	    if (focused.length == 0) {
                $('#permissionsetlistform :focusable:first').focus();
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
