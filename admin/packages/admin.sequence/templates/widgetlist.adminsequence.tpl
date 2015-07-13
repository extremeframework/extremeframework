

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminsequencequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminsequence/search" method="get">
            <input type="text" name="adminsequence_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminsequencequicksearch').submit(); return false;">
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
            $('#adminsequencequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminsequencequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.adminsequence) }>
<{foreach from=$messages.adminsequence key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.adminsequence.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminsequence.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_ADMIN_SEQUENCE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_ADMIN_SEQUENCE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminsequence.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminsequence_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminsequence[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminsequence_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminsequencelist" id="adminsequencelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminsequence/" method="post">
<input type="hidden" name="adminsequencelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminsequence_reset() {
	$('input, select', '#adminsequence-search').val('');
}

function adminsequence_search() {
	$('#adminsequence-search').submit();
}

function adminsequence_save() {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/save/?back=0');
	$('#adminsequencelistform').submit();
}

function adminsequence_delete() {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/delete/');
	$('#adminsequencelistform').submit();
}

function adminsequence_copy() {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/copy/');
	$('#adminsequencelistform').submit();
}

function adminsequence_approve() {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/approve/');
	$('#adminsequencelistform').submit();
}

function adminsequence_batchedit() {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/batchedit/');
	$('#adminsequencelistform').submit();
}

function adminsequence_update(col, val) {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/bulkupdate/' + col + '/' + val);
	$('#adminsequencelistform').submit();
}

function adminsequence_dupdate(col, val) {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/bulkdupdate/' + col + '/' + val);
	$('#adminsequencelistform').submit();
}

function adminsequence_customaction(controller, action) {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminsequencelistform').submit();
}

function adminsequence_filter(col, val) {
	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/filter/' + col + '/' + val);
	$('#adminsequencelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminsequence_<{$item->ACTION}>() {
        	$('#adminsequencelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminsequence/<{$item->ACTION}>/');
        	$('#adminsequencelistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminsequence_checkall(checked) {
	$('#adminsequencelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminsequencelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminsequencelist .top-holder').show();

		$('#adminsequencelist .top-holder .selectall').show();
		$('#adminsequencelist .top-holder .clearselection').hide();
	} else {
		$('#adminsequencelist .top-holder').hide();

	    document.adminsequencelist.adminsequencelist_selection_selectall.value = 0;
	}
}

function adminsequence_selectall() {
	adminsequence_checkall(true);

    document.adminsequencelist.adminsequencelist_selection_selectall.value = 1;

	$('#adminsequencelist .top-holder .selectall').hide();
	$('#adminsequencelist .top-holder .clearselection').show();
}

function adminsequence_clearselection() {
	adminsequence_checkall(false);

    document.adminsequencelist.adminsequencelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminsequence.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminsequence-pagination-from"><{$limit_from}>-<span class="adminsequence-pagination-to"><{$limit_to}></span> of <span class="adminsequence-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminsequence/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminsequencelistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminsequencelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminsequence-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminsequence-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminsequence-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminsequencelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminsequencelistform :focusable:first').focus();
        }

    	$('#adminsequencelistform').click(function(){
    	    var focused = $('#adminsequencelistform :focus');

    	    if (focused.length == 0) {
                $('#adminsequencelistform :focusable:first').focus();
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

