

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminorderstatusquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/search" method="get">
            <input type="text" name="adminorderstatus_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminorderstatusquicksearch').submit(); return false;">
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
            $('#adminorderstatusquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminorderstatusquicksearch').submit();
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
<{if isset($smarty.session.acl.adminorderstatus.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminorderstatus.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Order Status', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Order Status')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminorderstatus.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminorderstatus_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminorderstatus[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminorderstatus_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminorderstatuslist" id="adminorderstatuslistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/" method="post">
<input type="hidden" name="adminorderstatuslist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminorderstatus_reset() {
	$('input, select', '#adminorderstatus-search').val('');
}

function adminorderstatus_search() {
	$('#adminorderstatus-search').submit();
}

function adminorderstatus_save() {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/save/?back=0');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_delete() {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/delete/');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_copy() {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/copy/');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_approve() {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/approve/');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_batchedit() {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/batchedit/');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_update(col, val) {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/bulkupdate/' + col + '/' + val);
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_dupdate(col, val) {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/bulkdupdate/' + col + '/' + val);
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_customaction(controller, action) {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminorderstatuslistform').submit();
}

function adminorderstatus_filter(col, val) {
	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/filter/' + col + '/' + val);
	$('#adminorderstatuslistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminorderstatus_<{$item->ACTION}>() {
        	$('#adminorderstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderstatus/<{$item->ACTION}>/');
        	$('#adminorderstatuslistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminorderstatus_checkall(checked) {
	$('#adminorderstatuslist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminorderstatuslist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminorderstatuslist .top-holder').show();

		$('#adminorderstatuslist .top-holder .selectall').show();
		$('#adminorderstatuslist .top-holder .clearselection').hide();
	} else {
		$('#adminorderstatuslist .top-holder').hide();

	    document.adminorderstatuslist.adminorderstatuslist_selection_selectall.value = 0;
	}
}

function adminorderstatus_selectall() {
	adminorderstatus_checkall(true);

    document.adminorderstatuslist.adminorderstatuslist_selection_selectall.value = 1;

	$('#adminorderstatuslist .top-holder .selectall').hide();
	$('#adminorderstatuslist .top-holder .clearselection').show();
}

function adminorderstatus_clearselection() {
	adminorderstatus_checkall(false);

    document.adminorderstatuslist.adminorderstatuslist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminorderstatus.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminorderstatus-pagination-from"><{$limit_from}>-<span class="adminorderstatus-pagination-to"><{$limit_to}></span> of <span class="adminorderstatus-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminorderstatuslistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminorderstatuslistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminorderstatus-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminorderstatus-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminorderstatus-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminorderstatuslistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminorderstatuslistform :focusable:first').focus();
        }

    	$('#adminorderstatuslistform').click(function(){
    	    var focused = $('#adminorderstatuslistform :focus');

    	    if (focused.length == 0) {
                $('#adminorderstatuslistform :focusable:first').focus();
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

