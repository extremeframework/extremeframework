

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="postrelationtypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/postrelationtype/search" method="get">
            <input type="text" name="postrelationtype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#postrelationtypequicksearch').submit(); return false;">
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
            $('#postrelationtypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#postrelationtypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.postrelationtype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.postrelationtype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Post Relation Type', true)|strtolower}>"/><{_t('New')}> <{_t('Post Relation Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.postrelationtype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="postrelationtype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.postrelationtype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="postrelationtype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="postrelationtypelist" id="postrelationtypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/postrelationtype/" method="post">
<input type="hidden" name="postrelationtypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function postrelationtype_reset() {
	$('input, select', '#postrelationtype-search').val('');
}

function postrelationtype_search() {
	$('#postrelationtype-search').submit();
}

function postrelationtype_save() {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/save/?back=0');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_delete() {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/delete/');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_copy() {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/copy/');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_approve() {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/approve/');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_batchedit() {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/batchedit/');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_update(col, val) {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/bulkupdate/' + col + '/' + val);
	$('#postrelationtypelistform').submit();
}

function postrelationtype_dupdate(col, val) {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/bulkdupdate/' + col + '/' + val);
	$('#postrelationtypelistform').submit();
}

function postrelationtype_customaction(controller, action) {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#postrelationtypelistform').submit();
}

function postrelationtype_filter(col, val) {
	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/filter/' + col + '/' + val);
	$('#postrelationtypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function postrelationtype_<{$item->ACTION}>() {
        	$('#postrelationtypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/postrelationtype/<{$item->ACTION}>/');
        	$('#postrelationtypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function postrelationtype_checkall(checked) {
	$('#postrelationtypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('postrelationtypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#postrelationtypelist .top-holder').show();

		$('#postrelationtypelist .top-holder .selectall').show();
		$('#postrelationtypelist .top-holder .clearselection').hide();
	} else {
		$('#postrelationtypelist .top-holder').hide();

	    document.postrelationtypelist.postrelationtypelist_selection_selectall.value = 0;
	}
}

function postrelationtype_selectall() {
	postrelationtype_checkall(true);

    document.postrelationtypelist.postrelationtypelist_selection_selectall.value = 1;

	$('#postrelationtypelist .top-holder .selectall').hide();
	$('#postrelationtypelist .top-holder .clearselection').show();
}

function postrelationtype_clearselection() {
	postrelationtype_checkall(false);

    document.postrelationtypelist.postrelationtypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.postrelationtype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="postrelationtype-pagination-from"><{$limit_from}>-<span class="postrelationtype-pagination-to"><{$limit_to}></span> of <span class="postrelationtype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/postrelationtype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#postrelationtypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#postrelationtypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="postrelationtype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.postrelationtype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.postrelationtype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#postrelationtypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#postrelationtypelistform :focusable:first').focus();
        }

    	$('#postrelationtypelistform').click(function(){
    	    var focused = $('#postrelationtypelistform :focus');

    	    if (focused.length == 0) {
                $('#postrelationtypelistform :focusable:first').focus();
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

