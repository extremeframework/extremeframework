

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="widgetpositionquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/widgetposition/search" method="get">
            <input type="text" name="widgetposition_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#widgetpositionquicksearch').submit(); return false;">
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
            $('#widgetpositionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#widgetpositionquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.widgetposition.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.widgetposition.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_WIDGET_POSITION', true)|strtolower}>"/><{_t('New')}> <{_t('L_WIDGET_POSITION')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.widgetposition.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="widgetposition_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.widgetposition[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="widgetposition_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="widgetpositionlist" id="widgetpositionlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/widgetposition/" method="post">
<input type="hidden" name="widgetpositionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function widgetposition_reset() {
	$('input, select', '#widgetposition-search').val('');
}

function widgetposition_search() {
	$('#widgetposition-search').submit();
}

function widgetposition_save() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/save/?back=0');
	$('#widgetpositionlistform').submit();
}

function widgetposition_delete() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/delete/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_copy() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/copy/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_approve() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/approve/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_batchedit() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/batchedit/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_update(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/bulkupdate/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

function widgetposition_dupdate(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/bulkdupdate/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

function widgetposition_customaction(controller, action) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_filter(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/filter/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function widgetposition_<{$item->ACTION}>() {
        	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/<{$item->ACTION}>/');
        	$('#widgetpositionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function widgetposition_checkall(checked) {
	$('#widgetpositionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('widgetpositionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#widgetpositionlist .top-holder').show();

		$('#widgetpositionlist .top-holder .selectall').show();
		$('#widgetpositionlist .top-holder .clearselection').hide();
	} else {
		$('#widgetpositionlist .top-holder').hide();

	    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 0;
	}
}

function widgetposition_selectall() {
	widgetposition_checkall(true);

    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 1;

	$('#widgetpositionlist .top-holder .selectall').hide();
	$('#widgetpositionlist .top-holder .clearselection').show();
}

function widgetposition_clearselection() {
	widgetposition_checkall(false);

    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.widgetposition.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="widgetposition-pagination-from"><{$limit_from}>-<span class="widgetposition-pagination-to"><{$limit_to}></span> of <span class="widgetposition-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#widgetpositionlistform', 'left', '.pagination-prev');
            	bind_hotkey('#widgetpositionlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="widgetposition-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.widgetposition-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.widgetposition-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#widgetpositionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#widgetpositionlistform :focusable:first').focus();
        }

    	$('#widgetpositionlistform').click(function(){
    	    var focused = $('#widgetpositionlistform :focus');

    	    if (focused.length == 0) {
                $('#widgetpositionlistform :focusable:first').focus();
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

