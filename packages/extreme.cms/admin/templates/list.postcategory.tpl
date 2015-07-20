<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Post Category')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="postcategoryquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/postcategory/search" method="get">
            <input type="text" name="postcategory_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#postcategoryquicksearch').submit(); return false;">
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
            $('#postcategoryquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#postcategoryquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.postcategory.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.postcategory.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Post Category', true)|strtolower}>"/><{_t('New')}> <{_t('Post Category')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.postcategory.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="postcategory_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postcategory.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postcategory.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/postcategory/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.postcategory[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="postcategory_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('Post Category'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('Post Category'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('Post Category')), strtolower(_t('Post Category'))));
    <{/php}>

    <div id="postcategorycopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Post Category', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PostCategory')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="postcategory" /> <{_t('Copy also')}> <{_t('Post Category')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Post')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="post" /> <{_t('Copy also')}> <{_t('Post')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="postcategoryapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Post Category', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PostCategory')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="postcategory" /> <{_t('Approve also')}> <{_t('Post Category')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Post')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="post" /> <{_t('Approve also')}> <{_t('Post')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="postcategorydeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Post Category', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('PostCategory')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="postcategory" /> <{_t('Delete also')}> <{_t('Post Category')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('Post')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="post" /> <{_t('Delete also')}> <{_t('Post')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="postcategorylist" id="postcategorylistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/postcategory/" method="post">
<input type="hidden" name="postcategorylist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function postcategory_reset() {
	$('input, select', '#postcategory-search').val('');
}

function postcategory_search() {
	$('#postcategory-search').submit();
}

function postcategory_save() {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/save/?back=0');
	$('#postcategorylistform').submit();
}

function postcategory_delete() {
	var dialog = $( "#postcategorydeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/delete/');
            	$('#postcategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postcategorylistform'));
}

function postcategory_copy() {
	var dialog = $( "#postcategorycopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/copy/');
            	$('#postcategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postcategorylistform'));
}

function postcategory_approve() {
	var dialog = $( "#postcategoryapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/approve/');
            	$('#postcategorylistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postcategorylistform'));
}

function postcategory_batchedit() {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/batchedit/');
	$('#postcategorylistform').submit();
}

function postcategory_update(col, val) {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/bulkupdate/' + col + '/' + val);
	$('#postcategorylistform').submit();
}

function postcategory_dupdate(col, val) {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/bulkdupdate/' + col + '/' + val);
	$('#postcategorylistform').submit();
}

function postcategory_customaction(controller, action) {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#postcategorylistform').submit();
}

function postcategory_filter(col, val) {
	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/filter/' + col + '/' + val);
	$('#postcategorylistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function postcategory_<{$item->ACTION}>() {
        	$('#postcategorylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postcategory/<{$item->ACTION}>/');
        	$('#postcategorylistform').submit();
		}
	<{/if}>
<{/foreach}>

function postcategory_checkall(checked) {
	$('#postcategorylist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('postcategorylist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#postcategorylist .top-holder').show();

		$('#postcategorylist .top-holder .selectall').show();
		$('#postcategorylist .top-holder .clearselection').hide();
	} else {
		$('#postcategorylist .top-holder').hide();

	    document.postcategorylist.postcategorylist_selection_selectall.value = 0;
	}
}

function postcategory_selectall() {
	postcategory_checkall(true);

    document.postcategorylist.postcategorylist_selection_selectall.value = 1;

	$('#postcategorylist .top-holder .selectall').hide();
	$('#postcategorylist .top-holder .clearselection').show();
}

function postcategory_clearselection() {
	postcategory_checkall(false);

    document.postcategorylist.postcategorylist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.postcategory.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postcategory/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="postcategory-pagination-from"><{$limit_from}>-<span class="postcategory-pagination-to"><{$limit_to}></span> of <span class="postcategory-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/postcategory/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="postcategory-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.postcategory-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.postcategory-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#postcategorylistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postcategorylistform :focusable:first').focus();
        }

    	$('#postcategorylistform').click(function(){
    	    var focused = $('#postcategorylistform :focus');

    	    if (focused.length == 0) {
                $('#postcategorylistform :focusable:first').focus();
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
