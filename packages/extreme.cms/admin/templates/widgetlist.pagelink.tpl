

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagelinkquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagelink/search" method="get">
            <input type="text" name="pagelink_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagelinkquicksearch').submit(); return false;">
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
            $('#pagelinkquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagelinkquicksearch').submit();
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
<{if isset($smarty.session.acl.pagelink.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.pagelink.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelink/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Page Link', true)|strtolower}>"/><{_t('New')}> <{_t('Page Link')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.pagelink.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="pagelink_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.pagelink[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="pagelink_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="pagelinklist" id="pagelinklistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagelink/" method="post">
<input type="hidden" name="pagelinklist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function pagelink_reset() {
	$('input, select', '#pagelink-search').val('');
}

function pagelink_search() {
	$('#pagelink-search').submit();
}

function pagelink_save() {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/save/?back=0');
	$('#pagelinklistform').submit();
}

function pagelink_delete() {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/delete/');
	$('#pagelinklistform').submit();
}

function pagelink_copy() {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/copy/');
	$('#pagelinklistform').submit();
}

function pagelink_approve() {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/approve/');
	$('#pagelinklistform').submit();
}

function pagelink_batchedit() {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/batchedit/');
	$('#pagelinklistform').submit();
}

function pagelink_update(col, val) {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/bulkupdate/' + col + '/' + val);
	$('#pagelinklistform').submit();
}

function pagelink_dupdate(col, val) {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/bulkdupdate/' + col + '/' + val);
	$('#pagelinklistform').submit();
}

function pagelink_customaction(controller, action) {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagelinklistform').submit();
}

function pagelink_filter(col, val) {
	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/filter/' + col + '/' + val);
	$('#pagelinklistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function pagelink_<{$item->ACTION}>() {
        	$('#pagelinklistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelink/<{$item->ACTION}>/');
        	$('#pagelinklistform').submit();
		}
	<{/if}>
<{/foreach}>

function pagelink_checkall(checked) {
	$('#pagelinklist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagelinklist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagelinklist .top-holder').show();

		$('#pagelinklist .top-holder .selectall').show();
		$('#pagelinklist .top-holder .clearselection').hide();
	} else {
		$('#pagelinklist .top-holder').hide();

	    document.pagelinklist.pagelinklist_selection_selectall.value = 0;
	}
}

function pagelink_selectall() {
	pagelink_checkall(true);

    document.pagelinklist.pagelinklist_selection_selectall.value = 1;

	$('#pagelinklist .top-holder .selectall').hide();
	$('#pagelinklist .top-holder .clearselection').show();
}

function pagelink_clearselection() {
	pagelink_checkall(false);

    document.pagelinklist.pagelinklist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.pagelink.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagelink/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="pagelink-pagination-from"><{$limit_from}>-<span class="pagelink-pagination-to"><{$limit_to}></span> of <span class="pagelink-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagelink/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#pagelinklistform', 'left', '.pagination-prev');
            	bind_hotkey('#pagelinklistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="pagelink-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.pagelink-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.pagelink-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagelinklistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagelinklistform :focusable:first').focus();
        }

    	$('#pagelinklistform').click(function(){
    	    var focused = $('#pagelinklistform :focus');

    	    if (focused.length == 0) {
                $('#pagelinklistform :focusable:first').focus();
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

