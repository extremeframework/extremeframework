

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="valuetypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/valuetype/search" method="get">
            <input type="text" name="valuetype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#valuetypequicksearch').submit(); return false;">
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
            $('#valuetypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#valuetypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.valuetype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.valuetype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_VALUE_TYPE', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_VALUE_TYPE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.valuetype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="valuetype_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.valuetype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="valuetype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="valuetypelist" id="valuetypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/valuetype/" method="post">
<input type="hidden" name="valuetypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function valuetype_reset() {
	$('input, select', '#valuetype-search').val('');
}

function valuetype_search() {
	$('#valuetype-search').submit();
}

function valuetype_save() {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/save/?back=0');
	$('#valuetypelistform').submit();
}

function valuetype_delete() {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/delete/');
	$('#valuetypelistform').submit();
}

function valuetype_copy() {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/copy/');
	$('#valuetypelistform').submit();
}

function valuetype_approve() {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/approve/');
	$('#valuetypelistform').submit();
}

function valuetype_batchedit() {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/batchedit/');
	$('#valuetypelistform').submit();
}

function valuetype_update(col, val) {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/bulkupdate/' + col + '/' + val);
	$('#valuetypelistform').submit();
}

function valuetype_dupdate(col, val) {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/bulkdupdate/' + col + '/' + val);
	$('#valuetypelistform').submit();
}

function valuetype_customaction(controller, action) {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#valuetypelistform').submit();
}

function valuetype_filter(col, val) {
	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/filter/' + col + '/' + val);
	$('#valuetypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function valuetype_<{$item->ACTION}>() {
        	$('#valuetypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/valuetype/<{$item->ACTION}>/');
        	$('#valuetypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function valuetype_checkall(checked) {
	$('#valuetypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('valuetypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#valuetypelist .top-holder').show();

		$('#valuetypelist .top-holder .selectall').show();
		$('#valuetypelist .top-holder .clearselection').hide();
	} else {
		$('#valuetypelist .top-holder').hide();

	    document.valuetypelist.valuetypelist_selection_selectall.value = 0;
	}
}

function valuetype_selectall() {
	valuetype_checkall(true);

    document.valuetypelist.valuetypelist_selection_selectall.value = 1;

	$('#valuetypelist .top-holder .selectall').hide();
	$('#valuetypelist .top-holder .clearselection').show();
}

function valuetype_clearselection() {
	valuetype_checkall(false);

    document.valuetypelist.valuetypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.valuetype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/valuetype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="valuetype-pagination-from"><{$limit_from}>-<span class="valuetype-pagination-to"><{$limit_to}></span> of <span class="valuetype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/valuetype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#valuetypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#valuetypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="valuetype-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.valuetype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.valuetype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#valuetypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#valuetypelistform :focusable:first').focus();
        }

    	$('#valuetypelistform').click(function(){
    	    var focused = $('#valuetypelistform :focus');

    	    if (focused.length == 0) {
                $('#valuetypelistform :focusable:first').focus();
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
