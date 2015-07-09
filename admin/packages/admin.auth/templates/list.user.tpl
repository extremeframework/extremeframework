<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_USER')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/user/search" method="post" enctype="multipart/form-data">
            <input type="text" name="user_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#userquicksearch').submit(); return false;">
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
            $('#userquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/user"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.user) }>
<{foreach from=$messages.user key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="userlist" id="userlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/user/" method="post">

<input type="hidden" name="userlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.user.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.user.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_USER')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_USER')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.user.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="user_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/user/customfilter/{id}" class="user-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="user" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer user-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/user"><i class="fa fa-plus-circle"></i> <{_t('L_CREATE_NEW_FILTER')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons user-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.user-custom-filter', '.user-custom-filter-footer', '.user-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.user[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="user_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(L_GUIDELINES_COPY_RELS, strtolower(L_USER)));
    	$template->assign('approveguidelines', sprintf(L_GUIDELINES_APPROVE_RELS, strtolower(L_USER)));
    	$template->assign('deleteguidelines', sprintf(L_GUIDELINES_DELETE_RELS, strtolower(L_USER), strtolower(L_USER)));
    <{/php}>

    <div id="usercopyrelations" style="display:none" title="<{_t('L_COPY')}> <{_t('L_USER')|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="usermembership" /> <{_t('L_COPY_ALSO')}> <{_t('L_USER_MEMBERSHIP')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="userpreference" /> <{_t('L_COPY_ALSO')}> <{_t('L_USER_PREFERENCE')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="userapproverelations" style="display:none" title="<{_t('L_APPROVE')}> <{_t('L_USER')|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="usermembership" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_USER_MEMBERSHIP')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="userpreference" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_USER_PREFERENCE')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="userdeleterelations" style="display:none" title="<{_t('L_DELETE')}> <{_t('L_USER')|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('UserMembership')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="usermembership" /> <{_t('L_DELETE_ALSO')}> <{_t('L_USER_MEMBERSHIP')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('UserPreference')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="userpreference" /> <{_t('L_DELETE_ALSO')}> <{_t('L_USER_PREFERENCE')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function user_reset() {
	$('input, select', '#user-search').val('');
}

function user_search() {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/search/');
	$('#userlistform').submit();
}

function user_save() {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/save/?back=0');
	$('#userlistform').submit();
}

function user_delete() {
	var dialog = $( "#userdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE')}>": function() {
            	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/delete/');
            	$('#userlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userlistform'));
}

function user_copy() {
	var dialog = $( "#usercopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY')}>": function() {
            	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/copy/');
            	$('#userlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userlistform'));
}

function user_approve() {
	var dialog = $( "#userapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE')}>": function() {
            	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/approve/');
            	$('#userlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL')}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#userlistform'));
}

function user_batchedit() {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/batchedit/');
	$('#userlistform').submit();
}

function user_update(col, val) {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/bulkupdate/' + col + '/' + val);
	$('#userlistform').submit();
}

function user_dupdate(col, val) {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/bulkdupdate/' + col + '/' + val);
	$('#userlistform').submit();
}

function user_customaction(controller, action) {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userlistform').submit();
}

function user_filter(col, val) {
	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/filter/' + col + '/' + val);
	$('#userlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function user_<{$item->ACTION}>() {
        	$('#userlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/user/<{$item->ACTION}>/');
        	$('#userlistform').submit();
		}
	<{/if}>
<{/foreach}>

function user_checkall(checked) {
	$('#userlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userlist .top-holder').show();

		$('#userlist .top-holder .selectall').show();
		$('#userlist .top-holder .clearselection').hide();
	} else {
		$('#userlist .top-holder').hide();

	    document.userlist.userlist_selection_selectall.value = 0;
	}
}

function user_selectall() {
	user_checkall(true);

    document.userlist.userlist_selection_selectall.value = 1;

	$('#userlist .top-holder .selectall').hide();
	$('#userlist .top-holder .clearselection').show();
}

function user_clearselection() {
	user_checkall(false);

    document.userlist.userlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.user.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="user-pagination-from"><{$limit_from}>-<span class="user-pagination-to"><{$limit_to}></span> of <span class="user-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/user/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="user-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.user-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.user-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userlistform :focusable:first').focus();
        }

    	$('#userlistform').click(function(){
    	    var focused = $('#userlistform :focus');

    	    if (focused.length == 0) {
                $('#userlistform :focusable:first').focus();
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
