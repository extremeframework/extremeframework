

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="accessrightquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/accessright/search" method="post" enctype="multipart/form-data">
            <input type="text" name="accessright_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#accessrightquicksearch').submit(); return false;">
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
            $('#accessrightquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#accessrightquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/accessright"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.accessright) }>
<{foreach from=$messages.accessright key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="accessrightlist" id="accessrightlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/accessright/" method="post">

<input type="hidden" name="accessrightlist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.accessright.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.accessright.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/accessright/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_ACCESS_RIGHT')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ACCESS_RIGHT')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.accessright.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="accessright_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.accessright[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="accessright_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function accessright_reset() {
	$('input, select', '#accessright-search').val('');
}

function accessright_search() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/search/');
	$('#accessrightlistform').submit();
}

function accessright_save() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/save/?back=0');
	$('#accessrightlistform').submit();
}

function accessright_delete() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/delete/');
	$('#accessrightlistform').submit();
}

function accessright_copy() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/copy/');
	$('#accessrightlistform').submit();
}

function accessright_approve() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/approve/');
	$('#accessrightlistform').submit();
}

function accessright_batchedit() {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/batchedit/');
	$('#accessrightlistform').submit();
}

function accessright_update(col, val) {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/bulkupdate/' + col + '/' + val);
	$('#accessrightlistform').submit();
}

function accessright_dupdate(col, val) {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/bulkdupdate/' + col + '/' + val);
	$('#accessrightlistform').submit();
}

function accessright_customaction(controller, action) {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#accessrightlistform').submit();
}

function accessright_filter(col, val) {
	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/filter/' + col + '/' + val);
	$('#accessrightlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function accessright_<{$item->ACTION}>() {
        	$('#accessrightlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/accessright/<{$item->ACTION}>/');
        	$('#accessrightlistform').submit();
		}
	<{/if}>
<{/foreach}>

function accessright_checkall(checked) {
	$('#accessrightlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('accessrightlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#accessrightlist .top-holder').show();

		$('#accessrightlist .top-holder .selectall').show();
		$('#accessrightlist .top-holder .clearselection').hide();
	} else {
		$('#accessrightlist .top-holder').hide();

	    document.accessrightlist.accessrightlist_selection_selectall.value = 0;
	}
}

function accessright_selectall() {
	accessright_checkall(true);

    document.accessrightlist.accessrightlist_selection_selectall.value = 1;

	$('#accessrightlist .top-holder .selectall').hide();
	$('#accessrightlist .top-holder .clearselection').show();
}

function accessright_clearselection() {
	accessright_checkall(false);

    document.accessrightlist.accessrightlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.accessright.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/accessright/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="accessright-pagination-from"><{$limit_from}>-<span class="accessright-pagination-to"><{$limit_to}></span> of <span class="accessright-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/accessright/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#accessrightlistform', 'left', '.pagination-prev');
            	bind_hotkey('#accessrightlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="accessright-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.accessright-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.accessright-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#accessrightlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#accessrightlistform :focusable:first').focus();
        }

    	$('#accessrightlistform').click(function(){
    	    var focused = $('#accessrightlistform :focus');

    	    if (focused.length == 0) {
                $('#accessrightlistform :focusable:first').focus();
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

