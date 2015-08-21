

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userpreferencequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/userpreference/search" method="get">
            <input type="text" name="userpreference_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userpreferencequicksearch').submit(); return false;">
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
            $('#userpreferencequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userpreferencequicksearch').submit();
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
<{if isset($smarty.session.acl.userpreference.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userpreference.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpreference/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('User Preference', true)|strtolower}>"/><{_t('New')}> <{_t('User Preference')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userpreference.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userpreference_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userpreference[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userpreference_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userpreferencelist" id="userpreferencelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/userpreference/" method="post">
<input type="hidden" name="userpreferencelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userpreference_reset() {
	$('input, select', '#userpreference-search').val('');
}

function userpreference_search() {
	$('#userpreference-search').submit();
}

function userpreference_save() {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/save/?back=0');
	$('#userpreferencelistform').submit();
}

function userpreference_delete() {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/delete/');
	$('#userpreferencelistform').submit();
}

function userpreference_copy() {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/copy/');
	$('#userpreferencelistform').submit();
}

function userpreference_approve() {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/approve/');
	$('#userpreferencelistform').submit();
}

function userpreference_batchedit() {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/batchedit/');
	$('#userpreferencelistform').submit();
}

function userpreference_update(col, val) {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/bulkupdate/' + col + '/' + val);
	$('#userpreferencelistform').submit();
}

function userpreference_dupdate(col, val) {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/bulkdupdate/' + col + '/' + val);
	$('#userpreferencelistform').submit();
}

function userpreference_customaction(controller, action) {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userpreferencelistform').submit();
}

function userpreference_filter(col, val) {
	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/filter/' + col + '/' + val);
	$('#userpreferencelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userpreference_<{$item->ACTION}>() {
        	$('#userpreferencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpreference/<{$item->ACTION}>/');
        	$('#userpreferencelistform').submit();
		}
	<{/if}>
<{/foreach}>

function userpreference_checkall(checked) {
	$('#userpreferencelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userpreferencelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userpreferencelist .top-holder').show();

		$('#userpreferencelist .top-holder .selectall').show();
		$('#userpreferencelist .top-holder .clearselection').hide();
	} else {
		$('#userpreferencelist .top-holder').hide();

	    document.userpreferencelist.userpreferencelist_selection_selectall.value = 0;
	}
}

function userpreference_selectall() {
	userpreference_checkall(true);

    document.userpreferencelist.userpreferencelist_selection_selectall.value = 1;

	$('#userpreferencelist .top-holder .selectall').hide();
	$('#userpreferencelist .top-holder .clearselection').show();
}

function userpreference_clearselection() {
	userpreference_checkall(false);

    document.userpreferencelist.userpreferencelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userpreference.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userpreference-pagination-from"><{$limit_from}>-<span class="userpreference-pagination-to"><{$limit_to}></span> of <span class="userpreference-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpreference/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#userpreferencelistform', 'left', '.pagination-prev');
            	bind_hotkey('#userpreferencelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="userpreference-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userpreference-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userpreference-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userpreferencelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userpreferencelistform :focusable:first').focus();
        }

    	$('#userpreferencelistform').click(function(){
    	    var focused = $('#userpreferencelistform :focus');

    	    if (focused.length == 0) {
                $('#userpreferencelistform :focusable:first').focus();
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

