<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Admin Menu Item')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminmenuitemquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/search" method="get">
            <input type="text" name="adminmenuitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminmenuitemquicksearch').submit(); return false;">
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
            $('#adminmenuitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminmenuitemquicksearch').submit();
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
<{if isset($smarty.session.acl.adminmenuitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminmenuitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Menu Item', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Menu Item')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminmenuitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminmenuitem_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminmenuitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminmenuitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Admin Menu Item', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Admin Menu Item', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Admin Menu Item', true)), strtolower(_t('Admin Menu Item', true))));
    <{/php}>

    <div id="adminmenuitemcopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Admin Menu Item', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmenuitem" /> <{_t('Copy also')}> <{_t('Admin Menu Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmenuitemapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Admin Menu Item', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmenuitem" /> <{_t('Approve also')}> <{_t('Admin Menu Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmenuitemdeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Admin Menu Item', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmenuitem" /> <{_t('Delete also')}> <{_t('Admin Menu Item')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="adminmenuitemlist" id="adminmenuitemlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/" method="post">
<input type="hidden" name="adminmenuitemlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminmenuitem_reset() {
	$('input, select', '#adminmenuitem-search').val('');
}

function adminmenuitem_search() {
	$('#adminmenuitem-search').submit();
}

function adminmenuitem_save() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=0');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_delete() {
	var dialog = $( "#adminmenuitemdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/delete/');
            	$('#adminmenuitemlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenuitemlistform'));
}

function adminmenuitem_copy() {
	var dialog = $( "#adminmenuitemcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/copy/');
            	$('#adminmenuitemlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenuitemlistform'));
}

function adminmenuitem_approve() {
	var dialog = $( "#adminmenuitemapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/approve/');
            	$('#adminmenuitemlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenuitemlistform'));
}

function adminmenuitem_batchedit() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/batchedit/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_update(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/bulkupdate/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_dupdate(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/bulkdupdate/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_customaction(controller, action) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_filter(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/filter/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminmenuitem_<{$item->ACTION}>() {
        	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/<{$item->ACTION}>/');
        	$('#adminmenuitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminmenuitem_checkall(checked) {
	$('#adminmenuitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminmenuitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminmenuitemlist .top-holder').show();

		$('#adminmenuitemlist .top-holder .selectall').show();
		$('#adminmenuitemlist .top-holder .clearselection').hide();
	} else {
		$('#adminmenuitemlist .top-holder').hide();

	    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 0;
	}
}

function adminmenuitem_selectall() {
	adminmenuitem_checkall(true);

    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 1;

	$('#adminmenuitemlist .top-holder .selectall').hide();
	$('#adminmenuitemlist .top-holder .clearselection').show();
}

function adminmenuitem_clearselection() {
	adminmenuitem_checkall(false);

    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminmenuitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminmenuitem-pagination-from"><{$limit_from}>-<span class="adminmenuitem-pagination-to"><{$limit_to}></span> of <span class="adminmenuitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminmenuitem-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminmenuitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminmenuitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminmenuitemlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmenuitemlistform :focusable:first').focus();
        }

    	$('#adminmenuitemlistform').click(function(){
    	    var focused = $('#adminmenuitemlistform :focus');

    	    if (focused.length == 0) {
                $('#adminmenuitemlistform :focusable:first').focus();
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
