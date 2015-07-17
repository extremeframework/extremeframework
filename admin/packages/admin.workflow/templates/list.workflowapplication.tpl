<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_WORKFLOW_APPLICATION')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowapplicationquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowapplication/search" method="get">
            <input type="text" name="workflowapplication_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#workflowapplicationquicksearch').submit(); return false;">
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
            $('#workflowapplicationquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowapplicationquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.workflowapplication.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflowapplication.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_WORKFLOW_APPLICATION', true)|strtolower}>"/><{_t('New')}> <{_t('L_WORKFLOW_APPLICATION')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflowapplication.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflowapplication_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflowapplication[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflowapplication_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="workflowapplicationlist" id="workflowapplicationlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowapplication/" method="post">
<input type="hidden" name="workflowapplicationlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflowapplication_reset() {
	$('input, select', '#workflowapplication-search').val('');
}

function workflowapplication_search() {
	$('#workflowapplication-search').submit();
}

function workflowapplication_save() {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/save/?back=0');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_delete() {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/delete/');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_copy() {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/copy/');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_approve() {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/approve/');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_batchedit() {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/batchedit/');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_update(col, val) {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/bulkupdate/' + col + '/' + val);
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_dupdate(col, val) {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/bulkdupdate/' + col + '/' + val);
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_customaction(controller, action) {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowapplicationlistform').submit();
}

function workflowapplication_filter(col, val) {
	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/filter/' + col + '/' + val);
	$('#workflowapplicationlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflowapplication_<{$item->ACTION}>() {
        	$('#workflowapplicationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowapplication/<{$item->ACTION}>/');
        	$('#workflowapplicationlistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflowapplication_checkall(checked) {
	$('#workflowapplicationlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowapplicationlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowapplicationlist .top-holder').show();

		$('#workflowapplicationlist .top-holder .selectall').show();
		$('#workflowapplicationlist .top-holder .clearselection').hide();
	} else {
		$('#workflowapplicationlist .top-holder').hide();

	    document.workflowapplicationlist.workflowapplicationlist_selection_selectall.value = 0;
	}
}

function workflowapplication_selectall() {
	workflowapplication_checkall(true);

    document.workflowapplicationlist.workflowapplicationlist_selection_selectall.value = 1;

	$('#workflowapplicationlist .top-holder .selectall').hide();
	$('#workflowapplicationlist .top-holder .clearselection').show();
}

function workflowapplication_clearselection() {
	workflowapplication_checkall(false);

    document.workflowapplicationlist.workflowapplicationlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflowapplication.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflowapplication-pagination-from"><{$limit_from}>-<span class="workflowapplication-pagination-to"><{$limit_to}></span> of <span class="workflowapplication-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowapplication/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="workflowapplication-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflowapplication-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflowapplication-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowapplicationlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowapplicationlistform :focusable:first').focus();
        }

    	$('#workflowapplicationlistform').click(function(){
    	    var focused = $('#workflowapplicationlistform :focus');

    	    if (focused.length == 0) {
                $('#workflowapplicationlistform :focusable:first').focus();
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
