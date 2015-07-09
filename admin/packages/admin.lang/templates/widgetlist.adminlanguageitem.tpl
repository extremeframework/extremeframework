

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlanguageitemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminlanguageitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#adminlanguageitemquicksearch').submit(); return false;">
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
            $('#adminlanguageitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminlanguageitemquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminlanguageitem) }>
<{foreach from=$messages.adminlanguageitem key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminlanguageitemlist" id="adminlanguageitemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/" method="post">

<input type="hidden" name="adminlanguageitemlist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.adminlanguageitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlanguageitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_ADMIN_LANGUAGE_ITEM')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_LANGUAGE_ITEM')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminlanguageitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminlanguageitem_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlanguageitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlanguageitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function adminlanguageitem_reset() {
	$('input, select', '#adminlanguageitem-search').val('');
}

function adminlanguageitem_search() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/search/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_save() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/save/?back=0');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_delete() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/delete/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_copy() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/copy/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_approve() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/approve/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_batchedit() {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/batchedit/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_update(col, val) {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/bulkupdate/' + col + '/' + val);
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_dupdate(col, val) {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/bulkdupdate/' + col + '/' + val);
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_customaction(controller, action) {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminlanguageitemlistform').submit();
}

function adminlanguageitem_filter(col, val) {
	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/filter/' + col + '/' + val);
	$('#adminlanguageitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminlanguageitem_<{$item->ACTION}>() {
        	$('#adminlanguageitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/<{$item->ACTION}>/');
        	$('#adminlanguageitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminlanguageitem_checkall(checked) {
	$('#adminlanguageitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminlanguageitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminlanguageitemlist .top-holder').show();

		$('#adminlanguageitemlist .top-holder .selectall').show();
		$('#adminlanguageitemlist .top-holder .clearselection').hide();
	} else {
		$('#adminlanguageitemlist .top-holder').hide();

	    document.adminlanguageitemlist.adminlanguageitemlist_selection_selectall.value = 0;
	}
}

function adminlanguageitem_selectall() {
	adminlanguageitem_checkall(true);

    document.adminlanguageitemlist.adminlanguageitemlist_selection_selectall.value = 1;

	$('#adminlanguageitemlist .top-holder .selectall').hide();
	$('#adminlanguageitemlist .top-holder .clearselection').show();
}

function adminlanguageitem_clearselection() {
	adminlanguageitem_checkall(false);

    document.adminlanguageitemlist.adminlanguageitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminlanguageitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminlanguageitem-pagination-from"><{$limit_from}>-<span class="adminlanguageitem-pagination-to"><{$limit_to}></span> of <span class="adminlanguageitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminlanguageitemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminlanguageitemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminlanguageitem-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminlanguageitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminlanguageitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminlanguageitemlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminlanguageitemlistform :focusable:first').focus();
        }

    	$('#adminlanguageitemlistform').click(function(){
    	    var focused = $('#adminlanguageitemlistform :focus');

    	    if (focused.length == 0) {
                $('#adminlanguageitemlistform :focusable:first').focus();
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

