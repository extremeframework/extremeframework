

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowtransitionquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowtransition/search" method="get">
            <input type="text" name="workflowtransition_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#workflowtransitionquicksearch').submit(); return false;">
	            <span><{_t('L_SEARCH')}></span>
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
            $('#workflowtransitionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowtransitionquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.workflowtransition.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflowtransition.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_WORKFLOW_TRANSITION', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_WORKFLOW_TRANSITION')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflowtransition.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflowtransition_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflowtransition[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflowtransition_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="workflowtransitionlist" id="workflowtransitionlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowtransition/" method="post">
<input type="hidden" name="workflowtransitionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflowtransition_reset() {
	$('input, select', '#workflowtransition-search').val('');
}

function workflowtransition_search() {
	$('#workflowtransition-search').submit();
}

function workflowtransition_save() {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/save/?back=0');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_delete() {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/delete/');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_copy() {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/copy/');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_approve() {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/approve/');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_batchedit() {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/batchedit/');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_update(col, val) {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/bulkupdate/' + col + '/' + val);
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_dupdate(col, val) {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/bulkdupdate/' + col + '/' + val);
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_customaction(controller, action) {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowtransitionlistform').submit();
}

function workflowtransition_filter(col, val) {
	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/filter/' + col + '/' + val);
	$('#workflowtransitionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflowtransition_<{$item->ACTION}>() {
        	$('#workflowtransitionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowtransition/<{$item->ACTION}>/');
        	$('#workflowtransitionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflowtransition_checkall(checked) {
	$('#workflowtransitionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowtransitionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowtransitionlist .top-holder').show();

		$('#workflowtransitionlist .top-holder .selectall').show();
		$('#workflowtransitionlist .top-holder .clearselection').hide();
	} else {
		$('#workflowtransitionlist .top-holder').hide();

	    document.workflowtransitionlist.workflowtransitionlist_selection_selectall.value = 0;
	}
}

function workflowtransition_selectall() {
	workflowtransition_checkall(true);

    document.workflowtransitionlist.workflowtransitionlist_selection_selectall.value = 1;

	$('#workflowtransitionlist .top-holder .selectall').hide();
	$('#workflowtransitionlist .top-holder .clearselection').show();
}

function workflowtransition_clearselection() {
	workflowtransition_checkall(false);

    document.workflowtransitionlist.workflowtransitionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflowtransition.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflowtransition-pagination-from"><{$limit_from}>-<span class="workflowtransition-pagination-to"><{$limit_to}></span> of <span class="workflowtransition-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#workflowtransitionlistform', 'left', '.pagination-prev');
            	bind_hotkey('#workflowtransitionlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="workflowtransition-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflowtransition-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflowtransition-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowtransitionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowtransitionlistform :focusable:first').focus();
        }

    	$('#workflowtransitionlistform').click(function(){
    	    var focused = $('#workflowtransitionlistform :focus');

    	    if (focused.length == 0) {
                $('#workflowtransitionlistform :focusable:first').focus();
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
