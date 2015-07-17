

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlabelquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlabel/search" method="get">
            <input type="text" name="adminlabel_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminlabelquicksearch').submit(); return false;">
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
            $('#adminlabelquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminlabelquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminlabel.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlabel.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_ADMIN_LABEL', true)|strtolower}>"/><{_t('New')}> <{_t('L_ADMIN_LABEL')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminlabel.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminlabel_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlabel[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlabel_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminlabellist" id="adminlabellistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlabel/" method="post">
<input type="hidden" name="adminlabellist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminlabel_reset() {
	$('input, select', '#adminlabel-search').val('');
}

function adminlabel_search() {
	$('#adminlabel-search').submit();
}

function adminlabel_save() {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/save/?back=0');
	$('#adminlabellistform').submit();
}

function adminlabel_delete() {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/delete/');
	$('#adminlabellistform').submit();
}

function adminlabel_copy() {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/copy/');
	$('#adminlabellistform').submit();
}

function adminlabel_approve() {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/approve/');
	$('#adminlabellistform').submit();
}

function adminlabel_batchedit() {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/batchedit/');
	$('#adminlabellistform').submit();
}

function adminlabel_update(col, val) {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/bulkupdate/' + col + '/' + val);
	$('#adminlabellistform').submit();
}

function adminlabel_dupdate(col, val) {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/bulkdupdate/' + col + '/' + val);
	$('#adminlabellistform').submit();
}

function adminlabel_customaction(controller, action) {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminlabellistform').submit();
}

function adminlabel_filter(col, val) {
	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/filter/' + col + '/' + val);
	$('#adminlabellistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminlabel_<{$item->ACTION}>() {
        	$('#adminlabellistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlabel/<{$item->ACTION}>/');
        	$('#adminlabellistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminlabel_checkall(checked) {
	$('#adminlabellist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminlabellist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminlabellist .top-holder').show();

		$('#adminlabellist .top-holder .selectall').show();
		$('#adminlabellist .top-holder .clearselection').hide();
	} else {
		$('#adminlabellist .top-holder').hide();

	    document.adminlabellist.adminlabellist_selection_selectall.value = 0;
	}
}

function adminlabel_selectall() {
	adminlabel_checkall(true);

    document.adminlabellist.adminlabellist_selection_selectall.value = 1;

	$('#adminlabellist .top-holder .selectall').hide();
	$('#adminlabellist .top-holder .clearselection').show();
}

function adminlabel_clearselection() {
	adminlabel_checkall(false);

    document.adminlabellist.adminlabellist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminlabel.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminlabel-pagination-from"><{$limit_from}>-<span class="adminlabel-pagination-to"><{$limit_to}></span> of <span class="adminlabel-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminlabellistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminlabellistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminlabel-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminlabel-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminlabel-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminlabellistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminlabellistform :focusable:first').focus();
        }

    	$('#adminlabellistform').click(function(){
    	    var focused = $('#adminlabellistform :focus');

    	    if (focused.length == 0) {
                $('#adminlabellistform :focusable:first').focus();
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

