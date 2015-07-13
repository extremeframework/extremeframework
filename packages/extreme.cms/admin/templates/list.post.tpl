<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_POST')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="postquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/post/search" method="get">
            <input type="text" name="post_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#postquicksearch').submit(); return false;">
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
            $('#postquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#postquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.post) }>
<{foreach from=$messages.post key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.post.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.post.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_POST', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_POST')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.post.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="post_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.post.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('L_IMPORT', true)}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.post.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/post/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('L_EXPORT', true)}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/post/customfilter/{id}" class="post-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="post" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer post-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/post"><i class="fa fa-plus-circle"></i> <{_t('L_CREATE_NEW_FILTER')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons post-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.post-custom-filter', '.post-custom-filter-footer', '.post-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.post[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="post_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
    	$template->assign('copyguidelines',  sprintf(_t('L_GUIDELINES_COPY_RELS'), strtolower(_t('L_POST'))));
    	$template->assign('approveguidelines', sprintf(_t('L_GUIDELINES_APPROVE_RELS'), strtolower(_t('L_POST'))));
    	$template->assign('deleteguidelines', sprintf(_t('L_GUIDELINES_DELETE_RELS'), strtolower(_t('L_POST')), strtolower(_t('L_POST'))));
    <{/php}>

    <div id="postcopyrelations" style="display:none" title="<{_t('L_COPY', true)}> <{_t('L_POST', true)|strtolower}>">
        <p><{$copyguidelines}></p>
        <ul>
                            <{if Framework::hasModule('MenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="menuitem" /> <{_t('L_COPY_ALSO')}> <{_t('L_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="postgallery" /> <{_t('L_COPY_ALSO')}> <{_t('L_POST_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostRelation')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="postrelation" /> <{_t('L_COPY_ALSO')}> <{_t('L_POST_RELATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="copyrelations[]" value="postsection" /> <{_t('L_COPY_ALSO')}> <{_t('L_POST_SECTION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="postapproverelations" style="display:none" title="<{_t('L_APPROVE', true)}> <{_t('L_POST', true)|strtolower}>">
        <p><{$approveguidelines}></p>
        <ul>
                            <{if Framework::hasModule('MenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="menuitem" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="postgallery" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_POST_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostRelation')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="postrelation" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_POST_RELATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="approverelations[]" value="postsection" /> <{_t('L_APPROVE_ALSO')}> <{_t('L_POST_SECTION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

    <div id="postdeleterelations" style="display:none" title="<{_t('L_DELETE', true)}> <{_t('L_POST', true)|strtolower}>">
        <p><{$deleteguidelines}></p>
        <ul>
                            <{if Framework::hasModule('MenuItem')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="menuitem" /> <{_t('L_DELETE_ALSO')}> <{_t('L_MENU_ITEM')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostGallery')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="postgallery" /> <{_t('L_DELETE_ALSO')}> <{_t('L_POST_GALLERY')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostRelation')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="postrelation" /> <{_t('L_DELETE_ALSO')}> <{_t('L_POST_RELATION')|strtolower}></li>
                <{/if}>
                            <{if Framework::hasModule('PostSection')}>
                    <li style="padding:5px 0 5px 0"><input type="checkbox" name="deleterelations[]" value="postsection" /> <{_t('L_DELETE_ALSO')}> <{_t('L_POST_SECTION')|strtolower}></li>
                <{/if}>
                    </ul>
    </div>

<!-- Search form -->

<!-- List -->
<form name="postlist" id="postlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/post/" method="post">
<input type="hidden" name="postlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function post_reset() {
	$('input, select', '#post-search').val('');
}

function post_search() {
	$('#post-search').submit();
}

function post_save() {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/save/?back=0');
	$('#postlistform').submit();
}

function post_delete() {
	var dialog = $( "#postdeleterelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_DELETE', true)}>": function() {
            	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/delete/');
            	$('#postlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postlistform'));
}

function post_copy() {
	var dialog = $( "#postcopyrelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_COPY', true)}>": function() {
            	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/copy/');
            	$('#postlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postlistform'));
}

function post_approve() {
	var dialog = $( "#postapproverelations" ).dialog({
		resizable: true,
		width: 500,
		modal: false,
		buttons: {
			"<{_t('L_APPROVE', true)}>": function() {
            	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/approve/');
            	$('#postlistform').submit();
				$( this ).dialog( "close" );
			},
			"<{_t('L_CANCEL', true)}>": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	dialog.parent().appendTo($('#postlistform'));
}

function post_batchedit() {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/batchedit/');
	$('#postlistform').submit();
}

function post_update(col, val) {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/bulkupdate/' + col + '/' + val);
	$('#postlistform').submit();
}

function post_dupdate(col, val) {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/bulkdupdate/' + col + '/' + val);
	$('#postlistform').submit();
}

function post_customaction(controller, action) {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#postlistform').submit();
}

function post_filter(col, val) {
	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/filter/' + col + '/' + val);
	$('#postlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function post_<{$item->ACTION}>() {
        	$('#postlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/post/<{$item->ACTION}>/');
        	$('#postlistform').submit();
		}
	<{/if}>
<{/foreach}>

function post_checkall(checked) {
	$('#postlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('postlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#postlist .top-holder').show();

		$('#postlist .top-holder .selectall').show();
		$('#postlist .top-holder .clearselection').hide();
	} else {
		$('#postlist .top-holder').hide();

	    document.postlist.postlist_selection_selectall.value = 0;
	}
}

function post_selectall() {
	post_checkall(true);

    document.postlist.postlist_selection_selectall.value = 1;

	$('#postlist .top-holder .selectall').hide();
	$('#postlist .top-holder .clearselection').show();
}

function post_clearselection() {
	post_checkall(false);

    document.postlist.postlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.post.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="post-pagination-from"><{$limit_from}>-<span class="post-pagination-to"><{$limit_to}></span> of <span class="post-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/post/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="post-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.post-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.post-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#postlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postlistform :focusable:first').focus();
        }

    	$('#postlistform').click(function(){
    	    var focused = $('#postlistform :focus');

    	    if (focused.length == 0) {
                $('#postlistform :focusable:first').focus();
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
