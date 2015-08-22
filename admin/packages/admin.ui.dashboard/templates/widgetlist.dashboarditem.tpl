

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="dashboarditemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/dashboarditem/search" method="get">
            <input type="text" name="dashboarditem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#dashboarditemquicksearch').submit(); return false;">
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
            $('#dashboarditemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#dashboarditemquicksearch').submit();
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
<{if isset($smarty.session.acl.dashboarditem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.dashboarditem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Dashboard Item', true)|strtolower}>"/><{_t('New')}> <{_t('Dashboard Item')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.dashboarditem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="dashboarditem_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.dashboarditem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="dashboarditem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="dashboarditemlist" id="dashboarditemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/dashboarditem/" method="post">
<input type="hidden" name="dashboarditemlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function dashboarditem_reset() {
	$('input, select', '#dashboarditem-search').val('');
}

function dashboarditem_search() {
	$('#dashboarditem-search').submit();
}

function dashboarditem_save() {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/save/?back=0');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_delete() {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/delete/');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_copy() {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/copy/');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_approve() {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/approve/');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_batchedit() {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/batchedit/');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_update(col, val) {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/bulkupdate/' + col + '/' + val);
	$('#dashboarditemlistform').submit();
}

function dashboarditem_dupdate(col, val) {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/bulkdupdate/' + col + '/' + val);
	$('#dashboarditemlistform').submit();
}

function dashboarditem_customaction(controller, action) {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#dashboarditemlistform').submit();
}

function dashboarditem_filter(col, val) {
	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/filter/' + col + '/' + val);
	$('#dashboarditemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function dashboarditem_<{$item->ACTION}>() {
        	$('#dashboarditemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboarditem/<{$item->ACTION}>/');
        	$('#dashboarditemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function dashboarditem_checkall(checked) {
	$('#dashboarditemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('dashboarditemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#dashboarditemlist .top-holder').show();

		$('#dashboarditemlist .top-holder .selectall').show();
		$('#dashboarditemlist .top-holder .clearselection').hide();
	} else {
		$('#dashboarditemlist .top-holder').hide();

	    document.dashboarditemlist.dashboarditemlist_selection_selectall.value = 0;
	}
}

function dashboarditem_selectall() {
	dashboarditem_checkall(true);

    document.dashboarditemlist.dashboarditemlist_selection_selectall.value = 1;

	$('#dashboarditemlist .top-holder .selectall').hide();
	$('#dashboarditemlist .top-holder .clearselection').show();
}

function dashboarditem_clearselection() {
	dashboarditem_checkall(false);

    document.dashboarditemlist.dashboarditemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.dashboarditem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="dashboarditem-pagination-from"><{$limit_from}>-<span class="dashboarditem-pagination-to"><{$limit_to}></span> of <span class="dashboarditem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/dashboarditem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#dashboarditemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#dashboarditemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="dashboarditem-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.dashboarditem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.dashboarditem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#dashboarditemlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#dashboarditemlistform :focusable:first').focus();
        }

    	$('#dashboarditemlistform').click(function(){
    	    var focused = $('#dashboarditemlistform :focus');

    	    if (focused.length == 0) {
                $('#dashboarditemlistform :focusable:first').focus();
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

