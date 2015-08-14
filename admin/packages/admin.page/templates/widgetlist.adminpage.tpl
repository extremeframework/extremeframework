

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpagequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpage/search" method="get">
            <input type="text" name="adminpage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpagequicksearch').submit(); return false;">
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
            $('#adminpagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpage"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminpage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpage/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Page', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Page')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpage_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminpagelist" id="adminpagelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpage/" method="post">
<input type="hidden" name="adminpagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpage_reset() {
	$('input, select', '#adminpage-search').val('');
}

function adminpage_search() {
	$('#adminpage-search').submit();
}

function adminpage_save() {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/save/?back=0');
	$('#adminpagelistform').submit();
}

function adminpage_delete() {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/delete/');
	$('#adminpagelistform').submit();
}

function adminpage_copy() {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/copy/');
	$('#adminpagelistform').submit();
}

function adminpage_approve() {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/approve/');
	$('#adminpagelistform').submit();
}

function adminpage_batchedit() {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/batchedit/');
	$('#adminpagelistform').submit();
}

function adminpage_update(col, val) {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/bulkupdate/' + col + '/' + val);
	$('#adminpagelistform').submit();
}

function adminpage_dupdate(col, val) {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/bulkdupdate/' + col + '/' + val);
	$('#adminpagelistform').submit();
}

function adminpage_customaction(controller, action) {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpagelistform').submit();
}

function adminpage_filter(col, val) {
	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/filter/' + col + '/' + val);
	$('#adminpagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpage_<{$item->ACTION}>() {
        	$('#adminpagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpage/<{$item->ACTION}>/');
        	$('#adminpagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpage_checkall(checked) {
	$('#adminpagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpagelist .top-holder').show();

		$('#adminpagelist .top-holder .selectall').show();
		$('#adminpagelist .top-holder .clearselection').hide();
	} else {
		$('#adminpagelist .top-holder').hide();

	    document.adminpagelist.adminpagelist_selection_selectall.value = 0;
	}
}

function adminpage_selectall() {
	adminpage_checkall(true);

    document.adminpagelist.adminpagelist_selection_selectall.value = 1;

	$('#adminpagelist .top-holder .selectall').hide();
	$('#adminpagelist .top-holder .clearselection').show();
}

function adminpage_clearselection() {
	adminpage_checkall(false);

    document.adminpagelist.adminpagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpage.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpage-pagination-from"><{$limit_from}>-<span class="adminpage-pagination-to"><{$limit_to}></span> of <span class="adminpage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpage/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminpagelistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminpagelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminpage-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpagelistform :focusable:first').focus();
        }

    	$('#adminpagelistform').click(function(){
    	    var focused = $('#adminpagelistform :focus');

    	    if (focused.length == 0) {
                $('#adminpagelistform :focusable:first').focus();
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

