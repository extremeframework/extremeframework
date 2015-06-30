<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_WIDGET_POSITION}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="widgetpositionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/widgetposition/search" method="post" enctype="multipart/form-data">
            <input type="text" name="widgetposition_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#widgetpositionquicksearch').submit(); return false;">
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
            $('#widgetpositionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#widgetpositionquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/widgetposition"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.widgetposition) }>
<{foreach from=$messages.widgetposition key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="widgetpositionlist" id="widgetpositionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/widgetposition/" method="post">

<input type="hidden" name="widgetpositionlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.widgetposition.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.widgetposition.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_WIDGET_POSITION|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_WIDGET_POSITION|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.widgetposition.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="widgetposition_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.widgetposition.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{$smarty.const.L_IMPORT}>" /><{$smarty.const.L_IMPORT}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.widgetposition.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{$smarty.const.L_EXPORT}>" /><{$smarty.const.L_EXPORT}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.widgetposition[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="widgetposition_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_WIDGET_POSITION)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_WIDGET_POSITION)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_WIDGET_POSITION), strtolower(L_WIDGET_POSITION)));
    <{/php}>

    <div id="widgetpositioncopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_WIDGET_POSITION|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagewidget" /> <{label key="L_COPY_ALSO"}> <{label key="L_PAGE_WIDGET" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="widgetpositionapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_WIDGET_POSITION|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagewidget" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_PAGE_WIDGET" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="widgetpositiondeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_WIDGET_POSITION|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagewidget" /> <{label key="L_DELETE_ALSO"}> <{label key="L_PAGE_WIDGET" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function widgetposition_reset() {
	$('input, select', '#widgetposition-search').val('');
}

function widgetposition_search() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/search/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_save() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/save/?back=0');
	$('#widgetpositionlistform').submit();
}

function widgetposition_delete() {
	var dialog = $( "#widgetpositiondeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/delete/');
            	$('#widgetpositionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#widgetpositionlistform'));
}

function widgetposition_copy() {
	var dialog = $( "#widgetpositioncopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/copy/');
            	$('#widgetpositionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#widgetpositionlistform'));
}

function widgetposition_approve() {
	var dialog = $( "#widgetpositionapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/approve/');
            	$('#widgetpositionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#widgetpositionlistform'));
}

function widgetposition_batchedit() {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/batchedit/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_update(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/bulkupdate/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

function widgetposition_dupdate(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/bulkdupdate/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

function widgetposition_customaction(controller, action) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#widgetpositionlistform').submit();
}

function widgetposition_filter(col, val) {
	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/filter/' + col + '/' + val);
	$('#widgetpositionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function widgetposition_<{$item->ACTION}>() {
        	$('#widgetpositionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgetposition/<{$item->ACTION}>/');
        	$('#widgetpositionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function widgetposition_checkall(checked) {
	$('#widgetpositionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('widgetpositionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#widgetpositionlist .top-holder').show();

		$('#widgetpositionlist .top-holder .selectall').show();
		$('#widgetpositionlist .top-holder .clearselection').hide();
	} else {
		$('#widgetpositionlist .top-holder').hide();

	    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 0;
	}
}

function widgetposition_selectall() {
	widgetposition_checkall(true);

    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 1;

	$('#widgetpositionlist .top-holder .selectall').hide();
	$('#widgetpositionlist .top-holder .clearselection').show();
}

function widgetposition_clearselection() {
	widgetposition_checkall(false);

    document.widgetpositionlist.widgetpositionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.widgetposition.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="widgetposition-pagination-from"><{$limit_from}>-<span class="widgetposition-pagination-to"><{$limit_to}></span> of <span class="widgetposition-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="widgetposition-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.widgetposition-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.widgetposition-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#widgetpositionlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#widgetpositionlistform :focusable:first').focus();
        }

    	$('#widgetpositionlistform').click(function(){
    	    var focused = $('#widgetpositionlistform :focus');

    	    if (focused.length == 0) {
                $('#widgetpositionlistform :focusable:first').focus();
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
