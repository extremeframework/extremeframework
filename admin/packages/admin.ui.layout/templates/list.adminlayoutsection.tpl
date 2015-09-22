<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Admin Layout Section')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlayoutsectionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/search" method="get">
            <input type="text" name="adminlayoutsection_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminlayoutsectionquicksearch').submit(); return false;">
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
            $('#adminlayoutsectionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminlayoutsectionquicksearch').submit();
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
<{if isset($smarty.session.acl.adminlayoutsection.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlayoutsection.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Layout Section', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Layout Section')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminlayoutsection.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminlayoutsection_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlayoutsection[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlayoutsection_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminlayoutsectionlist" id="adminlayoutsectionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/" method="post">
<input type="hidden" name="adminlayoutsectionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminlayoutsection_reset() {
	$('input, select', '#adminlayoutsection-search').val('');
}

function adminlayoutsection_search() {
	$('#adminlayoutsection-search').submit();
}

function adminlayoutsection_save() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/save/?back=0');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_delete() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/delete/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_copy() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/copy/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_approve() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/approve/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_batchedit() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/batchedit/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_update(col, val) {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/bulkupdate/' + col + '/' + val);
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_dupdate(col, val) {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/bulkdupdate/' + col + '/' + val);
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_customaction(controller, action) {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_filter(col, val) {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/filter/' + col + '/' + val);
	$('#adminlayoutsectionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminlayoutsection_<{$item->ACTION}>() {
        	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/<{$item->ACTION}>/');
        	$('#adminlayoutsectionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminlayoutsection_checkall(checked) {
	$('#adminlayoutsectionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminlayoutsectionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminlayoutsectionlist .top-holder').show();

		$('#adminlayoutsectionlist .top-holder .selectall').show();
		$('#adminlayoutsectionlist .top-holder .clearselection').hide();
	} else {
		$('#adminlayoutsectionlist .top-holder').hide();

	    document.adminlayoutsectionlist.adminlayoutsectionlist_selection_selectall.value = 0;
	}
}

function adminlayoutsection_selectall() {
	adminlayoutsection_checkall(true);

    document.adminlayoutsectionlist.adminlayoutsectionlist_selection_selectall.value = 1;

	$('#adminlayoutsectionlist .top-holder .selectall').hide();
	$('#adminlayoutsectionlist .top-holder .clearselection').show();
}

function adminlayoutsection_clearselection() {
	adminlayoutsection_checkall(false);

    document.adminlayoutsectionlist.adminlayoutsectionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminlayoutsection.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminlayoutsection-pagination-from"><{$limit_from}>-<span class="adminlayoutsection-pagination-to"><{$limit_to}></span> of <span class="adminlayoutsection-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminlayoutsection-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminlayoutsection-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminlayoutsection-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminlayoutsectionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminlayoutsectionlistform :focusable:first').focus();
        }

    	$('#adminlayoutsectionlistform').click(function(){
    	    var focused = $('#adminlayoutsectionlistform :focus');

    	    if (focused.length == 0) {
                $('#adminlayoutsectionlistform :focusable:first').focus();
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
