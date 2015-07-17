<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_USER_MEMBERSHIP')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="usermembershipquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/usermembership/search" method="get">
            <input type="text" name="usermembership_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#usermembershipquicksearch').submit(); return false;">
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
            $('#usermembershipquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#usermembershipquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.usermembership.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.usermembership.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usermembership/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_USER_MEMBERSHIP', true)|strtolower}>"/><{_t('New')}> <{_t('L_USER_MEMBERSHIP')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.usermembership.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="usermembership_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.usermembership[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="usermembership_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="usermembershiplist" id="usermembershiplistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/usermembership/" method="post">
<input type="hidden" name="usermembershiplist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function usermembership_reset() {
	$('input, select', '#usermembership-search').val('');
}

function usermembership_search() {
	$('#usermembership-search').submit();
}

function usermembership_save() {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/save/?back=0');
	$('#usermembershiplistform').submit();
}

function usermembership_delete() {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/delete/');
	$('#usermembershiplistform').submit();
}

function usermembership_copy() {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/copy/');
	$('#usermembershiplistform').submit();
}

function usermembership_approve() {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/approve/');
	$('#usermembershiplistform').submit();
}

function usermembership_batchedit() {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/batchedit/');
	$('#usermembershiplistform').submit();
}

function usermembership_update(col, val) {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/bulkupdate/' + col + '/' + val);
	$('#usermembershiplistform').submit();
}

function usermembership_dupdate(col, val) {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/bulkdupdate/' + col + '/' + val);
	$('#usermembershiplistform').submit();
}

function usermembership_customaction(controller, action) {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#usermembershiplistform').submit();
}

function usermembership_filter(col, val) {
	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/filter/' + col + '/' + val);
	$('#usermembershiplistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function usermembership_<{$item->ACTION}>() {
        	$('#usermembershiplistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/usermembership/<{$item->ACTION}>/');
        	$('#usermembershiplistform').submit();
		}
	<{/if}>
<{/foreach}>

function usermembership_checkall(checked) {
	$('#usermembershiplist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('usermembershiplist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#usermembershiplist .top-holder').show();

		$('#usermembershiplist .top-holder .selectall').show();
		$('#usermembershiplist .top-holder .clearselection').hide();
	} else {
		$('#usermembershiplist .top-holder').hide();

	    document.usermembershiplist.usermembershiplist_selection_selectall.value = 0;
	}
}

function usermembership_selectall() {
	usermembership_checkall(true);

    document.usermembershiplist.usermembershiplist_selection_selectall.value = 1;

	$('#usermembershiplist .top-holder .selectall').hide();
	$('#usermembershiplist .top-holder .clearselection').show();
}

function usermembership_clearselection() {
	usermembership_checkall(false);

    document.usermembershiplist.usermembershiplist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.usermembership.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="usermembership-pagination-from"><{$limit_from}>-<span class="usermembership-pagination-to"><{$limit_to}></span> of <span class="usermembership-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/usermembership/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

    <{else}>
	<br>
	<div style="float:left">
		<span class="usermembership-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.usermembership-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.usermembership-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#usermembershiplistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#usermembershiplistform :focusable:first').focus();
        }

    	$('#usermembershiplistform').click(function(){
    	    var focused = $('#usermembershiplistform :focus');

    	    if (focused.length == 0) {
                $('#usermembershiplistform :focusable:first').focus();
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

<{include file="footer.tpl"}>
