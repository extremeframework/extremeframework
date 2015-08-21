

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowstagequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowstage/search" method="get">
            <input type="text" name="workflowstage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#workflowstagequicksearch').submit(); return false;">
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
            $('#workflowstagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowstagequicksearch').submit();
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
<{if isset($smarty.session.acl.workflowstage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflowstage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Workflow Stage', true)|strtolower}>"/><{_t('New')}> <{_t('Workflow Stage')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflowstage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflowstage_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflowstage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflowstage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="workflowstagelist" id="workflowstagelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowstage/" method="post">
<input type="hidden" name="workflowstagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflowstage_reset() {
	$('input, select', '#workflowstage-search').val('');
}

function workflowstage_search() {
	$('#workflowstage-search').submit();
}

function workflowstage_save() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/save/?back=0');
	$('#workflowstagelistform').submit();
}

function workflowstage_delete() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/delete/');
	$('#workflowstagelistform').submit();
}

function workflowstage_copy() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/copy/');
	$('#workflowstagelistform').submit();
}

function workflowstage_approve() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/approve/');
	$('#workflowstagelistform').submit();
}

function workflowstage_batchedit() {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/batchedit/');
	$('#workflowstagelistform').submit();
}

function workflowstage_update(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/bulkupdate/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

function workflowstage_dupdate(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/bulkdupdate/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

function workflowstage_customaction(controller, action) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowstagelistform').submit();
}

function workflowstage_filter(col, val) {
	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/filter/' + col + '/' + val);
	$('#workflowstagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflowstage_<{$item->ACTION}>() {
        	$('#workflowstagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowstage/<{$item->ACTION}>/');
        	$('#workflowstagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflowstage_checkall(checked) {
	$('#workflowstagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowstagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowstagelist .top-holder').show();

		$('#workflowstagelist .top-holder .selectall').show();
		$('#workflowstagelist .top-holder .clearselection').hide();
	} else {
		$('#workflowstagelist .top-holder').hide();

	    document.workflowstagelist.workflowstagelist_selection_selectall.value = 0;
	}
}

function workflowstage_selectall() {
	workflowstage_checkall(true);

    document.workflowstagelist.workflowstagelist_selection_selectall.value = 1;

	$('#workflowstagelist .top-holder .selectall').hide();
	$('#workflowstagelist .top-holder .clearselection').show();
}

function workflowstage_clearselection() {
	workflowstage_checkall(false);

    document.workflowstagelist.workflowstagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflowstage.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflowstage-pagination-from"><{$limit_from}>-<span class="workflowstage-pagination-to"><{$limit_to}></span> of <span class="workflowstage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowstage/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#workflowstagelistform', 'left', '.pagination-prev');
            	bind_hotkey('#workflowstagelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="workflowstage-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflowstage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflowstage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowstagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowstagelistform :focusable:first').focus();
        }

    	$('#workflowstagelistform').click(function(){
    	    var focused = $('#workflowstagelistform :focus');

    	    if (focused.length == 0) {
                $('#workflowstagelistform :focusable:first').focus();
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

