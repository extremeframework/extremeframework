<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_POST_SECTION')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="postsectionquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/postsection/search" method="post" enctype="multipart/form-data">
            <input type="text" name="postsection_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#postsectionquicksearch').submit(); return false;">
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
            $('#postsectionquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#postsectionquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.postsection) }>
<{foreach from=$messages.postsection key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="postsectionlist" id="postsectionlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/postsection/" method="post">

<input type="hidden" name="postsectionlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.postsection.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.postsection.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_POST_SECTION', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_POST_SECTION')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.postsection.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="postsection_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postsection.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('L_IMPORT', true)}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postsection.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/postsection/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('L_EXPORT', true)}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.postsection[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="postsection_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function postsection_reset() {
	$('input, select', '#postsection-search').val('');
}

function postsection_search() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/search/');
	$('#postsectionlistform').submit();
}

function postsection_save() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/save/?back=0');
	$('#postsectionlistform').submit();
}

function postsection_delete() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/delete/');
	$('#postsectionlistform').submit();
}

function postsection_copy() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/copy/');
	$('#postsectionlistform').submit();
}

function postsection_approve() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/approve/');
	$('#postsectionlistform').submit();
}

function postsection_batchedit() {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/batchedit/');
	$('#postsectionlistform').submit();
}

function postsection_update(col, val) {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/bulkupdate/' + col + '/' + val);
	$('#postsectionlistform').submit();
}

function postsection_dupdate(col, val) {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/bulkdupdate/' + col + '/' + val);
	$('#postsectionlistform').submit();
}

function postsection_customaction(controller, action) {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#postsectionlistform').submit();
}

function postsection_filter(col, val) {
	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/filter/' + col + '/' + val);
	$('#postsectionlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function postsection_<{$item->ACTION}>() {
        	$('#postsectionlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postsection/<{$item->ACTION}>/');
        	$('#postsectionlistform').submit();
		}
	<{/if}>
<{/foreach}>

function postsection_checkall(checked) {
	$('#postsectionlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('postsectionlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#postsectionlist .top-holder').show();

		$('#postsectionlist .top-holder .selectall').show();
		$('#postsectionlist .top-holder .clearselection').hide();
	} else {
		$('#postsectionlist .top-holder').hide();

	    document.postsectionlist.postsectionlist_selection_selectall.value = 0;
	}
}

function postsection_selectall() {
	postsection_checkall(true);

    document.postsectionlist.postsectionlist_selection_selectall.value = 1;

	$('#postsectionlist .top-holder .selectall').hide();
	$('#postsectionlist .top-holder .clearselection').show();
}

function postsection_clearselection() {
	postsection_checkall(false);

    document.postsectionlist.postsectionlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.postsection.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="postsection-pagination-from"><{$limit_from}>-<span class="postsection-pagination-to"><{$limit_to}></span> of <span class="postsection-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/postsection/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="postsection-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.postsection-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.postsection-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#postsectionlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postsectionlistform :focusable:first').focus();
        }

    	$('#postsectionlistform').click(function(){
    	    var focused = $('#postsectionlistform :focus');

    	    if (focused.length == 0) {
                $('#postsectionlistform :focusable:first').focus();
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
