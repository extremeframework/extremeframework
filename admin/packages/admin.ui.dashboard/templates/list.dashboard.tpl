<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Dashboard')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="dashboardquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/dashboard/search" method="get">
            <input type="text" name="dashboard_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#dashboardquicksearch').submit(); return false;">
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
            $('#dashboardquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#dashboardquicksearch').submit();
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
<{if isset($smarty.session.acl.dashboard.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.dashboard.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Dashboard', true)|strtolower}>"/><{_t('New')}> <{_t('Dashboard')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.dashboard.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="dashboard_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.dashboard[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="dashboard_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Dashboard', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Dashboard', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Dashboard', true)), strtolower(_t('Dashboard', true))));
    <{/php}>

    <div id="dashboardcopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Dashboard', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="dashboarditem" /> <{_t('Copy also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="usergroup" /> <{_t('Copy also')}> <{_t('User Group')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userpreference" /> <{_t('Copy also')}> <{_t('User Preference')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="dashboardapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Dashboard', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="dashboarditem" /> <{_t('Approve also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="usergroup" /> <{_t('Approve also')}> <{_t('User Group')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userpreference" /> <{_t('Approve also')}> <{_t('User Preference')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="dashboarddeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Dashboard', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="dashboarditem" /> <{_t('Delete also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserGroup')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="usergroup" /> <{_t('Delete also')}> <{_t('User Group')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userpreference" /> <{_t('Delete also')}> <{_t('User Preference')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="dashboardlist" id="dashboardlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/dashboard/" method="post">
<input type="hidden" name="dashboardlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function dashboard_reset() {
	$('input, select', '#dashboard-search').val('');
}

function dashboard_search() {
	$('#dashboard-search').submit();
}

function dashboard_save() {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/save/?back=0');
	$('#dashboardlistform').submit();
}

function dashboard_delete() {
	var dialog = $( "#dashboarddeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/delete/');
            	$('#dashboardlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboardlistform'));
}

function dashboard_copy() {
	var dialog = $( "#dashboardcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/copy/');
            	$('#dashboardlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboardlistform'));
}

function dashboard_approve() {
	var dialog = $( "#dashboardapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/approve/');
            	$('#dashboardlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboardlistform'));
}

function dashboard_batchedit() {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/batchedit/');
	$('#dashboardlistform').submit();
}

function dashboard_update(col, val) {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/bulkupdate/' + col + '/' + val);
	$('#dashboardlistform').submit();
}

function dashboard_dupdate(col, val) {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/bulkdupdate/' + col + '/' + val);
	$('#dashboardlistform').submit();
}

function dashboard_customaction(controller, action) {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#dashboardlistform').submit();
}

function dashboard_filter(col, val) {
	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/filter/' + col + '/' + val);
	$('#dashboardlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function dashboard_<{$item->ACTION}>() {
        	$('#dashboardlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/<{$item->ACTION}>/');
        	$('#dashboardlistform').submit();
		}
	<{/if}>
<{/foreach}>

function dashboard_checkall(checked) {
	$('#dashboardlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('dashboardlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#dashboardlist .top-holder').show();

		$('#dashboardlist .top-holder .selectall').show();
		$('#dashboardlist .top-holder .clearselection').hide();
	} else {
		$('#dashboardlist .top-holder').hide();

	    document.dashboardlist.dashboardlist_selection_selectall.value = 0;
	}
}

function dashboard_selectall() {
	dashboard_checkall(true);

    document.dashboardlist.dashboardlist_selection_selectall.value = 1;

	$('#dashboardlist .top-holder .selectall').hide();
	$('#dashboardlist .top-holder .clearselection').show();
}

function dashboard_clearselection() {
	dashboard_checkall(false);

    document.dashboardlist.dashboardlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.dashboard.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboard/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="dashboard-pagination-from"><{$limit_from}>-<span class="dashboard-pagination-to"><{$limit_to}></span> of <span class="dashboard-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboard/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="dashboard-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.dashboard-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.dashboard-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#dashboardlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#dashboardlistform :focusable:first').focus();
        }

    	$('#dashboardlistform').click(function(){
    	    var focused = $('#dashboardlistform :focus');

    	    if (focused.length == 0) {
                $('#dashboardlistform :focusable:first').focus();
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
