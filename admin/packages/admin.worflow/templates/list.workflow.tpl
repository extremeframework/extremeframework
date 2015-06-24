<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_WORKFLOW}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflow/search" method="post" enctype="multipart/form-data">
            <input type="text" name="workflow_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#workflowquicksearch').submit(); return false;">
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
            $('#workflowquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.workflow) }>
<{foreach from=$messages.workflow key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="workflowlist" id="workflowlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflow/" method="post">

<input type="hidden" name="workflowlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.workflow.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflow.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/workflow/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_WORKFLOW|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_WORKFLOW|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflow.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflow_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflow[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflow_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_WORKFLOW)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_WORKFLOW)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_WORKFLOW), strtolower(L_WORKFLOW)));
    <{/php}>

    <div id="workflowcopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_WORKFLOW|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="screen" /> <{label key="L_COPY_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowapplication" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowlog" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowStage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowstage" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_STAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowtransition" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="workflowapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_WORKFLOW|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="screen" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowapplication" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowlog" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowStage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowstage" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_STAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowtransition" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="workflowdeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_WORKFLOW|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Screen')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="screen" /> <{label key="L_DELETE_ALSO"}> <{label key="L_SCREEN" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowApplication')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowapplication" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_APPLICATION" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowLog')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowlog" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_LOG" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowStage')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowstage" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_STAGE" format="lower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowtransition" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="lower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflow_reset() {
	$('input, select', '#workflow-search').val('');
}

function workflow_search() {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/search/');
	$('#workflowlistform').submit();
}

function workflow_save() {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/save/?back=0');
	$('#workflowlistform').submit();
}

function workflow_delete() {
	var dialog = $( "#workflowdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/delete/');
            	$('#workflowlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowlistform'));
}

function workflow_copy() {
	var dialog = $( "#workflowcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/copy/');
            	$('#workflowlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowlistform'));
}

function workflow_approve() {
	var dialog = $( "#workflowapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/approve/');
            	$('#workflowlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#workflowlistform'));
}

function workflow_batchedit() {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/batchedit/');
	$('#workflowlistform').submit();
}

function workflow_update(col, val) {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/bulkupdate/' + col + '/' + val);
	$('#workflowlistform').submit();
}

function workflow_dupdate(col, val) {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/bulkdupdate/' + col + '/' + val);
	$('#workflowlistform').submit();
}

function workflow_customaction(controller, action) {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowlistform').submit();
}

function workflow_filter(col, val) {
	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/filter/' + col + '/' + val);
	$('#workflowlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflow_<{$item->ACTION}>() {
        	$('#workflowlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflow/<{$item->ACTION}>/');
        	$('#workflowlistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflow_checkall(checked) {
	$('#workflowlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowlist .top-holder').show();

		$('#workflowlist .top-holder .selectall').show();
		$('#workflowlist .top-holder .clearselection').hide();
	} else {
		$('#workflowlist .top-holder').hide();

	    document.workflowlist.workflowlist_selection_selectall.value = 0;
	}
}

function workflow_selectall() {
	workflow_checkall(true);

    document.workflowlist.workflowlist_selection_selectall.value = 1;

	$('#workflowlist .top-holder .selectall').hide();
	$('#workflowlist .top-holder .clearselection').show();
}

function workflow_clearselection() {
	workflow_checkall(false);

    document.workflowlist.workflowlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflow.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflow/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflow-pagination-from"><{$limit_from}>-<span class="workflow-pagination-to"><{$limit_to}></span> of <span class="workflow-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflow/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="workflow-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflow-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflow-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowlistform :focusable:first').focus();
        }

    	$('#workflowlistform').click(function(){
    	    var focused = $('#workflowlistform :focus');

    	    if (focused.length == 0) {
                $('#workflowlistform :focusable:first').focus();
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
