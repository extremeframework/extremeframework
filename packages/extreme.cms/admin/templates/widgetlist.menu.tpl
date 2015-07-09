

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="menuquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/menu/search" method="post" enctype="multipart/form-data">
            <input type="text" name="menu_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#menuquicksearch').submit(); return false;">
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
            $('#menuquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#menuquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.menu) }>
<{foreach from=$messages.menu key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="menulist" id="menulistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/menu/" method="post">

<input type="hidden" name="menulist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.menu.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.menu.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/menu/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_MENU')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_MENU')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.menu.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="menu_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.menu[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="menu_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function menu_reset() {
	$('input, select', '#menu-search').val('');
}

function menu_search() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/search/');
	$('#menulistform').submit();
}

function menu_save() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/save/?back=0');
	$('#menulistform').submit();
}

function menu_delete() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/delete/');
	$('#menulistform').submit();
}

function menu_copy() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/copy/');
	$('#menulistform').submit();
}

function menu_approve() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/approve/');
	$('#menulistform').submit();
}

function menu_batchedit() {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/batchedit/');
	$('#menulistform').submit();
}

function menu_update(col, val) {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/bulkupdate/' + col + '/' + val);
	$('#menulistform').submit();
}

function menu_dupdate(col, val) {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/bulkdupdate/' + col + '/' + val);
	$('#menulistform').submit();
}

function menu_customaction(controller, action) {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#menulistform').submit();
}

function menu_filter(col, val) {
	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/filter/' + col + '/' + val);
	$('#menulistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function menu_<{$item->ACTION}>() {
        	$('#menulistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menu/<{$item->ACTION}>/');
        	$('#menulistform').submit();
		}
	<{/if}>
<{/foreach}>

function menu_checkall(checked) {
	$('#menulist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('menulist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#menulist .top-holder').show();

		$('#menulist .top-holder .selectall').show();
		$('#menulist .top-holder .clearselection').hide();
	} else {
		$('#menulist .top-holder').hide();

	    document.menulist.menulist_selection_selectall.value = 0;
	}
}

function menu_selectall() {
	menu_checkall(true);

    document.menulist.menulist_selection_selectall.value = 1;

	$('#menulist .top-holder .selectall').hide();
	$('#menulist .top-holder .clearselection').show();
}

function menu_clearselection() {
	menu_checkall(false);

    document.menulist.menulist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.menu.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/menu/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="menu-pagination-from"><{$limit_from}>-<span class="menu-pagination-to"><{$limit_to}></span> of <span class="menu-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/menu/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#menulistform', 'left', '.pagination-prev');
            	bind_hotkey('#menulistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="menu-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.menu-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.menu-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#menulistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#menulistform :focusable:first').focus();
        }

    	$('#menulistform').click(function(){
    	    var focused = $('#menulistform :focus');

    	    if (focused.length == 0) {
                $('#menulistform :focusable:first').focus();
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

