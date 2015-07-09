

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="usergroupquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/usergroup/search" method="post" enctype="multipart/form-data">
            <input type="text" name="usergroup_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#usergroupquicksearch').submit(); return false;">
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
            $('#usergroupquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#usergroupquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.usergroup) }>
<{foreach from=$messages.usergroup key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="usergrouplist" id="usergrouplistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/usergroup/" method="post">

<input type="hidden" name="usergrouplist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.usergroup.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.usergroup.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_USER_GROUP')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_USER_GROUP')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.usergroup.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="usergroup_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.usergroup[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="usergroup_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function usergroup_reset() {
	$('input, select', '#usergroup-search').val('');
}

function usergroup_search() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/search/');
	$('#usergrouplistform').submit();
}

function usergroup_save() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/save/?back=0');
	$('#usergrouplistform').submit();
}

function usergroup_delete() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/delete/');
	$('#usergrouplistform').submit();
}

function usergroup_copy() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/copy/');
	$('#usergrouplistform').submit();
}

function usergroup_approve() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/approve/');
	$('#usergrouplistform').submit();
}

function usergroup_batchedit() {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/batchedit/');
	$('#usergrouplistform').submit();
}

function usergroup_update(col, val) {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/bulkupdate/' + col + '/' + val);
	$('#usergrouplistform').submit();
}

function usergroup_dupdate(col, val) {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/bulkdupdate/' + col + '/' + val);
	$('#usergrouplistform').submit();
}

function usergroup_customaction(controller, action) {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#usergrouplistform').submit();
}

function usergroup_filter(col, val) {
	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/filter/' + col + '/' + val);
	$('#usergrouplistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function usergroup_<{$item->ACTION}>() {
        	$('#usergrouplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usergroup/<{$item->ACTION}>/');
        	$('#usergrouplistform').submit();
		}
	<{/if}>
<{/foreach}>

function usergroup_checkall(checked) {
	$('#usergrouplist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('usergrouplist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#usergrouplist .top-holder').show();

		$('#usergrouplist .top-holder .selectall').show();
		$('#usergrouplist .top-holder .clearselection').hide();
	} else {
		$('#usergrouplist .top-holder').hide();

	    document.usergrouplist.usergrouplist_selection_selectall.value = 0;
	}
}

function usergroup_selectall() {
	usergroup_checkall(true);

    document.usergrouplist.usergrouplist_selection_selectall.value = 1;

	$('#usergrouplist .top-holder .selectall').hide();
	$('#usergrouplist .top-holder .clearselection').show();
}

function usergroup_clearselection() {
	usergroup_checkall(false);

    document.usergrouplist.usergrouplist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.usergroup.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usergroup/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="usergroup-pagination-from"><{$limit_from}>-<span class="usergroup-pagination-to"><{$limit_to}></span> of <span class="usergroup-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/usergroup/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#usergrouplistform', 'left', '.pagination-prev');
            	bind_hotkey('#usergrouplistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="usergroup-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.usergroup-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.usergroup-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#usergrouplistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#usergrouplistform :focusable:first').focus();
        }

    	$('#usergrouplistform').click(function(){
    	    var focused = $('#usergrouplistform :focus');

    	    if (focused.length == 0) {
                $('#usergrouplistform :focusable:first').focus();
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

