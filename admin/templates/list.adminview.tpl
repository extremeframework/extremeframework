<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_ADMIN_VIEW}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminviewquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminview/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminview_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#adminviewquicksearch').submit(); return false;">
	            <span><{label key="L_SEARCH"}></span>
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
            $('#adminviewquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminviewquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminview) }>
<{foreach from=$messages.adminview key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminviewlist" id="adminviewlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminview/" method="post">

<input type="hidden" name="adminviewlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminview.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminview.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminview/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_ADMIN_VIEW|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_ADMIN_VIEW|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminview.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminview_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminview[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminview_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
function adminview_reset() {
	$('input, select', '#adminview-search').val('');
}

function adminview_search() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/search/');
	$('#adminviewlistform').submit();
}

function adminview_save() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/save/?back=0');
	$('#adminviewlistform').submit();
}

function adminview_delete() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/delete/');
	$('#adminviewlistform').submit();
}

function adminview_copy() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/copy/');
	$('#adminviewlistform').submit();
}

function adminview_approve() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/approve/');
	$('#adminviewlistform').submit();
}

function adminview_batchedit() {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/batchedit/');
	$('#adminviewlistform').submit();
}

function adminview_update(col, val) {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/bulkupdate/' + col + '/' + val);
	$('#adminviewlistform').submit();
}

function adminview_dupdate(col, val) {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/bulkdupdate/' + col + '/' + val);
	$('#adminviewlistform').submit();
}

function adminview_customaction(controller, action) {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminviewlistform').submit();
}

function adminview_filter(col, val) {
	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/filter/' + col + '/' + val);
	$('#adminviewlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminview_<{$item->ACTION}>() {
        	$('#adminviewlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminview/<{$item->ACTION}>/');
        	$('#adminviewlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminview_checkall(checked) {
	$('#adminviewlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminviewlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminviewlist .top-holder').show();

		$('#adminviewlist .top-holder .selectall').show();
		$('#adminviewlist .top-holder .clearselection').hide();
	} else {
		$('#adminviewlist .top-holder').hide();

	    document.adminviewlist.adminviewlist_selection_selectall.value = 0;
	}
}

function adminview_selectall() {
	adminview_checkall(true);

    document.adminviewlist.adminviewlist_selection_selectall.value = 1;

	$('#adminviewlist .top-holder .selectall').hide();
	$('#adminviewlist .top-holder .clearselection').show();
}

function adminview_clearselection() {
	adminview_checkall(false);

    document.adminviewlist.adminviewlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminview.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminview-pagination-from"><{$limit_from}>-<span class="adminview-pagination-to"><{$limit_to}></span> of <span class="adminview-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminview/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminview-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminview-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminview-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminviewlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminviewlistform :focusable:first').focus();
        }

    	$('#adminviewlistform').click(function(){
    	    var focused = $('#adminviewlistform :focus');

    	    if (focused.length == 0) {
                $('#adminviewlistform :focusable:first').focus();
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
