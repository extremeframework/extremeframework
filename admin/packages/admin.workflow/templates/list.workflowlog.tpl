<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_WORKFLOW_LOG')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="workflowlogquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowlog/search" method="get">
            <input type="text" name="workflowlog_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#workflowlogquicksearch').submit(); return false;">
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
            $('#workflowlogquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#workflowlogquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.workflowlog.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.workflowlog.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_WORKFLOW_LOG', true)|strtolower}>"/><{_t('New')}> <{_t('L_WORKFLOW_LOG')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.workflowlog.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="workflowlog_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/workflowlog/customfilter/{id}" class="workflowlog-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="workflowlog" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer workflowlog-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/workflowlog"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons workflowlog-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.workflowlog-custom-filter', '.workflowlog-custom-filter-footer', '.workflowlog-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.workflowlog[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="workflowlog_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="workflowloglist" id="workflowloglistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/workflowlog/" method="post">
<input type="hidden" name="workflowloglist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function workflowlog_reset() {
	$('input, select', '#workflowlog-search').val('');
}

function workflowlog_search() {
	$('#workflowlog-search').submit();
}

function workflowlog_save() {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/save/?back=0');
	$('#workflowloglistform').submit();
}

function workflowlog_delete() {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/delete/');
	$('#workflowloglistform').submit();
}

function workflowlog_copy() {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/copy/');
	$('#workflowloglistform').submit();
}

function workflowlog_approve() {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/approve/');
	$('#workflowloglistform').submit();
}

function workflowlog_batchedit() {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/batchedit/');
	$('#workflowloglistform').submit();
}

function workflowlog_update(col, val) {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/bulkupdate/' + col + '/' + val);
	$('#workflowloglistform').submit();
}

function workflowlog_dupdate(col, val) {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/bulkdupdate/' + col + '/' + val);
	$('#workflowloglistform').submit();
}

function workflowlog_customaction(controller, action) {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#workflowloglistform').submit();
}

function workflowlog_filter(col, val) {
	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/filter/' + col + '/' + val);
	$('#workflowloglistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function workflowlog_<{$item->ACTION}>() {
        	$('#workflowloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/workflowlog/<{$item->ACTION}>/');
        	$('#workflowloglistform').submit();
		}
	<{/if}>
<{/foreach}>

function workflowlog_checkall(checked) {
	$('#workflowloglist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('workflowloglist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#workflowloglist .top-holder').show();

		$('#workflowloglist .top-holder .selectall').show();
		$('#workflowloglist .top-holder .clearselection').hide();
	} else {
		$('#workflowloglist .top-holder').hide();

	    document.workflowloglist.workflowloglist_selection_selectall.value = 0;
	}
}

function workflowlog_selectall() {
	workflowlog_checkall(true);

    document.workflowloglist.workflowloglist_selection_selectall.value = 1;

	$('#workflowloglist .top-holder .selectall').hide();
	$('#workflowloglist .top-holder .clearselection').show();
}

function workflowlog_clearselection() {
	workflowlog_checkall(false);

    document.workflowloglist.workflowloglist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.workflowlog.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="workflowlog-pagination-from"><{$limit_from}>-<span class="workflowlog-pagination-to"><{$limit_to}></span> of <span class="workflowlog-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/workflowlog/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="workflowlog-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.workflowlog-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.workflowlog-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#workflowloglistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#workflowloglistform :focusable:first').focus();
        }

    	$('#workflowloglistform').click(function(){
    	    var focused = $('#workflowloglistform :focus');

    	    if (focused.length == 0) {
                $('#workflowloglistform :focusable:first').focus();
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
