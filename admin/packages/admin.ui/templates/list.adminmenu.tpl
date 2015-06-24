<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_ADMIN_MENU}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminmenuquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmenu/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminmenu_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#adminmenuquicksearch').submit(); return false;">
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
            $('#adminmenuquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminmenuquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminmenu) }>
<{foreach from=$messages.adminmenu key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminmenulist" id="adminmenulistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminmenu/" method="post">

<input type="hidden" name="adminmenulist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminmenu.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminmenu.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_ADMIN_MENU|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_ADMIN_MENU|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminmenu.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminmenu_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminmenu[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminmenu_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_ADMIN_MENU)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_ADMIN_MENU)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_ADMIN_MENU), strtolower(L_ADMIN_MENU)));
    <{/php}>

    <div id="adminmenucopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_ADMIN_MENU|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmenuitem" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="dashboard" /> <{label key="L_COPY_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmenuapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_ADMIN_MENU|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmenuitem" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="dashboard" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminmenudeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_ADMIN_MENU|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminMenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmenuitem" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_MENU_ITEM" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('Dashboard')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="dashboard" /> <{label key="L_DELETE_ALSO"}> <{label key="L_DASHBOARD" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminmenu_reset() {
	$('input, select', '#adminmenu-search').val('');
}

function adminmenu_search() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/search/');
	$('#adminmenulistform').submit();
}

function adminmenu_save() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/save/?back=0');
	$('#adminmenulistform').submit();
}

function adminmenu_delete() {
	var dialog = $( "#adminmenudeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/delete/');
            	$('#adminmenulistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenulistform'));
}

function adminmenu_copy() {
	var dialog = $( "#adminmenucopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/copy/');
            	$('#adminmenulistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenulistform'));
}

function adminmenu_approve() {
	var dialog = $( "#adminmenuapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/approve/');
            	$('#adminmenulistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminmenulistform'));
}

function adminmenu_batchedit() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/batchedit/');
	$('#adminmenulistform').submit();
}

function adminmenu_update(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/bulkupdate/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

function adminmenu_dupdate(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/bulkdupdate/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

function adminmenu_customaction(controller, action) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminmenulistform').submit();
}

function adminmenu_filter(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/filter/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminmenu_<{$item->ACTION}>() {
        	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/<{$item->ACTION}>/');
        	$('#adminmenulistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminmenu_checkall(checked) {
	$('#adminmenulist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminmenulist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminmenulist .top-holder').show();

		$('#adminmenulist .top-holder .selectall').show();
		$('#adminmenulist .top-holder .clearselection').hide();
	} else {
		$('#adminmenulist .top-holder').hide();

	    document.adminmenulist.adminmenulist_selection_selectall.value = 0;
	}
}

function adminmenu_selectall() {
	adminmenu_checkall(true);

    document.adminmenulist.adminmenulist_selection_selectall.value = 1;

	$('#adminmenulist .top-holder .selectall').hide();
	$('#adminmenulist .top-holder .clearselection').show();
}

function adminmenu_clearselection() {
	adminmenu_checkall(false);

    document.adminmenulist.adminmenulist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminmenu.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminmenu-pagination-from"><{$limit_from}>-<span class="adminmenu-pagination-to"><{$limit_to}></span> of <span class="adminmenu-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminmenu-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminmenu-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminmenu-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminmenulistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmenulistform :focusable:first').focus();
        }

    	$('#adminmenulistform').click(function(){
    	    var focused = $('#adminmenulistform :focus');

    	    if (focused.length == 0) {
                $('#adminmenulistform :focusable:first').focus();
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
