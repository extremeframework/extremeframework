

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userinvitationstatusquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/search" method="get">
            <input type="text" name="userinvitationstatus_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userinvitationstatusquicksearch').submit(); return false;">
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
            $('#userinvitationstatusquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userinvitationstatusquicksearch').submit();
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
<{if isset($smarty.session.acl.userinvitationstatus.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userinvitationstatus.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('User Invitation Status', true)|strtolower}>"/><{_t('New')}> <{_t('User Invitation Status')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userinvitationstatus.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userinvitationstatus_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userinvitationstatus[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userinvitationstatus_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userinvitationstatuslist" id="userinvitationstatuslistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/" method="post">
<input type="hidden" name="userinvitationstatuslist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userinvitationstatus_reset() {
	$('input, select', '#userinvitationstatus-search').val('');
}

function userinvitationstatus_search() {
	$('#userinvitationstatus-search').submit();
}

function userinvitationstatus_save() {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/save/?back=0');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_delete() {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/delete/');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_copy() {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/copy/');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_approve() {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/approve/');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_batchedit() {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/batchedit/');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_update(col, val) {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/bulkupdate/' + col + '/' + val);
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_dupdate(col, val) {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/bulkdupdate/' + col + '/' + val);
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_customaction(controller, action) {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userinvitationstatuslistform').submit();
}

function userinvitationstatus_filter(col, val) {
	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/filter/' + col + '/' + val);
	$('#userinvitationstatuslistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userinvitationstatus_<{$item->ACTION}>() {
        	$('#userinvitationstatuslistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/<{$item->ACTION}>/');
        	$('#userinvitationstatuslistform').submit();
		}
	<{/if}>
<{/foreach}>

function userinvitationstatus_checkall(checked) {
	$('#userinvitationstatuslist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userinvitationstatuslist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userinvitationstatuslist .top-holder').show();

		$('#userinvitationstatuslist .top-holder .selectall').show();
		$('#userinvitationstatuslist .top-holder .clearselection').hide();
	} else {
		$('#userinvitationstatuslist .top-holder').hide();

	    document.userinvitationstatuslist.userinvitationstatuslist_selection_selectall.value = 0;
	}
}

function userinvitationstatus_selectall() {
	userinvitationstatus_checkall(true);

    document.userinvitationstatuslist.userinvitationstatuslist_selection_selectall.value = 1;

	$('#userinvitationstatuslist .top-holder .selectall').hide();
	$('#userinvitationstatuslist .top-holder .clearselection').show();
}

function userinvitationstatus_clearselection() {
	userinvitationstatus_checkall(false);

    document.userinvitationstatuslist.userinvitationstatuslist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userinvitationstatus.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userinvitationstatus-pagination-from"><{$limit_from}>-<span class="userinvitationstatus-pagination-to"><{$limit_to}></span> of <span class="userinvitationstatus-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#userinvitationstatuslistform', 'left', '.pagination-prev');
            	bind_hotkey('#userinvitationstatuslistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="userinvitationstatus-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userinvitationstatus-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userinvitationstatus-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userinvitationstatuslistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userinvitationstatuslistform :focusable:first').focus();
        }

    	$('#userinvitationstatuslistform').click(function(){
    	    var focused = $('#userinvitationstatuslistform :focus');

    	    if (focused.length == 0) {
                $('#userinvitationstatuslistform :focusable:first').focus();
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

