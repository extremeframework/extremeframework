<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_ADMIN_LAYOUT_SECTION}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlayoutsectionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminlayoutsection_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#adminlayoutsectionquicksearch').submit(); return false;">
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
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminlayoutsection) }>
<{foreach from=$messages.adminlayoutsection key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminlayoutsectionlist" id="adminlayoutsectionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/" method="post">

<input type="hidden" name="adminlayoutsectionlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminlayoutsection.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlayoutsection.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_ADMIN_LAYOUT_SECTION|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_ADMIN_LAYOUT_SECTION|strtolower}></span></a>
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
                            <a href="#" onclick="adminlayoutsection_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlayoutsection[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlayoutsection_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    <{php}>
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_ADMIN_LAYOUT_SECTION)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_ADMIN_LAYOUT_SECTION)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_ADMIN_LAYOUT_SECTION), strtolower(L_ADMIN_LAYOUT_SECTION)));
    <{/php}>

    <div id="adminlayoutsectioncopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_ADMIN_LAYOUT_SECTION|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlayoutfield" /> <{label key="L_COPY_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminlayoutsectionapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_ADMIN_LAYOUT_SECTION|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlayoutfield" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminlayoutsectiondeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_ADMIN_LAYOUT_SECTION|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLayoutField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlayoutfield" /> <{label key="L_DELETE_ALSO"}> <{label key="L_ADMIN_LAYOUT_FIELD" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminlayoutsection_reset() {
	$('input, select', '#adminlayoutsection-search').val('');
}

function adminlayoutsection_search() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/search/');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_save() {
	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/save/?back=0');
	$('#adminlayoutsectionlistform').submit();
}

function adminlayoutsection_delete() {
	var dialog = $( "#adminlayoutsectiondeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/delete/');
            	$('#adminlayoutsectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlayoutsectionlistform'));
}

function adminlayoutsection_copy() {
	var dialog = $( "#adminlayoutsectioncopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/copy/');
            	$('#adminlayoutsectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlayoutsectionlistform'));
}

function adminlayoutsection_approve() {
	var dialog = $( "#adminlayoutsectionapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#adminlayoutsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/approve/');
            	$('#adminlayoutsectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlayoutsectionlistform'));
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
		<span class="adminlayoutsection-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
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
