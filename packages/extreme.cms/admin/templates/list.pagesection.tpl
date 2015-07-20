<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Page Section')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagesectionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/pagesection/search" method="get">
            <input type="text" name="pagesection_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagesectionquicksearch').submit(); return false;">
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
            $('#pagesectionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagesectionquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.pagesection.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.pagesection.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Page Section', true)|strtolower}>"/><{_t('New')}> <{_t('Page Section')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.pagesection.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="pagesection_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.pagesection.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagesection/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.pagesection.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/pagesection/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.pagesection[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="pagesection_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('Page Section'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('Page Section'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('Page Section')), strtolower(_t('Page Section'))));
    <{/php}>

    <div id="pagesectioncopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Page Section', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="pagesection" /> <{_t('Copy also')}> <{_t('Page Section')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="pagesectionapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Page Section', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="pagesection" /> <{_t('Approve also')}> <{_t('Page Section')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="pagesectiondeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Page Section', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PageSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="pagesection" /> <{_t('Delete also')}> <{_t('Page Section')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="pagesectionlist" id="pagesectionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/pagesection/" method="post">
<input type="hidden" name="pagesectionlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function pagesection_reset() {
	$('input, select', '#pagesection-search').val('');
}

function pagesection_search() {
	$('#pagesection-search').submit();
}

function pagesection_save() {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/save/?back=0');
	$('#pagesectionlistform').submit();
}

function pagesection_delete() {
	var dialog = $( "#pagesectiondeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/delete/');
            	$('#pagesectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagesectionlistform'));
}

function pagesection_copy() {
	var dialog = $( "#pagesectioncopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/copy/');
            	$('#pagesectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagesectionlistform'));
}

function pagesection_approve() {
	var dialog = $( "#pagesectionapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/approve/');
            	$('#pagesectionlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#pagesectionlistform'));
}

function pagesection_batchedit() {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/batchedit/');
	$('#pagesectionlistform').submit();
}

function pagesection_update(col, val) {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/bulkupdate/' + col + '/' + val);
	$('#pagesectionlistform').submit();
}

function pagesection_dupdate(col, val) {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/bulkdupdate/' + col + '/' + val);
	$('#pagesectionlistform').submit();
}

function pagesection_customaction(controller, action) {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagesectionlistform').submit();
}

function pagesection_filter(col, val) {
	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/filter/' + col + '/' + val);
	$('#pagesectionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function pagesection_<{$item->ACTION}>() {
        	$('#pagesectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagesection/<{$item->ACTION}>/');
        	$('#pagesectionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function pagesection_checkall(checked) {
	$('#pagesectionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagesectionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagesectionlist .top-holder').show();

		$('#pagesectionlist .top-holder .selectall').show();
		$('#pagesectionlist .top-holder .clearselection').hide();
	} else {
		$('#pagesectionlist .top-holder').hide();

	    document.pagesectionlist.pagesectionlist_selection_selectall.value = 0;
	}
}

function pagesection_selectall() {
	pagesection_checkall(true);

    document.pagesectionlist.pagesectionlist_selection_selectall.value = 1;

	$('#pagesectionlist .top-holder .selectall').hide();
	$('#pagesectionlist .top-holder .clearselection').show();
}

function pagesection_clearselection() {
	pagesection_checkall(false);

    document.pagesectionlist.pagesectionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.pagesection.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagesection/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="pagesection-pagination-from"><{$limit_from}>-<span class="pagesection-pagination-to"><{$limit_to}></span> of <span class="pagesection-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagesection/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="pagesection-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.pagesection-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.pagesection-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagesectionlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagesectionlistform :focusable:first').focus();
        }

    	$('#pagesectionlistform').click(function(){
    	    var focused = $('#pagesectionlistform :focus');

    	    if (focused.length == 0) {
                $('#pagesectionlistform :focusable:first').focus();
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
