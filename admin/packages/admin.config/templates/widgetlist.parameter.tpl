

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="parameterquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/parameter/search" method="get">
            <input type="text" name="parameter_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#parameterquicksearch').submit(); return false;">
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
            $('#parameterquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#parameterquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.parameter.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.parameter.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Parameter', true)|strtolower}>"/><{_t('New')}> <{_t('Parameter')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.parameter.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="parameter_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.parameter[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="parameter_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="parameterlist" id="parameterlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/parameter/" method="post">
<input type="hidden" name="parameterlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function parameter_reset() {
	$('input, select', '#parameter-search').val('');
}

function parameter_search() {
	$('#parameter-search').submit();
}

function parameter_save() {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/save/?back=0');
	$('#parameterlistform').submit();
}

function parameter_delete() {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/delete/');
	$('#parameterlistform').submit();
}

function parameter_copy() {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/copy/');
	$('#parameterlistform').submit();
}

function parameter_approve() {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/approve/');
	$('#parameterlistform').submit();
}

function parameter_batchedit() {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/batchedit/');
	$('#parameterlistform').submit();
}

function parameter_update(col, val) {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/bulkupdate/' + col + '/' + val);
	$('#parameterlistform').submit();
}

function parameter_dupdate(col, val) {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/bulkdupdate/' + col + '/' + val);
	$('#parameterlistform').submit();
}

function parameter_customaction(controller, action) {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#parameterlistform').submit();
}

function parameter_filter(col, val) {
	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/filter/' + col + '/' + val);
	$('#parameterlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function parameter_<{$item->ACTION}>() {
        	$('#parameterlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/parameter/<{$item->ACTION}>/');
        	$('#parameterlistform').submit();
		}
	<{/if}>
<{/foreach}>

function parameter_checkall(checked) {
	$('#parameterlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('parameterlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#parameterlist .top-holder').show();

		$('#parameterlist .top-holder .selectall').show();
		$('#parameterlist .top-holder .clearselection').hide();
	} else {
		$('#parameterlist .top-holder').hide();

	    document.parameterlist.parameterlist_selection_selectall.value = 0;
	}
}

function parameter_selectall() {
	parameter_checkall(true);

    document.parameterlist.parameterlist_selection_selectall.value = 1;

	$('#parameterlist .top-holder .selectall').hide();
	$('#parameterlist .top-holder .clearselection').show();
}

function parameter_clearselection() {
	parameter_checkall(false);

    document.parameterlist.parameterlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.parameter.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/parameter/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="parameter-pagination-from"><{$limit_from}>-<span class="parameter-pagination-to"><{$limit_to}></span> of <span class="parameter-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/parameter/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#parameterlistform', 'left', '.pagination-prev');
            	bind_hotkey('#parameterlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="parameter-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.parameter-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.parameter-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#parameterlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#parameterlistform :focusable:first').focus();
        }

    	$('#parameterlistform').click(function(){
    	    var focused = $('#parameterlistform :focus');

    	    if (focused.length == 0) {
                $('#parameterlistform :focusable:first').focus();
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

