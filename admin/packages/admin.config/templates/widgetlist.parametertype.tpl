

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="parametertypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/parametertype/search" method="post" enctype="multipart/form-data">
            <input type="text" name="parametertype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#parametertypequicksearch').submit(); return false;">
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
            $('#parametertypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#parametertypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametertype"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.parametertype) }>
<{foreach from=$messages.parametertype key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="parametertypelist" id="parametertypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/parametertype/" method="post">

<input type="hidden" name="parametertypelist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.parametertype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.parametertype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/parametertype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_PARAMETER_TYPE')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_PARAMETER_TYPE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.parametertype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="parametertype_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.parametertype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="parametertype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function parametertype_reset() {
	$('input, select', '#parametertype-search').val('');
}

function parametertype_search() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/search/');
	$('#parametertypelistform').submit();
}

function parametertype_save() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/save/?back=0');
	$('#parametertypelistform').submit();
}

function parametertype_delete() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/delete/');
	$('#parametertypelistform').submit();
}

function parametertype_copy() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/copy/');
	$('#parametertypelistform').submit();
}

function parametertype_approve() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/approve/');
	$('#parametertypelistform').submit();
}

function parametertype_batchedit() {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/batchedit/');
	$('#parametertypelistform').submit();
}

function parametertype_update(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/bulkupdate/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

function parametertype_dupdate(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/bulkdupdate/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

function parametertype_customaction(controller, action) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#parametertypelistform').submit();
}

function parametertype_filter(col, val) {
	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/filter/' + col + '/' + val);
	$('#parametertypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function parametertype_<{$item->ACTION}>() {
        	$('#parametertypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parametertype/<{$item->ACTION}>/');
        	$('#parametertypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function parametertype_checkall(checked) {
	$('#parametertypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('parametertypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#parametertypelist .top-holder').show();

		$('#parametertypelist .top-holder .selectall').show();
		$('#parametertypelist .top-holder .clearselection').hide();
	} else {
		$('#parametertypelist .top-holder').hide();

	    document.parametertypelist.parametertypelist_selection_selectall.value = 0;
	}
}

function parametertype_selectall() {
	parametertype_checkall(true);

    document.parametertypelist.parametertypelist_selection_selectall.value = 1;

	$('#parametertypelist .top-holder .selectall').hide();
	$('#parametertypelist .top-holder .clearselection').show();
}

function parametertype_clearselection() {
	parametertype_checkall(false);

    document.parametertypelist.parametertypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.parametertype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="parametertype-pagination-from"><{$limit_from}>-<span class="parametertype-pagination-to"><{$limit_to}></span> of <span class="parametertype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/parametertype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#parametertypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#parametertypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="parametertype-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.parametertype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.parametertype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#parametertypelistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#parametertypelistform :focusable:first').focus();
        }

    	$('#parametertypelistform').click(function(){
    	    var focused = $('#parametertypelistform :focus');

    	    if (focused.length == 0) {
                $('#parametertypelistform :focusable:first').focus();
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

