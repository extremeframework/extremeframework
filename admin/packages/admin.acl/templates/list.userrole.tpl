<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_USER_ROLE}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userrolequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/userrole/search" method="post" enctype="multipart/form-data">
            <input type="text" name="userrole_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#userrolequicksearch').submit(); return false;">
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
            $('#userrolequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userrolequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.userrole) }>
<{foreach from=$messages.userrole key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="userrolelist" id="userrolelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/userrole/" method="post">

<input type="hidden" name="userrolelist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.userrole.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userrole.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/userrole/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_USER_ROLE|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_USER_ROLE|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userrole.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userrole_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userrole[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userrole_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_USER_ROLE)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_USER_ROLE)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_USER_ROLE), strtolower(L_USER_ROLE)));
    <{/php}>

    <div id="userrolecopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_USER_ROLE|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="usermembership" /> <{label key="L_COPY_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="strtolower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="workflowtransition" /> <{label key="L_COPY_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="userroleapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_USER_ROLE|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="usermembership" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="strtolower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="workflowtransition" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="userroledeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_USER_ROLE|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="usermembership" /> <{label key="L_DELETE_ALSO"}> <{label key="L_USER_MEMBERSHIP" format="strtolower"}></li>
                <{/if}>
                            <{if Framework::hasModule('WorkflowTransition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="workflowtransition" /> <{label key="L_DELETE_ALSO"}> <{label key="L_WORKFLOW_TRANSITION" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userrole_reset() {
	$('input, select', '#userrole-search').val('');
}

function userrole_search() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/search/');
	$('#userrolelistform').submit();
}

function userrole_save() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/save/?back=0');
	$('#userrolelistform').submit();
}

function userrole_delete() {
	var dialog = $( "#userroledeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/delete/');
            	$('#userrolelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userrolelistform'));
}

function userrole_copy() {
	var dialog = $( "#userrolecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/copy/');
            	$('#userrolelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userrolelistform'));
}

function userrole_approve() {
	var dialog = $( "#userroleapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/approve/');
            	$('#userrolelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userrolelistform'));
}

function userrole_batchedit() {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/batchedit/');
	$('#userrolelistform').submit();
}

function userrole_update(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/bulkupdate/' + col + '/' + val);
	$('#userrolelistform').submit();
}

function userrole_dupdate(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/bulkdupdate/' + col + '/' + val);
	$('#userrolelistform').submit();
}

function userrole_customaction(controller, action) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userrolelistform').submit();
}

function userrole_filter(col, val) {
	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/filter/' + col + '/' + val);
	$('#userrolelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userrole_<{$item->ACTION}>() {
        	$('#userrolelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userrole/<{$item->ACTION}>/');
        	$('#userrolelistform').submit();
		}
	<{/if}>
<{/foreach}>

function userrole_checkall(checked) {
	$('#userrolelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userrolelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userrolelist .top-holder').show();

		$('#userrolelist .top-holder .selectall').show();
		$('#userrolelist .top-holder .clearselection').hide();
	} else {
		$('#userrolelist .top-holder').hide();

	    document.userrolelist.userrolelist_selection_selectall.value = 0;
	}
}

function userrole_selectall() {
	userrole_checkall(true);

    document.userrolelist.userrolelist_selection_selectall.value = 1;

	$('#userrolelist .top-holder .selectall').hide();
	$('#userrolelist .top-holder .clearselection').show();
}

function userrole_clearselection() {
	userrole_checkall(false);

    document.userrolelist.userrolelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userrole.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userrole/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userrole-pagination-from"><{$limit_from}>-<span class="userrole-pagination-to"><{$limit_to}></span> of <span class="userrole-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userrole/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="userrole-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userrole-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userrole-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userrolelistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userrolelistform :focusable:first').focus();
        }

    	$('#userrolelistform').click(function(){
    	    var focused = $('#userrolelistform :focus');

    	    if (focused.length == 0) {
                $('#userrolelistform :focusable:first').focus();
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
