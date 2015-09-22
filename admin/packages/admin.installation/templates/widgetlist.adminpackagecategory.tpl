

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpackagecategoryquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/search" method="get">
            <input type="text" name="adminpackagecategory_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpackagecategoryquicksearch').submit(); return false;">
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
            $('#adminpackagecategoryquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpackagecategoryquicksearch').submit();
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
<{if isset($smarty.session.acl.adminpackagecategory.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpackagecategory.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Package Category', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Package Category')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpackagecategory.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpackagecategory_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpackagecategory[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpackagecategory_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminpackagecategorylist" id="adminpackagecategorylistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/" method="post">
<input type="hidden" name="adminpackagecategorylist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpackagecategory_reset() {
	$('input, select', '#adminpackagecategory-search').val('');
}

function adminpackagecategory_search() {
	$('#adminpackagecategory-search').submit();
}

function adminpackagecategory_save() {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/save/?back=0');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_delete() {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/delete/');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_copy() {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/copy/');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_approve() {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/approve/');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_batchedit() {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/batchedit/');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_update(col, val) {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/bulkupdate/' + col + '/' + val);
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_dupdate(col, val) {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/bulkdupdate/' + col + '/' + val);
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_customaction(controller, action) {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpackagecategorylistform').submit();
}

function adminpackagecategory_filter(col, val) {
	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/filter/' + col + '/' + val);
	$('#adminpackagecategorylistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpackagecategory_<{$item->ACTION}>() {
        	$('#adminpackagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/<{$item->ACTION}>/');
        	$('#adminpackagecategorylistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpackagecategory_checkall(checked) {
	$('#adminpackagecategorylist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpackagecategorylist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpackagecategorylist .top-holder').show();

		$('#adminpackagecategorylist .top-holder .selectall').show();
		$('#adminpackagecategorylist .top-holder .clearselection').hide();
	} else {
		$('#adminpackagecategorylist .top-holder').hide();

	    document.adminpackagecategorylist.adminpackagecategorylist_selection_selectall.value = 0;
	}
}

function adminpackagecategory_selectall() {
	adminpackagecategory_checkall(true);

    document.adminpackagecategorylist.adminpackagecategorylist_selection_selectall.value = 1;

	$('#adminpackagecategorylist .top-holder .selectall').hide();
	$('#adminpackagecategorylist .top-holder .clearselection').show();
}

function adminpackagecategory_clearselection() {
	adminpackagecategory_checkall(false);

    document.adminpackagecategorylist.adminpackagecategorylist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpackagecategory.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpackagecategory-pagination-from"><{$limit_from}>-<span class="adminpackagecategory-pagination-to"><{$limit_to}></span> of <span class="adminpackagecategory-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackagecategory/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminpackagecategorylistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminpackagecategorylistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminpackagecategory-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpackagecategory-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpackagecategory-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpackagecategorylistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackagecategorylistform :focusable:first').focus();
        }

    	$('#adminpackagecategorylistform').click(function(){
    	    var focused = $('#adminpackagecategorylistform :focus');

    	    if (focused.length == 0) {
                $('#adminpackagecategorylistform :focusable:first').focus();
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

