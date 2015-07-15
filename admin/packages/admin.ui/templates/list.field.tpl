<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_FIELD')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="fieldquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/field/search" method="get">
            <input type="text" name="field_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#fieldquicksearch').submit(); return false;">
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
            $('#fieldquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#fieldquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/field"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.field.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.field.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/field/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_FIELD', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_FIELD')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.field.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="field_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.field[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="field_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('L_FIELD'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('L_FIELD'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('L_FIELD')), strtolower(_t('L_FIELD'))));
    <{/php}>

    <div id="fieldcopyrelations" style="display:none" title="<{_t('L_COPY', true)}> <{_t('L_FIELD', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminFilterCondition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="adminfiltercondition" /> <{_t('L_COPY_ALSO')}> <{_t('L_ADMIN_FILTER_CONDITION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="fieldapproverelations" style="display:none" title="<{_t('L_APPROVE', true)}> <{_t('L_FIELD', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminFilterCondition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="adminfiltercondition" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_ADMIN_FILTER_CONDITION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="fielddeleterelations" style="display:none" title="<{_t('L_DELETE', true)}> <{_t('L_FIELD', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('AdminFilterCondition')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="adminfiltercondition" /> <{_t('L_DELETE_ALSO')}> <{_t('L_ADMIN_FILTER_CONDITION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="fieldlist" id="fieldlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/field/" method="post">
<input type="hidden" name="fieldlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function field_reset() {
	$('input, select', '#field-search').val('');
}

function field_search() {
	$('#field-search').submit();
}

function field_save() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/save/?back=0');
	$('#fieldlistform').submit();
}

function field_delete() {
	var dialog = $( "#fielddeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE', true)}>": function() {
            	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/delete/');
            	$('#fieldlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#fieldlistform'));
}

function field_copy() {
	var dialog = $( "#fieldcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY', true)}>": function() {
            	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/copy/');
            	$('#fieldlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#fieldlistform'));
}

function field_approve() {
	var dialog = $( "#fieldapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE', true)}>": function() {
            	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/approve/');
            	$('#fieldlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#fieldlistform'));
}

function field_batchedit() {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/batchedit/');
	$('#fieldlistform').submit();
}

function field_update(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/bulkupdate/' + col + '/' + val);
	$('#fieldlistform').submit();
}

function field_dupdate(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/bulkdupdate/' + col + '/' + val);
	$('#fieldlistform').submit();
}

function field_customaction(controller, action) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#fieldlistform').submit();
}

function field_filter(col, val) {
	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/filter/' + col + '/' + val);
	$('#fieldlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function field_<{$item->ACTION}>() {
        	$('#fieldlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/field/<{$item->ACTION}>/');
        	$('#fieldlistform').submit();
		}
	<{/if}>
<{/foreach}>

function field_checkall(checked) {
	$('#fieldlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('fieldlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#fieldlist .top-holder').show();

		$('#fieldlist .top-holder .selectall').show();
		$('#fieldlist .top-holder .clearselection').hide();
	} else {
		$('#fieldlist .top-holder').hide();

	    document.fieldlist.fieldlist_selection_selectall.value = 0;
	}
}

function field_selectall() {
	field_checkall(true);

    document.fieldlist.fieldlist_selection_selectall.value = 1;

	$('#fieldlist .top-holder .selectall').hide();
	$('#fieldlist .top-holder .clearselection').show();
}

function field_clearselection() {
	field_checkall(false);

    document.fieldlist.fieldlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.field.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/field/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="field-pagination-from"><{$limit_from}>-<span class="field-pagination-to"><{$limit_to}></span> of <span class="field-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/field/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="field-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.field-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.field-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#fieldlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#fieldlistform :focusable:first').focus();
        }

    	$('#fieldlistform').click(function(){
    	    var focused = $('#fieldlistform :focus');

    	    if (focused.length == 0) {
                $('#fieldlistform :focusable:first').focus();
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
