

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpackageshortcutquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/search" method="get">
            <input type="text" name="adminpackageshortcut_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpackageshortcutquicksearch').submit(); return false;">
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
            $('#adminpackageshortcutquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpackageshortcutquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminpackageshortcut.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpackageshortcut.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Package Shortcut', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Package Shortcut')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpackageshortcut.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpackageshortcut_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpackageshortcut[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpackageshortcut_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminpackageshortcutlist" id="adminpackageshortcutlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/" method="post">
<input type="hidden" name="adminpackageshortcutlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpackageshortcut_reset() {
	$('input, select', '#adminpackageshortcut-search').val('');
}

function adminpackageshortcut_search() {
	$('#adminpackageshortcut-search').submit();
}

function adminpackageshortcut_save() {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/save/?back=0');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_delete() {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/delete/');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_copy() {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/copy/');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_approve() {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/approve/');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_batchedit() {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/batchedit/');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_update(col, val) {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/bulkupdate/' + col + '/' + val);
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_dupdate(col, val) {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/bulkdupdate/' + col + '/' + val);
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_customaction(controller, action) {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpackageshortcutlistform').submit();
}

function adminpackageshortcut_filter(col, val) {
	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/filter/' + col + '/' + val);
	$('#adminpackageshortcutlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpackageshortcut_<{$item->ACTION}>() {
        	$('#adminpackageshortcutlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/<{$item->ACTION}>/');
        	$('#adminpackageshortcutlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpackageshortcut_checkall(checked) {
	$('#adminpackageshortcutlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpackageshortcutlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpackageshortcutlist .top-holder').show();

		$('#adminpackageshortcutlist .top-holder .selectall').show();
		$('#adminpackageshortcutlist .top-holder .clearselection').hide();
	} else {
		$('#adminpackageshortcutlist .top-holder').hide();

	    document.adminpackageshortcutlist.adminpackageshortcutlist_selection_selectall.value = 0;
	}
}

function adminpackageshortcut_selectall() {
	adminpackageshortcut_checkall(true);

    document.adminpackageshortcutlist.adminpackageshortcutlist_selection_selectall.value = 1;

	$('#adminpackageshortcutlist .top-holder .selectall').hide();
	$('#adminpackageshortcutlist .top-holder .clearselection').show();
}

function adminpackageshortcut_clearselection() {
	adminpackageshortcut_checkall(false);

    document.adminpackageshortcutlist.adminpackageshortcutlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpackageshortcut.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpackageshortcut-pagination-from"><{$limit_from}>-<span class="adminpackageshortcut-pagination-to"><{$limit_to}></span> of <span class="adminpackageshortcut-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackageshortcut/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminpackageshortcutlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminpackageshortcutlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminpackageshortcut-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpackageshortcut-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpackageshortcut-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpackageshortcutlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackageshortcutlistform :focusable:first').focus();
        }

    	$('#adminpackageshortcutlistform').click(function(){
    	    var focused = $('#adminpackageshortcutlistform :focus');

    	    if (focused.length == 0) {
                $('#adminpackageshortcutlistform :focusable:first').focus();
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

