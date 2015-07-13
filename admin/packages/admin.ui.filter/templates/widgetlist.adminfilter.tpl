

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminfilterquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminfilter/search" method="get">
            <input type="text" name="adminfilter_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminfilterquicksearch').submit(); return false;">
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
            $('#adminfilterquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminfilterquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminfilter) }>
<{foreach from=$messages.adminfilter key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.adminfilter.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminfilter.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_ADMIN_FILTER', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_FILTER')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminfilter.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminfilter_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminfilter[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminfilter_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminfilterlist" id="adminfilterlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminfilter/" method="post">
<input type="hidden" name="adminfilterlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminfilter_reset() {
	$('input, select', '#adminfilter-search').val('');
}

function adminfilter_search() {
	$('#adminfilter-search').submit();
}

function adminfilter_save() {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/save/?back=0');
	$('#adminfilterlistform').submit();
}

function adminfilter_delete() {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/');
	$('#adminfilterlistform').submit();
}

function adminfilter_copy() {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/copy/');
	$('#adminfilterlistform').submit();
}

function adminfilter_approve() {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/approve/');
	$('#adminfilterlistform').submit();
}

function adminfilter_batchedit() {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/batchedit/');
	$('#adminfilterlistform').submit();
}

function adminfilter_update(col, val) {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/bulkupdate/' + col + '/' + val);
	$('#adminfilterlistform').submit();
}

function adminfilter_dupdate(col, val) {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/bulkdupdate/' + col + '/' + val);
	$('#adminfilterlistform').submit();
}

function adminfilter_customaction(controller, action) {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminfilterlistform').submit();
}

function adminfilter_filter(col, val) {
	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/filter/' + col + '/' + val);
	$('#adminfilterlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminfilter_<{$item->ACTION}>() {
        	$('#adminfilterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminfilter/<{$item->ACTION}>/');
        	$('#adminfilterlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminfilter_checkall(checked) {
	$('#adminfilterlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminfilterlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminfilterlist .top-holder').show();

		$('#adminfilterlist .top-holder .selectall').show();
		$('#adminfilterlist .top-holder .clearselection').hide();
	} else {
		$('#adminfilterlist .top-holder').hide();

	    document.adminfilterlist.adminfilterlist_selection_selectall.value = 0;
	}
}

function adminfilter_selectall() {
	adminfilter_checkall(true);

    document.adminfilterlist.adminfilterlist_selection_selectall.value = 1;

	$('#adminfilterlist .top-holder .selectall').hide();
	$('#adminfilterlist .top-holder .clearselection').show();
}

function adminfilter_clearselection() {
	adminfilter_checkall(false);

    document.adminfilterlist.adminfilterlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminfilter.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminfilter-pagination-from"><{$limit_from}>-<span class="adminfilter-pagination-to"><{$limit_to}></span> of <span class="adminfilter-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminfilterlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminfilterlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminfilter-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminfilter-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminfilter-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminfilterlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminfilterlistform :focusable:first').focus();
        }

    	$('#adminfilterlistform').click(function(){
    	    var focused = $('#adminfilterlistform :focus');

    	    if (focused.length == 0) {
                $('#adminfilterlistform :focusable:first').focus();
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

