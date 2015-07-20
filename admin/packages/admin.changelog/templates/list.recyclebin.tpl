<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('Recycle Bin')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="recyclebinquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/recyclebin/search" method="get">
            <input type="text" name="recyclebin_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#recyclebinquicksearch').submit(); return false;">
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
            $('#recyclebinquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#recyclebinquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/recyclebin"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.recyclebin.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.recyclebin.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/recyclebin/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Recycle Bin', true)|strtolower}>"/><{_t('New')}> <{_t('Recycle Bin')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.recyclebin.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="recyclebin_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/recyclebin/customfilter/{id}" class="recyclebin-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="recyclebin" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer recyclebin-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/recyclebin"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons recyclebin-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.recyclebin-custom-filter', '.recyclebin-custom-filter-footer', '.recyclebin-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.recyclebin[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="recyclebin_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="recyclebinlist" id="recyclebinlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/recyclebin/" method="post">
<input type="hidden" name="recyclebinlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function recyclebin_reset() {
	$('input, select', '#recyclebin-search').val('');
}

function recyclebin_search() {
	$('#recyclebin-search').submit();
}

function recyclebin_save() {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/save/?back=0');
	$('#recyclebinlistform').submit();
}

function recyclebin_delete() {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/delete/');
	$('#recyclebinlistform').submit();
}

function recyclebin_copy() {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/copy/');
	$('#recyclebinlistform').submit();
}

function recyclebin_approve() {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/approve/');
	$('#recyclebinlistform').submit();
}

function recyclebin_batchedit() {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/batchedit/');
	$('#recyclebinlistform').submit();
}

function recyclebin_update(col, val) {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/bulkupdate/' + col + '/' + val);
	$('#recyclebinlistform').submit();
}

function recyclebin_dupdate(col, val) {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/bulkdupdate/' + col + '/' + val);
	$('#recyclebinlistform').submit();
}

function recyclebin_customaction(controller, action) {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#recyclebinlistform').submit();
}

function recyclebin_filter(col, val) {
	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/filter/' + col + '/' + val);
	$('#recyclebinlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function recyclebin_<{$item->ACTION}>() {
        	$('#recyclebinlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/recyclebin/<{$item->ACTION}>/');
        	$('#recyclebinlistform').submit();
		}
	<{/if}>
<{/foreach}>

function recyclebin_checkall(checked) {
	$('#recyclebinlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('recyclebinlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#recyclebinlist .top-holder').show();

		$('#recyclebinlist .top-holder .selectall').show();
		$('#recyclebinlist .top-holder .clearselection').hide();
	} else {
		$('#recyclebinlist .top-holder').hide();

	    document.recyclebinlist.recyclebinlist_selection_selectall.value = 0;
	}
}

function recyclebin_selectall() {
	recyclebin_checkall(true);

    document.recyclebinlist.recyclebinlist_selection_selectall.value = 1;

	$('#recyclebinlist .top-holder .selectall').hide();
	$('#recyclebinlist .top-holder .clearselection').show();
}

function recyclebin_clearselection() {
	recyclebin_checkall(false);

    document.recyclebinlist.recyclebinlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.recyclebin.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/recyclebin/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="recyclebin-pagination-from"><{$limit_from}>-<span class="recyclebin-pagination-to"><{$limit_to}></span> of <span class="recyclebin-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/recyclebin/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="recyclebin-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.recyclebin-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.recyclebin-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#recyclebinlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#recyclebinlistform :focusable:first').focus();
        }

    	$('#recyclebinlistform').click(function(){
    	    var focused = $('#recyclebinlistform :focus');

    	    if (focused.length == 0) {
                $('#recyclebinlistform :focusable:first').focus();
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
