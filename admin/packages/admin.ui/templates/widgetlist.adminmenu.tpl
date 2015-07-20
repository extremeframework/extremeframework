

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminmenuquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenu/search" method="get">
            <input type="text" name="adminmenu_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminmenuquicksearch').submit(); return false;">
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
            $('#adminmenuquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminmenuquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminmenu.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminmenu.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Menu', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Menu')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminmenu.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminmenu_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminmenu[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminmenu_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminmenulist" id="adminmenulistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenu/" method="post">
<input type="hidden" name="adminmenulist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminmenu_reset() {
	$('input, select', '#adminmenu-search').val('');
}

function adminmenu_search() {
	$('#adminmenu-search').submit();
}

function adminmenu_save() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/save/?back=0');
	$('#adminmenulistform').submit();
}

function adminmenu_delete() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/delete/');
	$('#adminmenulistform').submit();
}

function adminmenu_copy() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/copy/');
	$('#adminmenulistform').submit();
}

function adminmenu_approve() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/approve/');
	$('#adminmenulistform').submit();
}

function adminmenu_batchedit() {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/batchedit/');
	$('#adminmenulistform').submit();
}

function adminmenu_update(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/bulkupdate/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

function adminmenu_dupdate(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/bulkdupdate/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

function adminmenu_customaction(controller, action) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminmenulistform').submit();
}

function adminmenu_filter(col, val) {
	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/filter/' + col + '/' + val);
	$('#adminmenulistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminmenu_<{$item->ACTION}>() {
        	$('#adminmenulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenu/<{$item->ACTION}>/');
        	$('#adminmenulistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminmenu_checkall(checked) {
	$('#adminmenulist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminmenulist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminmenulist .top-holder').show();

		$('#adminmenulist .top-holder .selectall').show();
		$('#adminmenulist .top-holder .clearselection').hide();
	} else {
		$('#adminmenulist .top-holder').hide();

	    document.adminmenulist.adminmenulist_selection_selectall.value = 0;
	}
}

function adminmenu_selectall() {
	adminmenu_checkall(true);

    document.adminmenulist.adminmenulist_selection_selectall.value = 1;

	$('#adminmenulist .top-holder .selectall').hide();
	$('#adminmenulist .top-holder .clearselection').show();
}

function adminmenu_clearselection() {
	adminmenu_checkall(false);

    document.adminmenulist.adminmenulist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminmenu.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminmenu-pagination-from"><{$limit_from}>-<span class="adminmenu-pagination-to"><{$limit_to}></span> of <span class="adminmenu-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminmenulistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminmenulistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminmenu-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminmenu-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminmenu-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminmenulistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmenulistform :focusable:first').focus();
        }

    	$('#adminmenulistform').click(function(){
    	    var focused = $('#adminmenulistform :focus');

    	    if (focused.length == 0) {
                $('#adminmenulistform :focusable:first').focus();
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

