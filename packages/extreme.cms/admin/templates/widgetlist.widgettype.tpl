

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="widgettypequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/widgettype/search" method="get">
            <input type="text" name="widgettype_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#widgettypequicksearch').submit(); return false;">
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
            $('#widgettypequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#widgettypequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.widgettype.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.widgettype.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Widget Type', true)|strtolower}>"/><{_t('New')}> <{_t('Widget Type')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.widgettype.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="widgettype_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.widgettype[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="widgettype_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="widgettypelist" id="widgettypelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/widgettype/" method="post">
<input type="hidden" name="widgettypelist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function widgettype_reset() {
	$('input, select', '#widgettype-search').val('');
}

function widgettype_search() {
	$('#widgettype-search').submit();
}

function widgettype_save() {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/save/?back=0');
	$('#widgettypelistform').submit();
}

function widgettype_delete() {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/delete/');
	$('#widgettypelistform').submit();
}

function widgettype_copy() {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/copy/');
	$('#widgettypelistform').submit();
}

function widgettype_approve() {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/approve/');
	$('#widgettypelistform').submit();
}

function widgettype_batchedit() {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/batchedit/');
	$('#widgettypelistform').submit();
}

function widgettype_update(col, val) {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/bulkupdate/' + col + '/' + val);
	$('#widgettypelistform').submit();
}

function widgettype_dupdate(col, val) {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/bulkdupdate/' + col + '/' + val);
	$('#widgettypelistform').submit();
}

function widgettype_customaction(controller, action) {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#widgettypelistform').submit();
}

function widgettype_filter(col, val) {
	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/filter/' + col + '/' + val);
	$('#widgettypelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function widgettype_<{$item->ACTION}>() {
        	$('#widgettypelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/widgettype/<{$item->ACTION}>/');
        	$('#widgettypelistform').submit();
		}
	<{/if}>
<{/foreach}>

function widgettype_checkall(checked) {
	$('#widgettypelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('widgettypelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#widgettypelist .top-holder').show();

		$('#widgettypelist .top-holder .selectall').show();
		$('#widgettypelist .top-holder .clearselection').hide();
	} else {
		$('#widgettypelist .top-holder').hide();

	    document.widgettypelist.widgettypelist_selection_selectall.value = 0;
	}
}

function widgettype_selectall() {
	widgettype_checkall(true);

    document.widgettypelist.widgettypelist_selection_selectall.value = 1;

	$('#widgettypelist .top-holder .selectall').hide();
	$('#widgettypelist .top-holder .clearselection').show();
}

function widgettype_clearselection() {
	widgettype_checkall(false);

    document.widgettypelist.widgettypelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.widgettype.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgettype/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="widgettype-pagination-from"><{$limit_from}>-<span class="widgettype-pagination-to"><{$limit_to}></span> of <span class="widgettype-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/widgettype/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#widgettypelistform', 'left', '.pagination-prev');
            	bind_hotkey('#widgettypelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="widgettype-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.widgettype-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.widgettype-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#widgettypelistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#widgettypelistform :focusable:first').focus();
        }

    	$('#widgettypelistform').click(function(){
    	    var focused = $('#widgettypelistform :focus');

    	    if (focused.length == 0) {
                $('#widgettypelistform :focusable:first').focus();
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

