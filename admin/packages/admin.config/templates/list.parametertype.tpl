<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=$smarty.const.L_PARAMETER_TYPE}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="parametertypequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/parametertype/search" method="post" enctype="multipart/form-data">
            <input type="text" name="parametertype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{$smarty.const.L_SEARCH}>" />
	        <a class="button-quick-search" onclick="$('#parametertypequicksearch').submit(); return false;">
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
            $('#parametertypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#parametertypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametertype"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.parametertype) }>
<{foreach from=$messages.parametertype key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="parametertypelist" id="parametertypelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/parametertype/" method="post">

<input type="hidden" name="parametertypelist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.parametertype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.parametertype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametertype/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{$smarty.const.L_NEW}> <{$smarty.const.L_PARAMETER_TYPE|strtolower}>"/><{label key="L_NEW"}> <{$smarty.const.L_PARAMETER_TYPE|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.parametertype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="parametertype_delete()"><span class="button-face"><{$smarty.const.L_DELETE}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{label text="More" insidequote=true}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.parametertype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="parametertype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{label text=$item->TITLE}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_PARAMETER_TYPE)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_PARAMETER_TYPE)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_PARAMETER_TYPE), strtolower(L_PARAMETER_TYPE)));
    <{/php}>

    <div id="parametertypecopyrelations" style="display:none" title="<{$smarty.const.L_COPY}> <{$smarty.const.L_PARAMETER_TYPE|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="parameter" /> <{label key="L_COPY_ALSO"}> <{label key="L_PARAMETER" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="parametertypeapproverelations" style="display:none" title="<{$smarty.const.L_APPROVE}> <{$smarty.const.L_PARAMETER_TYPE|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="parameter" /> <{label key="L_APPROVE_ALSO"}> <{label key="L_PARAMETER" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="parametertypedeleterelations" style="display:none" title="<{$smarty.const.L_DELETE}> <{$smarty.const.L_PARAMETER_TYPE|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('Parameter')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="parameter" /> <{label key="L_DELETE_ALSO"}> <{label key="L_PARAMETER" format="strtolower"}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function parametertype_reset() {
	$('input, select', '#parametertype-search').val('');
}

function parametertype_search() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/search/');
	$('#parametertypelistform').submit();
}

function parametertype_save() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/save/?back=0');
	$('#parametertypelistform').submit();
}

function parametertype_delete() {
	var dialog = $( "#parametertypedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_DELETE}>": function() {
            	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/delete/');
            	$('#parametertypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#parametertypelistform'));
}

function parametertype_copy() {
	var dialog = $( "#parametertypecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_COPY}>": function() {
            	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/copy/');
            	$('#parametertypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#parametertypelistform'));
}

function parametertype_approve() {
	var dialog = $( "#parametertypeapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{$smarty.const.L_APPROVE}>": function() {
            	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/approve/');
            	$('#parametertypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{$smarty.const.L_CANCEL}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#parametertypelistform'));
}

function parametertype_batchedit() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/batchedit/');
	$('#parametertypelistform').submit();
}

function parametertype_update(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/bulkupdate/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

function parametertype_dupdate(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/bulkdupdate/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

function parametertype_customaction(controller, action) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#parametertypelistform').submit();
}

function parametertype_filter(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/filter/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function parametertype_<{$item->ACTION}>() {
        	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/<{$item->ACTION}>/');
        	$('#parametertypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function parametertype_checkall(checked) {
	$('#parametertypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('parametertypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#parametertypelist .top-holder').show();

		$('#parametertypelist .top-holder .selectall').show();
		$('#parametertypelist .top-holder .clearselection').hide();
	} else {
		$('#parametertypelist .top-holder').hide();

	    document.parametertypelist.parametertypelist_selection_selectall.value = 0;
	}
}

function parametertype_selectall() {
	parametertype_checkall(true);

    document.parametertypelist.parametertypelist_selection_selectall.value = 1;

	$('#parametertypelist .top-holder .selectall').hide();
	$('#parametertypelist .top-holder .clearselection').show();
}

function parametertype_clearselection() {
	parametertype_checkall(false);

    document.parametertypelist.parametertypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.parametertype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="parametertype-pagination-from"><{$limit_from}>-<span class="parametertype-pagination-to"><{$limit_to}></span> of <span class="parametertype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="parametertype-list-count list-count"><{$total}></span> <{label key="L_RECORDS"}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.parametertype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.parametertype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#parametertypelistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#parametertypelistform :focusable:first').focus();
        }

    	$('#parametertypelistform').click(function(){
    	    var focused = $('#parametertypelistform :focus');

    	    if (focused.length == 0) {
                $('#parametertypelistform :focusable:first').focus();
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
