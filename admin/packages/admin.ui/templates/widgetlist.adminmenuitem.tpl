

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminmenuitemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminmenuitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminmenuitemquicksearch').submit(); return false;">
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
            $('#adminmenuitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminmenuitemquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminmenuitem) }>
<{foreach from=$messages.adminmenuitem key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminmenuitemlist" id="adminmenuitemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/" method="post">

<input type="hidden" name="adminmenuitemlist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.adminmenuitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminmenuitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_ADMIN_MENU_ITEM', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_MENU_ITEM')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminmenuitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminmenuitem_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminmenuitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminmenuitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function adminmenuitem_reset() {
	$('input, select', '#adminmenuitem-search').val('');
}

function adminmenuitem_search() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/search/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_save() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=0');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_delete() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/delete/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_copy() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/copy/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_approve() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/approve/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_batchedit() {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/batchedit/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_update(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/bulkupdate/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_dupdate(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/bulkdupdate/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_customaction(controller, action) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminmenuitemlistform').submit();
}

function adminmenuitem_filter(col, val) {
	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/filter/' + col + '/' + val);
	$('#adminmenuitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminmenuitem_<{$item->ACTION}>() {
        	$('#adminmenuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminmenuitem/<{$item->ACTION}>/');
        	$('#adminmenuitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminmenuitem_checkall(checked) {
	$('#adminmenuitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminmenuitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminmenuitemlist .top-holder').show();

		$('#adminmenuitemlist .top-holder .selectall').show();
		$('#adminmenuitemlist .top-holder .clearselection').hide();
	} else {
		$('#adminmenuitemlist .top-holder').hide();

	    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 0;
	}
}

function adminmenuitem_selectall() {
	adminmenuitem_checkall(true);

    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 1;

	$('#adminmenuitemlist .top-holder .selectall').hide();
	$('#adminmenuitemlist .top-holder .clearselection').show();
}

function adminmenuitem_clearselection() {
	adminmenuitem_checkall(false);

    document.adminmenuitemlist.adminmenuitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminmenuitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminmenuitem-pagination-from"><{$limit_from}>-<span class="adminmenuitem-pagination-to"><{$limit_to}></span> of <span class="adminmenuitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminmenuitemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminmenuitemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminmenuitem-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminmenuitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminmenuitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminmenuitemlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminmenuitemlistform :focusable:first').focus();
        }

    	$('#adminmenuitemlistform').click(function(){
    	    var focused = $('#adminmenuitemlistform :focus');

    	    if (focused.length == 0) {
                $('#adminmenuitemlistform :focusable:first').focus();
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

