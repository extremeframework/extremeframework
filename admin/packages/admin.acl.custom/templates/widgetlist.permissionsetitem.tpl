

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="permissionsetitemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/search" method="get">
            <input type="text" name="permissionsetitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#permissionsetitemquicksearch').submit(); return false;">
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
            $('#permissionsetitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#permissionsetitemquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.permissionsetitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.permissionsetitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Permission Set Item', true)|strtolower}>"/><{_t('New')}> <{_t('Permission Set Item')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.permissionsetitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="permissionsetitem_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.permissionsetitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="permissionsetitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="permissionsetitemlist" id="permissionsetitemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/" method="post">
<input type="hidden" name="permissionsetitemlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function permissionsetitem_reset() {
	$('input, select', '#permissionsetitem-search').val('');
}

function permissionsetitem_search() {
	$('#permissionsetitem-search').submit();
}

function permissionsetitem_save() {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/save/?back=0');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_delete() {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/delete/');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_copy() {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/copy/');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_approve() {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/approve/');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_batchedit() {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/batchedit/');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_update(col, val) {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/bulkupdate/' + col + '/' + val);
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_dupdate(col, val) {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/bulkdupdate/' + col + '/' + val);
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_customaction(controller, action) {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#permissionsetitemlistform').submit();
}

function permissionsetitem_filter(col, val) {
	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/filter/' + col + '/' + val);
	$('#permissionsetitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function permissionsetitem_<{$item->ACTION}>() {
        	$('#permissionsetitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionsetitem/<{$item->ACTION}>/');
        	$('#permissionsetitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function permissionsetitem_checkall(checked) {
	$('#permissionsetitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('permissionsetitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#permissionsetitemlist .top-holder').show();

		$('#permissionsetitemlist .top-holder .selectall').show();
		$('#permissionsetitemlist .top-holder .clearselection').hide();
	} else {
		$('#permissionsetitemlist .top-holder').hide();

	    document.permissionsetitemlist.permissionsetitemlist_selection_selectall.value = 0;
	}
}

function permissionsetitem_selectall() {
	permissionsetitem_checkall(true);

    document.permissionsetitemlist.permissionsetitemlist_selection_selectall.value = 1;

	$('#permissionsetitemlist .top-holder .selectall').hide();
	$('#permissionsetitemlist .top-holder .clearselection').show();
}

function permissionsetitem_clearselection() {
	permissionsetitem_checkall(false);

    document.permissionsetitemlist.permissionsetitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.permissionsetitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="permissionsetitem-pagination-from"><{$limit_from}>-<span class="permissionsetitem-pagination-to"><{$limit_to}></span> of <span class="permissionsetitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#permissionsetitemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#permissionsetitemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="permissionsetitem-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.permissionsetitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.permissionsetitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#permissionsetitemlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#permissionsetitemlistform :focusable:first').focus();
        }

    	$('#permissionsetitemlistform').click(function(){
    	    var focused = $('#permissionsetitemlistform :focus');

    	    if (focused.length == 0) {
                $('#permissionsetitemlistform :focusable:first').focus();
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

