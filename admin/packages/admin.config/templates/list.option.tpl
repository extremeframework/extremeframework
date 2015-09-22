<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Option')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="optionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/option/search" method="get">
            <input type="text" name="option_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#optionquicksearch').submit(); return false;">
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
            $('#optionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#optionquicksearch').submit();
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
<{if isset($smarty.session.acl.option.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.option.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/option/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Option', true)|strtolower}>"/><{_t('New')}> <{_t('Option')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.option.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="option_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.option[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="option_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="optionlist" id="optionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/option/" method="post">
<input type="hidden" name="optionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function option_reset() {
	$('input, select', '#option-search').val('');
}

function option_search() {
	$('#option-search').submit();
}

function option_save() {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/save/?back=0');
	$('#optionlistform').submit();
}

function option_delete() {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/delete/');
	$('#optionlistform').submit();
}

function option_copy() {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/copy/');
	$('#optionlistform').submit();
}

function option_approve() {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/approve/');
	$('#optionlistform').submit();
}

function option_batchedit() {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/batchedit/');
	$('#optionlistform').submit();
}

function option_update(col, val) {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/bulkupdate/' + col + '/' + val);
	$('#optionlistform').submit();
}

function option_dupdate(col, val) {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/bulkdupdate/' + col + '/' + val);
	$('#optionlistform').submit();
}

function option_customaction(controller, action) {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#optionlistform').submit();
}

function option_filter(col, val) {
	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/filter/' + col + '/' + val);
	$('#optionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function option_<{$item->ACTION}>() {
        	$('#optionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/option/<{$item->ACTION}>/');
        	$('#optionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function option_checkall(checked) {
	$('#optionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('optionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#optionlist .top-holder').show();

		$('#optionlist .top-holder .selectall').show();
		$('#optionlist .top-holder .clearselection').hide();
	} else {
		$('#optionlist .top-holder').hide();

	    document.optionlist.optionlist_selection_selectall.value = 0;
	}
}

function option_selectall() {
	option_checkall(true);

    document.optionlist.optionlist_selection_selectall.value = 1;

	$('#optionlist .top-holder .selectall').hide();
	$('#optionlist .top-holder .clearselection').show();
}

function option_clearselection() {
	option_checkall(false);

    document.optionlist.optionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.option.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/option/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="option-pagination-from"><{$limit_from}>-<span class="option-pagination-to"><{$limit_to}></span> of <span class="option-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/option/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="option-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.option-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.option-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#optionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#optionlistform :focusable:first').focus();
        }

    	$('#optionlistform').click(function(){
    	    var focused = $('#optionlistform :focus');

    	    if (focused.length == 0) {
                $('#optionlistform :focusable:first').focus();
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
