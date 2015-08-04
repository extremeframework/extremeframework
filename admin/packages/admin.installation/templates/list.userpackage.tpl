<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('User Package')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userpackagequicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/userpackage/search" method="get">
            <input type="text" name="userpackage_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userpackagequicksearch').submit(); return false;">
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
            $('#userpackagequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userpackagequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpackage"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.userpackage.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userpackage.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userpackage/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('User Package', true)|strtolower}>"/><{_t('New')}> <{_t('User Package')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userpackage.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userpackage_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userpackage.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/userpackage/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userpackage.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/userpackage/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select multilingual="0" data-url="<{$smarty.const.APPLICATION_URL}>/userpackage/customfilter/{id}" class="userpackage-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="userpackage" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer userpackage-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/userpackage"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons userpackage-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.userpackage-custom-filter', '.userpackage-custom-filter-footer', '.userpackage-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userpackage[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userpackage_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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

<!-- Search form -->

<!-- List -->
<form name="userpackagelist" id="userpackagelistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/userpackage/" method="post">
<input type="hidden" name="userpackagelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userpackage_reset() {
	$('input, select', '#userpackage-search').val('');
}

function userpackage_search() {
	$('#userpackage-search').submit();
}

function userpackage_save() {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/save/?back=0');
	$('#userpackagelistform').submit();
}

function userpackage_delete() {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/delete/');
	$('#userpackagelistform').submit();
}

function userpackage_copy() {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/copy/');
	$('#userpackagelistform').submit();
}

function userpackage_approve() {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/approve/');
	$('#userpackagelistform').submit();
}

function userpackage_batchedit() {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/batchedit/');
	$('#userpackagelistform').submit();
}

function userpackage_update(col, val) {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/bulkupdate/' + col + '/' + val);
	$('#userpackagelistform').submit();
}

function userpackage_dupdate(col, val) {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/bulkdupdate/' + col + '/' + val);
	$('#userpackagelistform').submit();
}

function userpackage_customaction(controller, action) {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userpackagelistform').submit();
}

function userpackage_filter(col, val) {
	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/filter/' + col + '/' + val);
	$('#userpackagelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userpackage_<{$item->ACTION}>() {
        	$('#userpackagelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userpackage/<{$item->ACTION}>/');
        	$('#userpackagelistform').submit();
		}
	<{/if}>
<{/foreach}>

function userpackage_checkall(checked) {
	$('#userpackagelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userpackagelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userpackagelist .top-holder').show();

		$('#userpackagelist .top-holder .selectall').show();
		$('#userpackagelist .top-holder .clearselection').hide();
	} else {
		$('#userpackagelist .top-holder').hide();

	    document.userpackagelist.userpackagelist_selection_selectall.value = 0;
	}
}

function userpackage_selectall() {
	userpackage_checkall(true);

    document.userpackagelist.userpackagelist_selection_selectall.value = 1;

	$('#userpackagelist .top-holder .selectall').hide();
	$('#userpackagelist .top-holder .clearselection').show();
}

function userpackage_clearselection() {
	userpackage_checkall(false);

    document.userpackagelist.userpackagelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userpackage.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpackage/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userpackage-pagination-from"><{$limit_from}>-<span class="userpackage-pagination-to"><{$limit_to}></span> of <span class="userpackage-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userpackage/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="userpackage-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userpackage-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userpackage-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userpackagelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userpackagelistform :focusable:first').focus();
        }

    	$('#userpackagelistform').click(function(){
    	    var focused = $('#userpackagelistform :focus');

    	    if (focused.length == 0) {
                $('#userpackagelistform :focusable:first').focus();
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
