<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Acl Type')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="acltypequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/acltype/search" method="get">
            <input type="text" name="acltype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#acltypequicksearch').submit(); return false;">
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
            $('#acltypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#acltypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.acltype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.acltype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Acl Type', true)|strtolower}>"/><{_t('New')}> <{_t('Acl Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.acltype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="acltype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.acltype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="acltype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('Acl Type'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('Acl Type'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('Acl Type')), strtolower(_t('Acl Type'))));
    <{/php}>

    <div id="acltypecopyrelations" style="display:none" title="<{_t('Copy', true)}> <{_t('Acl Type', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="fieldacl" /> <{_t('Copy also')}> <{_t('Field Acl')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="objectacl" /> <{_t('Copy also')}> <{_t('Object Acl')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="acltypeapproverelations" style="display:none" title="<{_t('Approve', true)}> <{_t('Acl Type', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="fieldacl" /> <{_t('Approve also')}> <{_t('Field Acl')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="objectacl" /> <{_t('Approve also')}> <{_t('Object Acl')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="acltypedeleterelations" style="display:none" title="<{_t('Delete', true)}> <{_t('Acl Type', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('FieldAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="fieldacl" /> <{_t('Delete also')}> <{_t('Field Acl')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('ObjectAcl')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="objectacl" /> <{_t('Delete also')}> <{_t('Object Acl')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="acltypelist" id="acltypelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/acltype/" method="post">
<input type="hidden" name="acltypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function acltype_reset() {
	$('input, select', '#acltype-search').val('');
}

function acltype_search() {
	$('#acltype-search').submit();
}

function acltype_save() {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/save/?back=0');
	$('#acltypelistform').submit();
}

function acltype_delete() {
	var dialog = $( "#acltypedeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Delete', true)}>": function() {
            	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/delete/');
            	$('#acltypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#acltypelistform'));
}

function acltype_copy() {
	var dialog = $( "#acltypecopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Copy', true)}>": function() {
            	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/copy/');
            	$('#acltypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#acltypelistform'));
}

function acltype_approve() {
	var dialog = $( "#acltypeapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('Approve', true)}>": function() {
            	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/approve/');
            	$('#acltypelistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('Cancel', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#acltypelistform'));
}

function acltype_batchedit() {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/batchedit/');
	$('#acltypelistform').submit();
}

function acltype_update(col, val) {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/bulkupdate/' + col + '/' + val);
	$('#acltypelistform').submit();
}

function acltype_dupdate(col, val) {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/bulkdupdate/' + col + '/' + val);
	$('#acltypelistform').submit();
}

function acltype_customaction(controller, action) {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#acltypelistform').submit();
}

function acltype_filter(col, val) {
	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/filter/' + col + '/' + val);
	$('#acltypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function acltype_<{$item->ACTION}>() {
        	$('#acltypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/acltype/<{$item->ACTION}>/');
        	$('#acltypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function acltype_checkall(checked) {
	$('#acltypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('acltypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#acltypelist .top-holder').show();

		$('#acltypelist .top-holder .selectall').show();
		$('#acltypelist .top-holder .clearselection').hide();
	} else {
		$('#acltypelist .top-holder').hide();

	    document.acltypelist.acltypelist_selection_selectall.value = 0;
	}
}

function acltype_selectall() {
	acltype_checkall(true);

    document.acltypelist.acltypelist_selection_selectall.value = 1;

	$('#acltypelist .top-holder .selectall').hide();
	$('#acltypelist .top-holder .clearselection').show();
}

function acltype_clearselection() {
	acltype_checkall(false);

    document.acltypelist.acltypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.acltype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/acltype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="acltype-pagination-from"><{$limit_from}>-<span class="acltype-pagination-to"><{$limit_to}></span> of <span class="acltype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/acltype/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="acltype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.acltype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.acltype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#acltypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#acltypelistform :focusable:first').focus();
        }

    	$('#acltypelistform').click(function(){
    	    var focused = $('#acltypelistform :focus');

    	    if (focused.length == 0) {
                $('#acltypelistform :focusable:first').focus();
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
