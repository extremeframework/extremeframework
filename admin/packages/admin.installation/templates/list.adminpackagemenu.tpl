<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Admin Package Menu')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpackagemenuquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/search" method="get">
            <input type="text" name="adminpackagemenu_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpackagemenuquicksearch').submit(); return false;">
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
            $('#adminpackagemenuquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpackagemenuquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$title}></span>

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
<{if isset($smarty.session.acl.adminpackagemenu.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpackagemenu.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Package Menu', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Package Menu')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpackagemenu.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpackagemenu_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminpackagemenu.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminpackagemenu.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpackagemenu[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpackagemenu_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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

<!-- Search form -->

<!-- List -->
<form name="adminpackagemenulist" id="adminpackagemenulistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/" method="post">
<input type="hidden" name="adminpackagemenulist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpackagemenu_reset() {
	$('input, select', '#adminpackagemenu-search').val('');
}

function adminpackagemenu_search() {
	$('#adminpackagemenu-search').submit();
}

function adminpackagemenu_save() {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/save/?back=0');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_delete() {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/delete/');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_copy() {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/copy/');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_approve() {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/approve/');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_batchedit() {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/batchedit/');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_update(col, val) {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/bulkupdate/' + col + '/' + val);
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_dupdate(col, val) {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/bulkdupdate/' + col + '/' + val);
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_customaction(controller, action) {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpackagemenulistform').submit();
}

function adminpackagemenu_filter(col, val) {
	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/filter/' + col + '/' + val);
	$('#adminpackagemenulistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpackagemenu_<{$item->ACTION}>() {
        	$('#adminpackagemenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/<{$item->ACTION}>/');
        	$('#adminpackagemenulistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpackagemenu_checkall(checked) {
	$('#adminpackagemenulist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpackagemenulist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpackagemenulist .top-holder').show();

		$('#adminpackagemenulist .top-holder .selectall').show();
		$('#adminpackagemenulist .top-holder .clearselection').hide();
	} else {
		$('#adminpackagemenulist .top-holder').hide();

	    document.adminpackagemenulist.adminpackagemenulist_selection_selectall.value = 0;
	}
}

function adminpackagemenu_selectall() {
	adminpackagemenu_checkall(true);

    document.adminpackagemenulist.adminpackagemenulist_selection_selectall.value = 1;

	$('#adminpackagemenulist .top-holder .selectall').hide();
	$('#adminpackagemenulist .top-holder .clearselection').show();
}

function adminpackagemenu_clearselection() {
	adminpackagemenu_checkall(false);

    document.adminpackagemenulist.adminpackagemenulist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpackagemenu.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpackagemenu-pagination-from"><{$limit_from}>-<span class="adminpackagemenu-pagination-to"><{$limit_to}></span> of <span class="adminpackagemenu-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminpackagemenu-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpackagemenu-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpackagemenu-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpackagemenulistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackagemenulistform :focusable:first').focus();
        }

    	$('#adminpackagemenulistform').click(function(){
    	    var focused = $('#adminpackagemenulistform :focus');

    	    if (focused.length == 0) {
                $('#adminpackagemenulistform :focusable:first').focus();
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
