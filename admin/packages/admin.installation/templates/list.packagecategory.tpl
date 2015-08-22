<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Package Category')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="packagecategoryquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/packagecategory/search" method="get">
            <input type="text" name="packagecategory_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#packagecategoryquicksearch').submit(); return false;">
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
            $('#packagecategoryquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#packagecategoryquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/packagecategory"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.packagecategory.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.packagecategory.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/packagecategory/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Package Category', true)|strtolower}>"/><{_t('New')}> <{_t('Package Category')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.packagecategory.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="packagecategory_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.packagecategory.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/packagecategory/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.packagecategory.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/packagecategory/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.packagecategory[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="packagecategory_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Package Category', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Package Category', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Package Category', true)), strtolower(_t('Package Category', true))));
    <{/php}>

    <div id="packagecategorycopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Package Category', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminpackage" /> <{_t('Copy also')}> <{_t('Admin Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="packagecategoryapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Package Category', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminpackage" /> <{_t('Approve also')}> <{_t('Admin Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="packagecategorydeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Package Category', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminpackage" /> <{_t('Delete also')}> <{_t('Admin Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="packagecategorylist" id="packagecategorylistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/packagecategory/" method="post">
<input type="hidden" name="packagecategorylist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function packagecategory_reset() {
	$('input, select', '#packagecategory-search').val('');
}

function packagecategory_search() {
	$('#packagecategory-search').submit();
}

function packagecategory_save() {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/save/?back=0');
	$('#packagecategorylistform').submit();
}

function packagecategory_delete() {
	var dialog = $( "#packagecategorydeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/delete/');
            	$('#packagecategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#packagecategorylistform'));
}

function packagecategory_copy() {
	var dialog = $( "#packagecategorycopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/copy/');
            	$('#packagecategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#packagecategorylistform'));
}

function packagecategory_approve() {
	var dialog = $( "#packagecategoryapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/approve/');
            	$('#packagecategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#packagecategorylistform'));
}

function packagecategory_batchedit() {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/batchedit/');
	$('#packagecategorylistform').submit();
}

function packagecategory_update(col, val) {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/bulkupdate/' + col + '/' + val);
	$('#packagecategorylistform').submit();
}

function packagecategory_dupdate(col, val) {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/bulkdupdate/' + col + '/' + val);
	$('#packagecategorylistform').submit();
}

function packagecategory_customaction(controller, action) {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#packagecategorylistform').submit();
}

function packagecategory_filter(col, val) {
	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/filter/' + col + '/' + val);
	$('#packagecategorylistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function packagecategory_<{$item->ACTION}>() {
        	$('#packagecategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/packagecategory/<{$item->ACTION}>/');
        	$('#packagecategorylistform').submit();
		}
	<{/if}>
<{/foreach}>

function packagecategory_checkall(checked) {
	$('#packagecategorylist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('packagecategorylist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#packagecategorylist .top-holder').show();

		$('#packagecategorylist .top-holder .selectall').show();
		$('#packagecategorylist .top-holder .clearselection').hide();
	} else {
		$('#packagecategorylist .top-holder').hide();

	    document.packagecategorylist.packagecategorylist_selection_selectall.value = 0;
	}
}

function packagecategory_selectall() {
	packagecategory_checkall(true);

    document.packagecategorylist.packagecategorylist_selection_selectall.value = 1;

	$('#packagecategorylist .top-holder .selectall').hide();
	$('#packagecategorylist .top-holder .clearselection').show();
}

function packagecategory_clearselection() {
	packagecategory_checkall(false);

    document.packagecategorylist.packagecategorylist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.packagecategory.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/packagecategory/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="packagecategory-pagination-from"><{$limit_from}>-<span class="packagecategory-pagination-to"><{$limit_to}></span> of <span class="packagecategory-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/packagecategory/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="packagecategory-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.packagecategory-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.packagecategory-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#packagecategorylistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#packagecategorylistform :focusable:first').focus();
        }

    	$('#packagecategorylistform').click(function(){
    	    var focused = $('#packagecategorylistform :focus');

    	    if (focused.length == 0) {
                $('#packagecategorylistform :focusable:first').focus();
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
