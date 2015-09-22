<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Admin Package Permission')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpackagepermissionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/search" method="get">
            <input type="text" name="adminpackagepermission_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpackagepermissionquicksearch').submit(); return false;">
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
            $('#adminpackagepermissionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpackagepermissionquicksearch').submit();
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
<{if isset($smarty.session.acl.adminpackagepermission.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpackagepermission.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Package Permission', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Package Permission')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpackagepermission.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpackagepermission_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminpackagepermission.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminpackagepermission.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpackagepermission[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpackagepermission_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminpackagepermissionlist" id="adminpackagepermissionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/" method="post">
<input type="hidden" name="adminpackagepermissionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpackagepermission_reset() {
	$('input, select', '#adminpackagepermission-search').val('');
}

function adminpackagepermission_search() {
	$('#adminpackagepermission-search').submit();
}

function adminpackagepermission_save() {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/save/?back=0');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_delete() {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/delete/');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_copy() {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/copy/');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_approve() {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/approve/');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_batchedit() {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/batchedit/');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_update(col, val) {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/bulkupdate/' + col + '/' + val);
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_dupdate(col, val) {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/bulkdupdate/' + col + '/' + val);
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_customaction(controller, action) {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpackagepermissionlistform').submit();
}

function adminpackagepermission_filter(col, val) {
	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/filter/' + col + '/' + val);
	$('#adminpackagepermissionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpackagepermission_<{$item->ACTION}>() {
        	$('#adminpackagepermissionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/<{$item->ACTION}>/');
        	$('#adminpackagepermissionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpackagepermission_checkall(checked) {
	$('#adminpackagepermissionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpackagepermissionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpackagepermissionlist .top-holder').show();

		$('#adminpackagepermissionlist .top-holder .selectall').show();
		$('#adminpackagepermissionlist .top-holder .clearselection').hide();
	} else {
		$('#adminpackagepermissionlist .top-holder').hide();

	    document.adminpackagepermissionlist.adminpackagepermissionlist_selection_selectall.value = 0;
	}
}

function adminpackagepermission_selectall() {
	adminpackagepermission_checkall(true);

    document.adminpackagepermissionlist.adminpackagepermissionlist_selection_selectall.value = 1;

	$('#adminpackagepermissionlist .top-holder .selectall').hide();
	$('#adminpackagepermissionlist .top-holder .clearselection').show();
}

function adminpackagepermission_clearselection() {
	adminpackagepermission_checkall(false);

    document.adminpackagepermissionlist.adminpackagepermissionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpackagepermission.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpackagepermission-pagination-from"><{$limit_from}>-<span class="adminpackagepermission-pagination-to"><{$limit_to}></span> of <span class="adminpackagepermission-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminpackagepermission-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpackagepermission-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpackagepermission-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpackagepermissionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackagepermissionlistform :focusable:first').focus();
        }

    	$('#adminpackagepermissionlistform').click(function(){
    	    var focused = $('#adminpackagepermissionlistform :focus');

    	    if (focused.length == 0) {
                $('#adminpackagepermissionlistform :focusable:first').focus();
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
