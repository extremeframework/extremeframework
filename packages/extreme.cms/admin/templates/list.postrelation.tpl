<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('L_POST_RELATION')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="postrelationquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/postrelation/search" method="post" enctype="multipart/form-data">
            <input type="text" name="postrelation_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#postrelationquicksearch').submit(); return false;">
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
            $('#postrelationquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#postrelationquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.postrelation) }>
<{foreach from=$messages.postrelation key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="postrelationlist" id="postrelationlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/postrelation/" method="post">

<input type="hidden" name="postrelationlist_selection_selectall" value="0" />

<!-- Filters -->
    
<!-- Control buttons -->
<{if isset($smarty.session.acl.postrelation.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.postrelation.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_POST_RELATION')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_POST_RELATION')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.postrelation.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="postrelation_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postrelation.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/postrelation/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('L_IMPORT')}>" /><{_t('L_IMPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.postrelation.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/postrelation/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('L_EXPORT')}>" /><{_t('L_EXPORT')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.postrelation[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="postrelation_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function postrelation_reset() {
	$('input, select', '#postrelation-search').val('');
}

function postrelation_search() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/search/');
	$('#postrelationlistform').submit();
}

function postrelation_save() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/save/?back=0');
	$('#postrelationlistform').submit();
}

function postrelation_delete() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/delete/');
	$('#postrelationlistform').submit();
}

function postrelation_copy() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/copy/');
	$('#postrelationlistform').submit();
}

function postrelation_approve() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/approve/');
	$('#postrelationlistform').submit();
}

function postrelation_batchedit() {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/batchedit/');
	$('#postrelationlistform').submit();
}

function postrelation_update(col, val) {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/bulkupdate/' + col + '/' + val);
	$('#postrelationlistform').submit();
}

function postrelation_dupdate(col, val) {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/bulkdupdate/' + col + '/' + val);
	$('#postrelationlistform').submit();
}

function postrelation_customaction(controller, action) {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#postrelationlistform').submit();
}

function postrelation_filter(col, val) {
	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/filter/' + col + '/' + val);
	$('#postrelationlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function postrelation_<{$item->ACTION}>() {
        	$('#postrelationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelation/<{$item->ACTION}>/');
        	$('#postrelationlistform').submit();
		}
	<{/if}>
<{/foreach}>

function postrelation_checkall(checked) {
	$('#postrelationlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('postrelationlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#postrelationlist .top-holder').show();

		$('#postrelationlist .top-holder .selectall').show();
		$('#postrelationlist .top-holder .clearselection').hide();
	} else {
		$('#postrelationlist .top-holder').hide();

	    document.postrelationlist.postrelationlist_selection_selectall.value = 0;
	}
}

function postrelation_selectall() {
	postrelation_checkall(true);

    document.postrelationlist.postrelationlist_selection_selectall.value = 1;

	$('#postrelationlist .top-holder .selectall').hide();
	$('#postrelationlist .top-holder .clearselection').show();
}

function postrelation_clearselection() {
	postrelation_checkall(false);

    document.postrelationlist.postrelationlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.postrelation.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelation/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="postrelation-pagination-from"><{$limit_from}>-<span class="postrelation-pagination-to"><{$limit_to}></span> of <span class="postrelation-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelation/page/<{$page->base}>"><{$page->text}></a>
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
		<span class="postrelation-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.postrelation-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.postrelation-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#postrelationlistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postrelationlistform :focusable:first').focus();
        }

    	$('#postrelationlistform').click(function(){
    	    var focused = $('#postrelationlistform :focus');

    	    if (focused.length == 0) {
                $('#postrelationlistform :focusable:first').focus();
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
