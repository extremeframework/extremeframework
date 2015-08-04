<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Admin Package')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminpackagequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackage/search" method="get">
            <input type="text" name="adminpackage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminpackagequicksearch').submit(); return false;">
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
            $('#adminpackagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminpackagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminpackage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminpackage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Package', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Package')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminpackage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminpackage_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select multilingual="0" data-url="<{$smarty.const.APPLICATION_URL}>/adminpackage/customfilter/{id}" class="adminpackage-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="adminpackage" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer adminpackage-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/adminpackage"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons adminpackage-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.adminpackage-custom-filter', '.adminpackage-custom-filter-footer', '.adminpackage-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminpackage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminpackage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS', true), strtolower(_t('Admin Package', true))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS', true), strtolower(_t('Admin Package', true))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS', true), strtolower(_t('Admin Package', true)), strtolower(_t('Admin Package', true))));
    <{/php}>

    <div id="adminpackagecopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Admin Package', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminmodule" /> <{_t('Copy also')}> <{_t('Admin Module')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminpackagemenu" /> <{_t('Copy also')}> <{_t('Admin Package Menu')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminpackagepermission" /> <{_t('Copy also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageShortcut')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminpackageshortcut" /> <{_t('Copy also')}> <{_t('Admin Package Shortcut')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userpackage" /> <{_t('Copy also')}> <{_t('User Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminpackageapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Admin Package', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminmodule" /> <{_t('Approve also')}> <{_t('Admin Module')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminpackagemenu" /> <{_t('Approve also')}> <{_t('Admin Package Menu')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminpackagepermission" /> <{_t('Approve also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageShortcut')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminpackageshortcut" /> <{_t('Approve also')}> <{_t('Admin Package Shortcut')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userpackage" /> <{_t('Approve also')}> <{_t('User Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminpackagedeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Admin Package', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminModule')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminmodule" /> <{_t('Delete also')}> <{_t('Admin Module')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageMenu')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminpackagemenu" /> <{_t('Delete also')}> <{_t('Admin Package Menu')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackagePermission')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminpackagepermission" /> <{_t('Delete also')}> <{_t('Admin Package Permission')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('AdminPackageShortcut')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminpackageshortcut" /> <{_t('Delete also')}> <{_t('Admin Package Shortcut')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPackage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userpackage" /> <{_t('Delete also')}> <{_t('User Package')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="adminpackagelist" id="adminpackagelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminpackage/" method="post">
<input type="hidden" name="adminpackagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminpackage_reset() {
	$('input, select', '#adminpackage-search').val('');
}

function adminpackage_search() {
	$('#adminpackage-search').submit();
}

function adminpackage_save() {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/save/?back=0');
	$('#adminpackagelistform').submit();
}

function adminpackage_delete() {
	var dialog = $( "#adminpackagedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/delete/');
            	$('#adminpackagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminpackagelistform'));
}

function adminpackage_copy() {
	var dialog = $( "#adminpackagecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/copy/');
            	$('#adminpackagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminpackagelistform'));
}

function adminpackage_approve() {
	var dialog = $( "#adminpackageapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/approve/');
            	$('#adminpackagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminpackagelistform'));
}

function adminpackage_batchedit() {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/batchedit/');
	$('#adminpackagelistform').submit();
}

function adminpackage_update(col, val) {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/bulkupdate/' + col + '/' + val);
	$('#adminpackagelistform').submit();
}

function adminpackage_dupdate(col, val) {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/bulkdupdate/' + col + '/' + val);
	$('#adminpackagelistform').submit();
}

function adminpackage_customaction(controller, action) {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminpackagelistform').submit();
}

function adminpackage_filter(col, val) {
	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/filter/' + col + '/' + val);
	$('#adminpackagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminpackage_<{$item->ACTION}>() {
        	$('#adminpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminpackage/<{$item->ACTION}>/');
        	$('#adminpackagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminpackage_checkall(checked) {
	$('#adminpackagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminpackagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminpackagelist .top-holder').show();

		$('#adminpackagelist .top-holder .selectall').show();
		$('#adminpackagelist .top-holder .clearselection').hide();
	} else {
		$('#adminpackagelist .top-holder').hide();

	    document.adminpackagelist.adminpackagelist_selection_selectall.value = 0;
	}
}

function adminpackage_selectall() {
	adminpackage_checkall(true);

    document.adminpackagelist.adminpackagelist_selection_selectall.value = 1;

	$('#adminpackagelist .top-holder .selectall').hide();
	$('#adminpackagelist .top-holder .clearselection').show();
}

function adminpackage_clearselection() {
	adminpackage_checkall(false);

    document.adminpackagelist.adminpackagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminpackage.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminpackage-pagination-from"><{$limit_from}>-<span class="adminpackage-pagination-to"><{$limit_to}></span> of <span class="adminpackage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminpackage-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminpackage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminpackage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminpackagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminpackagelistform :focusable:first').focus();
        }

    	$('#adminpackagelistform').click(function(){
    	    var focused = $('#adminpackagelistform :focus');

    	    if (focused.length == 0) {
                $('#adminpackagelistform :focusable:first').focus();
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
