

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagelinktypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagelinktype/search" method="get">
            <input type="text" name="pagelinktype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagelinktypequicksearch').submit(); return false;">
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
            $('#pagelinktypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagelinktypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.pagelinktype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.pagelinktype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_PAGE_LINK_TYPE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_PAGE_LINK_TYPE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.pagelinktype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="pagelinktype_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.pagelinktype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="pagelinktype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="pagelinktypelist" id="pagelinktypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagelinktype/" method="post">
<input type="hidden" name="pagelinktypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function pagelinktype_reset() {
	$('input, select', '#pagelinktype-search').val('');
}

function pagelinktype_search() {
	$('#pagelinktype-search').submit();
}

function pagelinktype_save() {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/save/?back=0');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_delete() {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/delete/');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_copy() {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/copy/');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_approve() {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/approve/');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_batchedit() {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/batchedit/');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_update(col, val) {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/bulkupdate/' + col + '/' + val);
	$('#pagelinktypelistform').submit();
}

function pagelinktype_dupdate(col, val) {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/bulkdupdate/' + col + '/' + val);
	$('#pagelinktypelistform').submit();
}

function pagelinktype_customaction(controller, action) {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagelinktypelistform').submit();
}

function pagelinktype_filter(col, val) {
	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/filter/' + col + '/' + val);
	$('#pagelinktypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function pagelinktype_<{$item->ACTION}>() {
        	$('#pagelinktypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagelinktype/<{$item->ACTION}>/');
        	$('#pagelinktypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function pagelinktype_checkall(checked) {
	$('#pagelinktypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagelinktypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagelinktypelist .top-holder').show();

		$('#pagelinktypelist .top-holder .selectall').show();
		$('#pagelinktypelist .top-holder .clearselection').hide();
	} else {
		$('#pagelinktypelist .top-holder').hide();

	    document.pagelinktypelist.pagelinktypelist_selection_selectall.value = 0;
	}
}

function pagelinktype_selectall() {
	pagelinktype_checkall(true);

    document.pagelinktypelist.pagelinktypelist_selection_selectall.value = 1;

	$('#pagelinktypelist .top-holder .selectall').hide();
	$('#pagelinktypelist .top-holder .clearselection').show();
}

function pagelinktype_clearselection() {
	pagelinktype_checkall(false);

    document.pagelinktypelist.pagelinktypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.pagelinktype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="pagelinktype-pagination-from"><{$limit_from}>-<span class="pagelinktype-pagination-to"><{$limit_to}></span> of <span class="pagelinktype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagelinktype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#pagelinktypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#pagelinktypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="pagelinktype-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.pagelinktype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.pagelinktype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagelinktypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagelinktypelistform :focusable:first').focus();
        }

    	$('#pagelinktypelistform').click(function(){
    	    var focused = $('#pagelinktypelistform :focus');

    	    if (focused.length == 0) {
                $('#pagelinktypelistform :focusable:first').focus();
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

