

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="paymenttypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/paymenttype/search" method="get">
            <input type="text" name="paymenttype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#paymenttypequicksearch').submit(); return false;">
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
            $('#paymenttypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#paymenttypequicksearch').submit();
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
<{if isset($smarty.session.acl.paymenttype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.paymenttype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Payment Type', true)|strtolower}>"/><{_t('New')}> <{_t('Payment Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.paymenttype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="paymenttype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.paymenttype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="paymenttype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="paymenttypelist" id="paymenttypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/paymenttype/" method="post">
<input type="hidden" name="paymenttypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function paymenttype_reset() {
	$('input, select', '#paymenttype-search').val('');
}

function paymenttype_search() {
	$('#paymenttype-search').submit();
}

function paymenttype_save() {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/save/?back=0');
	$('#paymenttypelistform').submit();
}

function paymenttype_delete() {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/delete/');
	$('#paymenttypelistform').submit();
}

function paymenttype_copy() {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/copy/');
	$('#paymenttypelistform').submit();
}

function paymenttype_approve() {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/approve/');
	$('#paymenttypelistform').submit();
}

function paymenttype_batchedit() {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/batchedit/');
	$('#paymenttypelistform').submit();
}

function paymenttype_update(col, val) {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/bulkupdate/' + col + '/' + val);
	$('#paymenttypelistform').submit();
}

function paymenttype_dupdate(col, val) {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/bulkdupdate/' + col + '/' + val);
	$('#paymenttypelistform').submit();
}

function paymenttype_customaction(controller, action) {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#paymenttypelistform').submit();
}

function paymenttype_filter(col, val) {
	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/filter/' + col + '/' + val);
	$('#paymenttypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function paymenttype_<{$item->ACTION}>() {
        	$('#paymenttypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/paymenttype/<{$item->ACTION}>/');
        	$('#paymenttypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function paymenttype_checkall(checked) {
	$('#paymenttypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('paymenttypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#paymenttypelist .top-holder').show();

		$('#paymenttypelist .top-holder .selectall').show();
		$('#paymenttypelist .top-holder .clearselection').hide();
	} else {
		$('#paymenttypelist .top-holder').hide();

	    document.paymenttypelist.paymenttypelist_selection_selectall.value = 0;
	}
}

function paymenttype_selectall() {
	paymenttype_checkall(true);

    document.paymenttypelist.paymenttypelist_selection_selectall.value = 1;

	$('#paymenttypelist .top-holder .selectall').hide();
	$('#paymenttypelist .top-holder .clearselection').show();
}

function paymenttype_clearselection() {
	paymenttype_checkall(false);

    document.paymenttypelist.paymenttypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.paymenttype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="paymenttype-pagination-from"><{$limit_from}>-<span class="paymenttype-pagination-to"><{$limit_to}></span> of <span class="paymenttype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#paymenttypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#paymenttypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="paymenttype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.paymenttype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.paymenttype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#paymenttypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#paymenttypelistform :focusable:first').focus();
        }

    	$('#paymenttypelistform').click(function(){
    	    var focused = $('#paymenttypelistform :focus');

    	    if (focused.length == 0) {
                $('#paymenttypelistform :focusable:first').focus();
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

