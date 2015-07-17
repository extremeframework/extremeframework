<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_ADMIN_LAYOUT_FIELD')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlayoutfieldquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/search" method="get">
            <input type="text" name="adminlayoutfield_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminlayoutfieldquicksearch').submit(); return false;">
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
            $('#adminlayoutfieldquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminlayoutfieldquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminlayoutfield.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlayoutfield.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_ADMIN_LAYOUT_FIELD', true)|strtolower}>"/><{_t('New')}> <{_t('L_ADMIN_LAYOUT_FIELD')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminlayoutfield.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminlayoutfield_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlayoutfield[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlayoutfield_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminlayoutfieldlist" id="adminlayoutfieldlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/" method="post">
<input type="hidden" name="adminlayoutfieldlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminlayoutfield_reset() {
	$('input, select', '#adminlayoutfield-search').val('');
}

function adminlayoutfield_search() {
	$('#adminlayoutfield-search').submit();
}

function adminlayoutfield_save() {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/save/?back=0');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_delete() {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/delete/');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_copy() {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/copy/');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_approve() {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/approve/');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_batchedit() {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/batchedit/');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_update(col, val) {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/bulkupdate/' + col + '/' + val);
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_dupdate(col, val) {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/bulkdupdate/' + col + '/' + val);
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_customaction(controller, action) {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminlayoutfieldlistform').submit();
}

function adminlayoutfield_filter(col, val) {
	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/filter/' + col + '/' + val);
	$('#adminlayoutfieldlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminlayoutfield_<{$item->ACTION}>() {
        	$('#adminlayoutfieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/<{$item->ACTION}>/');
        	$('#adminlayoutfieldlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminlayoutfield_checkall(checked) {
	$('#adminlayoutfieldlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminlayoutfieldlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminlayoutfieldlist .top-holder').show();

		$('#adminlayoutfieldlist .top-holder .selectall').show();
		$('#adminlayoutfieldlist .top-holder .clearselection').hide();
	} else {
		$('#adminlayoutfieldlist .top-holder').hide();

	    document.adminlayoutfieldlist.adminlayoutfieldlist_selection_selectall.value = 0;
	}
}

function adminlayoutfield_selectall() {
	adminlayoutfield_checkall(true);

    document.adminlayoutfieldlist.adminlayoutfieldlist_selection_selectall.value = 1;

	$('#adminlayoutfieldlist .top-holder .selectall').hide();
	$('#adminlayoutfieldlist .top-holder .clearselection').show();
}

function adminlayoutfield_clearselection() {
	adminlayoutfield_checkall(false);

    document.adminlayoutfieldlist.adminlayoutfieldlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminlayoutfield.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminlayoutfield-pagination-from"><{$limit_from}>-<span class="adminlayoutfield-pagination-to"><{$limit_to}></span> of <span class="adminlayoutfield-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminlayoutfield-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminlayoutfield-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminlayoutfield-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminlayoutfieldlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminlayoutfieldlistform :focusable:first').focus();
        }

    	$('#adminlayoutfieldlistform').click(function(){
    	    var focused = $('#adminlayoutfieldlistform :focus');

    	    if (focused.length == 0) {
                $('#adminlayoutfieldlistform :focusable:first').focus();
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
