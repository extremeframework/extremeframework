<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_USER_LOG')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userlogquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/userlog/search" method="get">
            <input type="text" name="userlog_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#userlogquicksearch').submit(); return false;">
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
            $('#userlogquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userlogquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userlog"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.userlog) }>
<{foreach from=$messages.userlog key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.userlog.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userlog.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userlog/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_USER_LOG', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_USER_LOG')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userlog.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userlog_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/userlog/customfilter/{id}" class="userlog-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="userlog" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer userlog-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/userlog"><i class="fa fa-plus-circle"></i> <{_t('L_CREATE_NEW_FILTER')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons userlog-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.userlog-custom-filter', '.userlog-custom-filter-footer', '.userlog-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userlog[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userlog_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userloglist" id="userloglistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/userlog/" method="post">
<input type="hidden" name="userloglist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userlog_reset() {
	$('input, select', '#userlog-search').val('');
}

function userlog_search() {
	$('#userlog-search').submit();
}

function userlog_save() {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/save/?back=0');
	$('#userloglistform').submit();
}

function userlog_delete() {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/delete/');
	$('#userloglistform').submit();
}

function userlog_copy() {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/copy/');
	$('#userloglistform').submit();
}

function userlog_approve() {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/approve/');
	$('#userloglistform').submit();
}

function userlog_batchedit() {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/batchedit/');
	$('#userloglistform').submit();
}

function userlog_update(col, val) {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/bulkupdate/' + col + '/' + val);
	$('#userloglistform').submit();
}

function userlog_dupdate(col, val) {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/bulkdupdate/' + col + '/' + val);
	$('#userloglistform').submit();
}

function userlog_customaction(controller, action) {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userloglistform').submit();
}

function userlog_filter(col, val) {
	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/filter/' + col + '/' + val);
	$('#userloglistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userlog_<{$item->ACTION}>() {
        	$('#userloglistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userlog/<{$item->ACTION}>/');
        	$('#userloglistform').submit();
		}
	<{/if}>
<{/foreach}>

function userlog_checkall(checked) {
	$('#userloglist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userloglist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userloglist .top-holder').show();

		$('#userloglist .top-holder .selectall').show();
		$('#userloglist .top-holder .clearselection').hide();
	} else {
		$('#userloglist .top-holder').hide();

	    document.userloglist.userloglist_selection_selectall.value = 0;
	}
}

function userlog_selectall() {
	userlog_checkall(true);

    document.userloglist.userloglist_selection_selectall.value = 1;

	$('#userloglist .top-holder .selectall').hide();
	$('#userloglist .top-holder .clearselection').show();
}

function userlog_clearselection() {
	userlog_checkall(false);

    document.userloglist.userloglist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userlog.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userlog/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userlog-pagination-from"><{$limit_from}>-<span class="userlog-pagination-to"><{$limit_to}></span> of <span class="userlog-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userlog/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="userlog-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userlog-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userlog-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userloglistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userloglistform :focusable:first').focus();
        }

    	$('#userloglistform').click(function(){
    	    var focused = $('#userloglistform :focus');

    	    if (focused.length == 0) {
                $('#userloglistform :focusable:first').focus();
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
