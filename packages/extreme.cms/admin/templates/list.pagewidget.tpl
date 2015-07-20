<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Page Widget')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagewidgetquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/pagewidget/search" method="get">
            <input type="text" name="pagewidget_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagewidgetquicksearch').submit(); return false;">
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
            $('#pagewidgetquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagewidgetquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.pagewidget.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.pagewidget.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Page Widget', true)|strtolower}>"/><{_t('New')}> <{_t('Page Widget')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.pagewidget.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="pagewidget_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.pagewidget.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.pagewidget.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.pagewidget[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="pagewidget_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="pagewidgetlist" id="pagewidgetlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/pagewidget/" method="post">
<input type="hidden" name="pagewidgetlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function pagewidget_reset() {
	$('input, select', '#pagewidget-search').val('');
}

function pagewidget_search() {
	$('#pagewidget-search').submit();
}

function pagewidget_save() {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/save/?back=0');
	$('#pagewidgetlistform').submit();
}

function pagewidget_delete() {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/delete/');
	$('#pagewidgetlistform').submit();
}

function pagewidget_copy() {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/copy/');
	$('#pagewidgetlistform').submit();
}

function pagewidget_approve() {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/approve/');
	$('#pagewidgetlistform').submit();
}

function pagewidget_batchedit() {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/batchedit/');
	$('#pagewidgetlistform').submit();
}

function pagewidget_update(col, val) {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/bulkupdate/' + col + '/' + val);
	$('#pagewidgetlistform').submit();
}

function pagewidget_dupdate(col, val) {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/bulkdupdate/' + col + '/' + val);
	$('#pagewidgetlistform').submit();
}

function pagewidget_customaction(controller, action) {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagewidgetlistform').submit();
}

function pagewidget_filter(col, val) {
	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/filter/' + col + '/' + val);
	$('#pagewidgetlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function pagewidget_<{$item->ACTION}>() {
        	$('#pagewidgetlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagewidget/<{$item->ACTION}>/');
        	$('#pagewidgetlistform').submit();
		}
	<{/if}>
<{/foreach}>

function pagewidget_checkall(checked) {
	$('#pagewidgetlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagewidgetlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagewidgetlist .top-holder').show();

		$('#pagewidgetlist .top-holder .selectall').show();
		$('#pagewidgetlist .top-holder .clearselection').hide();
	} else {
		$('#pagewidgetlist .top-holder').hide();

	    document.pagewidgetlist.pagewidgetlist_selection_selectall.value = 0;
	}
}

function pagewidget_selectall() {
	pagewidget_checkall(true);

    document.pagewidgetlist.pagewidgetlist_selection_selectall.value = 1;

	$('#pagewidgetlist .top-holder .selectall').hide();
	$('#pagewidgetlist .top-holder .clearselection').show();
}

function pagewidget_clearselection() {
	pagewidget_checkall(false);

    document.pagewidgetlist.pagewidgetlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.pagewidget.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="pagewidget-pagination-from"><{$limit_from}>-<span class="pagewidget-pagination-to"><{$limit_to}></span> of <span class="pagewidget-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="pagewidget-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.pagewidget-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.pagewidget-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagewidgetlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagewidgetlistform :focusable:first').focus();
        }

    	$('#pagewidgetlistform').click(function(){
    	    var focused = $('#pagewidgetlistform :focus');

    	    if (focused.length == 0) {
                $('#pagewidgetlistform :focusable:first').focus();
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
