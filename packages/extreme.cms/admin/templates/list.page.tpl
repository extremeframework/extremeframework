<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_PAGE')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/page/search" method="get">
            <input type="text" name="page_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagequicksearch').submit(); return false;">
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
            $('#pagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.page) }>
<{foreach from=$messages.page key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.page.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.page.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_PAGE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_PAGE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.page.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="page_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.page.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/page/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('L_IMPORT', true)}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.page.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/page/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('L_EXPORT', true)}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/page/customfilter/{id}" class="page-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="page" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer page-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/page"><i class="fa fa-plus-circle"></i> <{_t('L_CREATE_NEW_FILTER')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons page-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.page-custom-filter', '.page-custom-filter-footer', '.page-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.page[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="page_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('L_PAGE'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('L_PAGE'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('L_PAGE')), strtolower(_t('L_PAGE'))));
    <{/php}>

    <div id="pagecopyrelations" style="display:none" title="<{_t('L_COPY', true)}> <{_t('L_PAGE', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Page')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="page" /> <{_t('L_COPY_ALSO')}> <{_t('L_PAGE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagegallery" /> <{_t('L_COPY_ALSO')}> <{_t('L_PAGE_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageLink')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagelink" /> <{_t('L_COPY_ALSO')}> <{_t('L_PAGE_LINK')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagesection" /> <{_t('L_COPY_ALSO')}> <{_t('L_PAGE_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagewidget" /> <{_t('L_COPY_ALSO')}> <{_t('L_PAGE_WIDGET')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="pageapproverelations" style="display:none" title="<{_t('L_APPROVE', true)}> <{_t('L_PAGE', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Page')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="page" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_PAGE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagegallery" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_PAGE_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageLink')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagelink" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_PAGE_LINK')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagesection" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_PAGE_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagewidget" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_PAGE_WIDGET')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="pagedeleterelations" style="display:none" title="<{_t('L_DELETE', true)}> <{_t('L_PAGE', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Page')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="page" /> <{_t('L_DELETE_ALSO')}> <{_t('L_PAGE')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagegallery" /> <{_t('L_DELETE_ALSO')}> <{_t('L_PAGE_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageLink')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagelink" /> <{_t('L_DELETE_ALSO')}> <{_t('L_PAGE_LINK')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagesection" /> <{_t('L_DELETE_ALSO')}> <{_t('L_PAGE_SECTION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PageWidget')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagewidget" /> <{_t('L_DELETE_ALSO')}> <{_t('L_PAGE_WIDGET')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="pagelist" id="pagelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/page/" method="post">
<input type="hidden" name="pagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function page_reset() {
	$('input, select', '#page-search').val('');
}

function page_search() {
	$('#page-search').submit();
}

function page_save() {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/save/?back=0');
	$('#pagelistform').submit();
}

function page_delete() {
	var dialog = $( "#pagedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE', true)}>": function() {
            	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/delete/');
            	$('#pagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagelistform'));
}

function page_copy() {
	var dialog = $( "#pagecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY', true)}>": function() {
            	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/copy/');
            	$('#pagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagelistform'));
}

function page_approve() {
	var dialog = $( "#pageapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE', true)}>": function() {
            	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/approve/');
            	$('#pagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagelistform'));
}

function page_batchedit() {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/batchedit/');
	$('#pagelistform').submit();
}

function page_update(col, val) {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/bulkupdate/' + col + '/' + val);
	$('#pagelistform').submit();
}

function page_dupdate(col, val) {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/bulkdupdate/' + col + '/' + val);
	$('#pagelistform').submit();
}

function page_customaction(controller, action) {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagelistform').submit();
}

function page_filter(col, val) {
	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/filter/' + col + '/' + val);
	$('#pagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function page_<{$item->ACTION}>() {
        	$('#pagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/page/<{$item->ACTION}>/');
        	$('#pagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function page_checkall(checked) {
	$('#pagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagelist .top-holder').show();

		$('#pagelist .top-holder .selectall').show();
		$('#pagelist .top-holder .clearselection').hide();
	} else {
		$('#pagelist .top-holder').hide();

	    document.pagelist.pagelist_selection_selectall.value = 0;
	}
}

function page_selectall() {
	page_checkall(true);

    document.pagelist.pagelist_selection_selectall.value = 1;

	$('#pagelist .top-holder .selectall').hide();
	$('#pagelist .top-holder .clearselection').show();
}

function page_clearselection() {
	page_checkall(false);

    document.pagelist.pagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.page.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="page-pagination-from"><{$limit_from}>-<span class="page-pagination-to"><{$limit_to}></span> of <span class="page-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/page/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="page-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.page-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.page-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagelistform :focusable:first').focus();
        }

    	$('#pagelistform').click(function(){
    	    var focused = $('#pagelistform :focus');

    	    if (focused.length == 0) {
                $('#pagelistform :focusable:first').focus();
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
