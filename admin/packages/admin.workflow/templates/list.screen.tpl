<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Screen')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="screenquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/screen/search" method="get">
            <input type="text" name="screen_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#screenquicksearch').submit(); return false;">
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
            $('#screenquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#screenquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.screen.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.screen.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Screen', true)|strtolower}>"/><{_t('New')}> <{_t('Screen')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.screen.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="screen_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.screen[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="screen_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('Screen'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('Screen'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('Screen')), strtolower(_t('Screen'))));
    <{/php}>

    <div id="screencopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Screen', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="screenfield" /> <{_t('Copy also')}> <{_t('Screen Field')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowtransition" /> <{_t('Copy also')}> <{_t('Workflow Transition')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="screenapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Screen', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="screenfield" /> <{_t('Approve also')}> <{_t('Screen Field')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowtransition" /> <{_t('Approve also')}> <{_t('Workflow Transition')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="screendeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Screen', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('ScreenField')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="screenfield" /> <{_t('Delete also')}> <{_t('Screen Field')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowtransition" /> <{_t('Delete also')}> <{_t('Workflow Transition')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="screenlist" id="screenlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/screen/" method="post">
<input type="hidden" name="screenlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function screen_reset() {
	$('input, select', '#screen-search').val('');
}

function screen_search() {
	$('#screen-search').submit();
}

function screen_save() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/save/?back=0');
	$('#screenlistform').submit();
}

function screen_delete() {
	var dialog = $( "#screendeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/delete/');
            	$('#screenlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#screenlistform'));
}

function screen_copy() {
	var dialog = $( "#screencopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/copy/');
            	$('#screenlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#screenlistform'));
}

function screen_approve() {
	var dialog = $( "#screenapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/approve/');
            	$('#screenlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#screenlistform'));
}

function screen_batchedit() {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/batchedit/');
	$('#screenlistform').submit();
}

function screen_update(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/bulkupdate/' + col + '/' + val);
	$('#screenlistform').submit();
}

function screen_dupdate(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/bulkdupdate/' + col + '/' + val);
	$('#screenlistform').submit();
}

function screen_customaction(controller, action) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#screenlistform').submit();
}

function screen_filter(col, val) {
	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/filter/' + col + '/' + val);
	$('#screenlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function screen_<{$item->ACTION}>() {
        	$('#screenlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/screen/<{$item->ACTION}>/');
        	$('#screenlistform').submit();
		}
	<{/if}>
<{/foreach}>

function screen_checkall(checked) {
	$('#screenlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('screenlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#screenlist .top-holder').show();

		$('#screenlist .top-holder .selectall').show();
		$('#screenlist .top-holder .clearselection').hide();
	} else {
		$('#screenlist .top-holder').hide();

	    document.screenlist.screenlist_selection_selectall.value = 0;
	}
}

function screen_selectall() {
	screen_checkall(true);

    document.screenlist.screenlist_selection_selectall.value = 1;

	$('#screenlist .top-holder .selectall').hide();
	$('#screenlist .top-holder .clearselection').show();
}

function screen_clearselection() {
	screen_checkall(false);

    document.screenlist.screenlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.screen.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/screen/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="screen-pagination-from"><{$limit_from}>-<span class="screen-pagination-to"><{$limit_to}></span> of <span class="screen-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/screen/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="screen-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.screen-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.screen-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#screenlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#screenlistform :focusable:first').focus();
        }

    	$('#screenlistform').click(function(){
    	    var focused = $('#screenlistform :focus');

    	    if (focused.length == 0) {
                $('#screenlistform :focusable:first').focus();
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
