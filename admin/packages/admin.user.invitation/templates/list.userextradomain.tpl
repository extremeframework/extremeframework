<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('User Extra Domain')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userextradomainquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/userextradomain/search" method="get">
            <input type="text" name="userextradomain_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userextradomainquicksearch').submit(); return false;">
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
            $('#userextradomainquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userextradomainquicksearch').submit();
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
<{if isset($smarty.session.acl.userextradomain.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userextradomain.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('User Extra Domain', true)|strtolower}>"/><{_t('New')}> <{_t('User Extra Domain')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userextradomain.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userextradomain_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userextradomain.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userextradomain.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userextradomain[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userextradomain_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userextradomainlist" id="userextradomainlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/userextradomain/" method="post">
<input type="hidden" name="userextradomainlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userextradomain_reset() {
	$('input, select', '#userextradomain-search').val('');
}

function userextradomain_search() {
	$('#userextradomain-search').submit();
}

function userextradomain_save() {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/save/?back=0');
	$('#userextradomainlistform').submit();
}

function userextradomain_delete() {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/delete/');
	$('#userextradomainlistform').submit();
}

function userextradomain_copy() {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/copy/');
	$('#userextradomainlistform').submit();
}

function userextradomain_approve() {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/approve/');
	$('#userextradomainlistform').submit();
}

function userextradomain_batchedit() {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/batchedit/');
	$('#userextradomainlistform').submit();
}

function userextradomain_update(col, val) {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/bulkupdate/' + col + '/' + val);
	$('#userextradomainlistform').submit();
}

function userextradomain_dupdate(col, val) {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/bulkdupdate/' + col + '/' + val);
	$('#userextradomainlistform').submit();
}

function userextradomain_customaction(controller, action) {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userextradomainlistform').submit();
}

function userextradomain_filter(col, val) {
	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/filter/' + col + '/' + val);
	$('#userextradomainlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userextradomain_<{$item->ACTION}>() {
        	$('#userextradomainlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userextradomain/<{$item->ACTION}>/');
        	$('#userextradomainlistform').submit();
		}
	<{/if}>
<{/foreach}>

function userextradomain_checkall(checked) {
	$('#userextradomainlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userextradomainlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userextradomainlist .top-holder').show();

		$('#userextradomainlist .top-holder .selectall').show();
		$('#userextradomainlist .top-holder .clearselection').hide();
	} else {
		$('#userextradomainlist .top-holder').hide();

	    document.userextradomainlist.userextradomainlist_selection_selectall.value = 0;
	}
}

function userextradomain_selectall() {
	userextradomain_checkall(true);

    document.userextradomainlist.userextradomainlist_selection_selectall.value = 1;

	$('#userextradomainlist .top-holder .selectall').hide();
	$('#userextradomainlist .top-holder .clearselection').show();
}

function userextradomain_clearselection() {
	userextradomain_checkall(false);

    document.userextradomainlist.userextradomainlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userextradomain.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userextradomain-pagination-from"><{$limit_from}>-<span class="userextradomain-pagination-to"><{$limit_to}></span> of <span class="userextradomain-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userextradomain/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="userextradomain-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userextradomain-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userextradomain-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userextradomainlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userextradomainlistform :focusable:first').focus();
        }

    	$('#userextradomainlistform').click(function(){
    	    var focused = $('#userextradomainlistform :focus');

    	    if (focused.length == 0) {
                $('#userextradomainlistform :focusable:first').focus();
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
