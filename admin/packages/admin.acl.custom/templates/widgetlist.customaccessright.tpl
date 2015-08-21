

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="customaccessrightquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/customaccessright/search" method="get">
            <input type="text" name="customaccessright_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#customaccessrightquicksearch').submit(); return false;">
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
            $('#customaccessrightquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#customaccessrightquicksearch').submit();
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
<{if isset($smarty.session.acl.customaccessright.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.customaccessright.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Custom Access Right', true)|strtolower}>"/><{_t('New')}> <{_t('Custom Access Right')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.customaccessright.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="customaccessright_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.customaccessright[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="customaccessright_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="customaccessrightlist" id="customaccessrightlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/customaccessright/" method="post">
<input type="hidden" name="customaccessrightlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function customaccessright_reset() {
	$('input, select', '#customaccessright-search').val('');
}

function customaccessright_search() {
	$('#customaccessright-search').submit();
}

function customaccessright_save() {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/save/?back=0');
	$('#customaccessrightlistform').submit();
}

function customaccessright_delete() {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/delete/');
	$('#customaccessrightlistform').submit();
}

function customaccessright_copy() {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/copy/');
	$('#customaccessrightlistform').submit();
}

function customaccessright_approve() {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/approve/');
	$('#customaccessrightlistform').submit();
}

function customaccessright_batchedit() {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/batchedit/');
	$('#customaccessrightlistform').submit();
}

function customaccessright_update(col, val) {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/bulkupdate/' + col + '/' + val);
	$('#customaccessrightlistform').submit();
}

function customaccessright_dupdate(col, val) {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/bulkdupdate/' + col + '/' + val);
	$('#customaccessrightlistform').submit();
}

function customaccessright_customaction(controller, action) {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#customaccessrightlistform').submit();
}

function customaccessright_filter(col, val) {
	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/filter/' + col + '/' + val);
	$('#customaccessrightlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function customaccessright_<{$item->ACTION}>() {
        	$('#customaccessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/customaccessright/<{$item->ACTION}>/');
        	$('#customaccessrightlistform').submit();
		}
	<{/if}>
<{/foreach}>

function customaccessright_checkall(checked) {
	$('#customaccessrightlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('customaccessrightlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#customaccessrightlist .top-holder').show();

		$('#customaccessrightlist .top-holder .selectall').show();
		$('#customaccessrightlist .top-holder .clearselection').hide();
	} else {
		$('#customaccessrightlist .top-holder').hide();

	    document.customaccessrightlist.customaccessrightlist_selection_selectall.value = 0;
	}
}

function customaccessright_selectall() {
	customaccessright_checkall(true);

    document.customaccessrightlist.customaccessrightlist_selection_selectall.value = 1;

	$('#customaccessrightlist .top-holder .selectall').hide();
	$('#customaccessrightlist .top-holder .clearselection').show();
}

function customaccessright_clearselection() {
	customaccessright_checkall(false);

    document.customaccessrightlist.customaccessrightlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.customaccessright.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="customaccessright-pagination-from"><{$limit_from}>-<span class="customaccessright-pagination-to"><{$limit_to}></span> of <span class="customaccessright-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/customaccessright/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#customaccessrightlistform', 'left', '.pagination-prev');
            	bind_hotkey('#customaccessrightlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="customaccessright-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.customaccessright-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.customaccessright-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#customaccessrightlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#customaccessrightlistform :focusable:first').focus();
        }

    	$('#customaccessrightlistform').click(function(){
    	    var focused = $('#customaccessrightlistform :focus');

    	    if (focused.length == 0) {
                $('#customaccessrightlistform :focusable:first').focus();
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

