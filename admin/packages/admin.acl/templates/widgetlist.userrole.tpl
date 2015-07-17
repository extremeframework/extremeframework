

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userrolequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/userrole/search" method="get">
            <input type="text" name="userrole_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userrolequicksearch').submit(); return false;">
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
            $('#userrolequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userrolequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.userrole.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userrole.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_USER_ROLE', true)|strtolower}>"/><{_t('New')}> <{_t('L_USER_ROLE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userrole.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userrole_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userrole[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userrole_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userrolelist" id="userrolelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/userrole/" method="post">
<input type="hidden" name="userrolelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userrole_reset() {
	$('input, select', '#userrole-search').val('');
}

function userrole_search() {
	$('#userrole-search').submit();
}

function userrole_save() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/save/?back=0');
	$('#userrolelistform').submit();
}

function userrole_delete() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/delete/');
	$('#userrolelistform').submit();
}

function userrole_copy() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/copy/');
	$('#userrolelistform').submit();
}

function userrole_approve() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/approve/');
	$('#userrolelistform').submit();
}

function userrole_batchedit() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/batchedit/');
	$('#userrolelistform').submit();
}

function userrole_update(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/bulkupdate/' + col + '/' + val);
	$('#userrolelistform').submit();
}

function userrole_dupdate(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/bulkdupdate/' + col + '/' + val);
	$('#userrolelistform').submit();
}

function userrole_customaction(controller, action) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userrolelistform').submit();
}

function userrole_filter(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/filter/' + col + '/' + val);
	$('#userrolelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userrole_<{$item->ACTION}>() {
        	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/<{$item->ACTION}>/');
        	$('#userrolelistform').submit();
		}
	<{/if}>
<{/foreach}>

function userrole_checkall(checked) {
	$('#userrolelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userrolelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userrolelist .top-holder').show();

		$('#userrolelist .top-holder .selectall').show();
		$('#userrolelist .top-holder .clearselection').hide();
	} else {
		$('#userrolelist .top-holder').hide();

	    document.userrolelist.userrolelist_selection_selectall.value = 0;
	}
}

function userrole_selectall() {
	userrole_checkall(true);

    document.userrolelist.userrolelist_selection_selectall.value = 1;

	$('#userrolelist .top-holder .selectall').hide();
	$('#userrolelist .top-holder .clearselection').show();
}

function userrole_clearselection() {
	userrole_checkall(false);

    document.userrolelist.userrolelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userrole.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userrole/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userrole-pagination-from"><{$limit_from}>-<span class="userrole-pagination-to"><{$limit_to}></span> of <span class="userrole-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userrole/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#userrolelistform', 'left', '.pagination-prev');
            	bind_hotkey('#userrolelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="userrole-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userrole-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userrole-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userrolelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userrolelistform :focusable:first').focus();
        }

    	$('#userrolelistform').click(function(){
    	    var focused = $('#userrolelistform :focus');

    	    if (focused.length == 0) {
                $('#userrolelistform :focusable:first').focus();
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

