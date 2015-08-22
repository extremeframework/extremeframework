<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Dashboard Item Type')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="dashboarditemtypequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/search" method="get">
            <input type="text" name="dashboarditemtype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#dashboarditemtypequicksearch').submit(); return false;">
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
            $('#dashboarditemtypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#dashboarditemtypequicksearch').submit();
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
<{if isset($smarty.session.acl.dashboarditemtype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.dashboarditemtype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Dashboard Item Type', true)|strtolower}>"/><{_t('New')}> <{_t('Dashboard Item Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.dashboarditemtype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="dashboarditemtype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.dashboarditemtype.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.dashboarditemtype.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.dashboarditemtype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="dashboarditemtype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Dashboard Item Type', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Dashboard Item Type', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Dashboard Item Type', true)), strtolower(_t('Dashboard Item Type', true))));
    <{/php}>

    <div id="dashboarditemtypecopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Dashboard Item Type', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="dashboarditem" /> <{_t('Copy also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="dashboarditemtypeapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Dashboard Item Type', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="dashboarditem" /> <{_t('Approve also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="dashboarditemtypedeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Dashboard Item Type', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('DashboardItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="dashboarditem" /> <{_t('Delete also')}> <{_t('Dashboard Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="dashboarditemtypelist" id="dashboarditemtypelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/" method="post">
<input type="hidden" name="dashboarditemtypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function dashboarditemtype_reset() {
	$('input, select', '#dashboarditemtype-search').val('');
}

function dashboarditemtype_search() {
	$('#dashboarditemtype-search').submit();
}

function dashboarditemtype_save() {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/save/?back=0');
	$('#dashboarditemtypelistform').submit();
}

function dashboarditemtype_delete() {
	var dialog = $( "#dashboarditemtypedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/delete/');
            	$('#dashboarditemtypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboarditemtypelistform'));
}

function dashboarditemtype_copy() {
	var dialog = $( "#dashboarditemtypecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/copy/');
            	$('#dashboarditemtypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboarditemtypelistform'));
}

function dashboarditemtype_approve() {
	var dialog = $( "#dashboarditemtypeapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/approve/');
            	$('#dashboarditemtypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#dashboarditemtypelistform'));
}

function dashboarditemtype_batchedit() {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/batchedit/');
	$('#dashboarditemtypelistform').submit();
}

function dashboarditemtype_update(col, val) {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/bulkupdate/' + col + '/' + val);
	$('#dashboarditemtypelistform').submit();
}

function dashboarditemtype_dupdate(col, val) {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/bulkdupdate/' + col + '/' + val);
	$('#dashboarditemtypelistform').submit();
}

function dashboarditemtype_customaction(controller, action) {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#dashboarditemtypelistform').submit();
}

function dashboarditemtype_filter(col, val) {
	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/filter/' + col + '/' + val);
	$('#dashboarditemtypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function dashboarditemtype_<{$item->ACTION}>() {
        	$('#dashboarditemtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/<{$item->ACTION}>/');
        	$('#dashboarditemtypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function dashboarditemtype_checkall(checked) {
	$('#dashboarditemtypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('dashboarditemtypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#dashboarditemtypelist .top-holder').show();

		$('#dashboarditemtypelist .top-holder .selectall').show();
		$('#dashboarditemtypelist .top-holder .clearselection').hide();
	} else {
		$('#dashboarditemtypelist .top-holder').hide();

	    document.dashboarditemtypelist.dashboarditemtypelist_selection_selectall.value = 0;
	}
}

function dashboarditemtype_selectall() {
	dashboarditemtype_checkall(true);

    document.dashboarditemtypelist.dashboarditemtypelist_selection_selectall.value = 1;

	$('#dashboarditemtypelist .top-holder .selectall').hide();
	$('#dashboarditemtypelist .top-holder .clearselection').show();
}

function dashboarditemtype_clearselection() {
	dashboarditemtype_checkall(false);

    document.dashboarditemtypelist.dashboarditemtypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.dashboarditemtype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="dashboarditemtype-pagination-from"><{$limit_from}>-<span class="dashboarditemtype-pagination-to"><{$limit_to}></span> of <span class="dashboarditemtype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="dashboarditemtype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.dashboarditemtype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.dashboarditemtype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#dashboarditemtypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#dashboarditemtypelistform :focusable:first').focus();
        }

    	$('#dashboarditemtypelistform').click(function(){
    	    var focused = $('#dashboarditemtypelistform :focus');

    	    if (focused.length == 0) {
                $('#dashboarditemtypelistform :focusable:first').focus();
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
