<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_ADMIN_LANGUAGE')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminlanguagequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlanguage/search" method="get">
            <input type="text" name="adminlanguage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminlanguagequicksearch').submit(); return false;">
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
            $('#adminlanguagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminlanguagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminlanguage) }>
<{foreach from=$messages.adminlanguage key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.adminlanguage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminlanguage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_ADMIN_LANGUAGE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_LANGUAGE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminlanguage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminlanguage_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminlanguage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminlanguage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('L_ADMIN_LANGUAGE'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('L_ADMIN_LANGUAGE'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('L_ADMIN_LANGUAGE')), strtolower(_t('L_ADMIN_LANGUAGE'))));
    <{/php}>

    <div id="adminlanguagecopyrelations" style="display:none" title="<{_t('L_COPY', true)}> <{_t('L_ADMIN_LANGUAGE', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminlanguageitem" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_LANGUAGE_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminlanguageapproverelations" style="display:none" title="<{_t('L_APPROVE', true)}> <{_t('L_ADMIN_LANGUAGE', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminlanguageitem" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_LANGUAGE_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="adminlanguagedeleterelations" style="display:none" title="<{_t('L_DELETE', true)}> <{_t('L_ADMIN_LANGUAGE', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminLanguageItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminlanguageitem" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_LANGUAGE_ITEM')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="adminlanguagelist" id="adminlanguagelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/adminlanguage/" method="post">
<input type="hidden" name="adminlanguagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminlanguage_reset() {
	$('input, select', '#adminlanguage-search').val('');
}

function adminlanguage_search() {
	$('#adminlanguage-search').submit();
}

function adminlanguage_save() {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/save/?back=0');
	$('#adminlanguagelistform').submit();
}

function adminlanguage_delete() {
	var dialog = $( "#adminlanguagedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE', true)}>": function() {
            	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/delete/');
            	$('#adminlanguagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlanguagelistform'));
}

function adminlanguage_copy() {
	var dialog = $( "#adminlanguagecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY', true)}>": function() {
            	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/copy/');
            	$('#adminlanguagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlanguagelistform'));
}

function adminlanguage_approve() {
	var dialog = $( "#adminlanguageapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE', true)}>": function() {
            	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/approve/');
            	$('#adminlanguagelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#adminlanguagelistform'));
}

function adminlanguage_batchedit() {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/batchedit/');
	$('#adminlanguagelistform').submit();
}

function adminlanguage_update(col, val) {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/bulkupdate/' + col + '/' + val);
	$('#adminlanguagelistform').submit();
}

function adminlanguage_dupdate(col, val) {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/bulkdupdate/' + col + '/' + val);
	$('#adminlanguagelistform').submit();
}

function adminlanguage_customaction(controller, action) {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminlanguagelistform').submit();
}

function adminlanguage_filter(col, val) {
	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/filter/' + col + '/' + val);
	$('#adminlanguagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminlanguage_<{$item->ACTION}>() {
        	$('#adminlanguagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminlanguage/<{$item->ACTION}>/');
        	$('#adminlanguagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminlanguage_checkall(checked) {
	$('#adminlanguagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminlanguagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminlanguagelist .top-holder').show();

		$('#adminlanguagelist .top-holder .selectall').show();
		$('#adminlanguagelist .top-holder .clearselection').hide();
	} else {
		$('#adminlanguagelist .top-holder').hide();

	    document.adminlanguagelist.adminlanguagelist_selection_selectall.value = 0;
	}
}

function adminlanguage_selectall() {
	adminlanguage_checkall(true);

    document.adminlanguagelist.adminlanguagelist_selection_selectall.value = 1;

	$('#adminlanguagelist .top-holder .selectall').hide();
	$('#adminlanguagelist .top-holder .clearselection').show();
}

function adminlanguage_clearselection() {
	adminlanguage_checkall(false);

    document.adminlanguagelist.adminlanguagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminlanguage.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminlanguage-pagination-from"><{$limit_from}>-<span class="adminlanguage-pagination-to"><{$limit_to}></span> of <span class="adminlanguage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="adminlanguage-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminlanguage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminlanguage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminlanguagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminlanguagelistform :focusable:first').focus();
        }

    	$('#adminlanguagelistform').click(function(){
    	    var focused = $('#adminlanguagelistform :focus');

    	    if (focused.length == 0) {
                $('#adminlanguagelistform :focusable:first').focus();
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
