<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_ADMIN_ORDER')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminorderquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminorder/search" method="post" enctype="multipart/form-data">
            <input type="text" name="adminorder_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#adminorderquicksearch').submit(); return false;">
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
            $('#adminorderquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminorderquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminorder) }>
<{foreach from=$messages.adminorder key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminorderlist" id="adminorderlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminorder/" method="post">

<input type="hidden" name="adminorderlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminorder.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminorder.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_ADMIN_ORDER')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_ORDER')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminorder.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminorder_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminorder.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('L_IMPORT')}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.adminorder.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/adminorder/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('L_EXPORT')}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/adminorder/customfilter/{id}" class="adminorder-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="adminorder" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer adminorder-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/adminorder"><i class="fa fa-plus-circle"></i> <{_t('L_CREATE_NEW_FILTER')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons adminorder-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.adminorder-custom-filter', '.adminorder-custom-filter-footer', '.adminorder-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminorder[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminorder_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_ADMIN_ORDER)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_ADMIN_ORDER)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_ADMIN_ORDER), strtolower(L_ADMIN_ORDER)));
    <{/php}>

    <div id="adminordercopyrelations" style="display:none" title="<{_t('L_COPY')}> <{_t('L_ADMIN_ORDER')|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminOrderItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminorderitem" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_ORDER_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminorderapproverelations" style="display:none" title="<{_t('L_APPROVE')}> <{_t('L_ADMIN_ORDER')|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminOrderItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminorderitem" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_ORDER_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminorderdeleterelations" style="display:none" title="<{_t('L_DELETE')}> <{_t('L_ADMIN_ORDER')|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminOrderItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminorderitem" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_ORDER_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminorder_reset() {
	$('input, select', '#adminorder-search').val('');
}

function adminorder_search() {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/search/');
	$('#adminorderlistform').submit();
}

function adminorder_save() {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/save/?back=0');
	$('#adminorderlistform').submit();
}

function adminorder_delete() {
	var dialog = $( "#adminorderdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE')}>": function() {
            	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/delete/');
            	$('#adminorderlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminorderlistform'));
}

function adminorder_copy() {
	var dialog = $( "#adminordercopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY')}>": function() {
            	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/copy/');
            	$('#adminorderlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminorderlistform'));
}

function adminorder_approve() {
	var dialog = $( "#adminorderapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE')}>": function() {
            	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/approve/');
            	$('#adminorderlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminorderlistform'));
}

function adminorder_batchedit() {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/batchedit/');
	$('#adminorderlistform').submit();
}

function adminorder_update(col, val) {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/bulkupdate/' + col + '/' + val);
	$('#adminorderlistform').submit();
}

function adminorder_dupdate(col, val) {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/bulkdupdate/' + col + '/' + val);
	$('#adminorderlistform').submit();
}

function adminorder_customaction(controller, action) {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminorderlistform').submit();
}

function adminorder_filter(col, val) {
	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/filter/' + col + '/' + val);
	$('#adminorderlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminorder_<{$item->ACTION}>() {
        	$('#adminorderlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorder/<{$item->ACTION}>/');
        	$('#adminorderlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminorder_checkall(checked) {
	$('#adminorderlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminorderlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminorderlist .top-holder').show();

		$('#adminorderlist .top-holder .selectall').show();
		$('#adminorderlist .top-holder .clearselection').hide();
	} else {
		$('#adminorderlist .top-holder').hide();

	    document.adminorderlist.adminorderlist_selection_selectall.value = 0;
	}
}

function adminorder_selectall() {
	adminorder_checkall(true);

    document.adminorderlist.adminorderlist_selection_selectall.value = 1;

	$('#adminorderlist .top-holder .selectall').hide();
	$('#adminorderlist .top-holder .clearselection').show();
}

function adminorder_clearselection() {
	adminorder_checkall(false);

    document.adminorderlist.adminorderlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminorder.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminorder-pagination-from"><{$limit_from}>-<span class="adminorder-pagination-to"><{$limit_to}></span> of <span class="adminorder-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminorder-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminorder-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminorder-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminorderlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminorderlistform :focusable:first').focus();
        }

    	$('#adminorderlistform').click(function(){
    	    var focused = $('#adminorderlistform :focus');

    	    if (focused.length == 0) {
                $('#adminorderlistform :focusable:first').focus();
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
