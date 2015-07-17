

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminorderitemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorderitem/search" method="get">
            <input type="text" name="adminorderitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminorderitemquicksearch').submit(); return false;">
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
            $('#adminorderitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminorderitemquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminorderitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminorderitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('L_ADMIN_ORDER_ITEM', true)|strtolower}>"/><{_t('New')}> <{_t('L_ADMIN_ORDER_ITEM')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminorderitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminorderitem_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/adminorderitem/customfilter/{id}" class="adminorderitem-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="adminorderitem" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer adminorderitem-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/adminorderitem"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons adminorderitem-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.adminorderitem-custom-filter', '.adminorderitem-custom-filter-footer', '.adminorderitem-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminorderitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminorderitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminorderitemlist" id="adminorderitemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorderitem/" method="post">
<input type="hidden" name="adminorderitemlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminorderitem_reset() {
	$('input, select', '#adminorderitem-search').val('');
}

function adminorderitem_search() {
	$('#adminorderitem-search').submit();
}

function adminorderitem_save() {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/save/?back=0');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_delete() {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/delete/');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_copy() {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/copy/');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_approve() {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/approve/');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_batchedit() {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/batchedit/');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_update(col, val) {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/bulkupdate/' + col + '/' + val);
	$('#adminorderitemlistform').submit();
}

function adminorderitem_dupdate(col, val) {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/bulkdupdate/' + col + '/' + val);
	$('#adminorderitemlistform').submit();
}

function adminorderitem_customaction(controller, action) {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminorderitemlistform').submit();
}

function adminorderitem_filter(col, val) {
	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/filter/' + col + '/' + val);
	$('#adminorderitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminorderitem_<{$item->ACTION}>() {
        	$('#adminorderitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminorderitem/<{$item->ACTION}>/');
        	$('#adminorderitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminorderitem_checkall(checked) {
	$('#adminorderitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminorderitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminorderitemlist .top-holder').show();

		$('#adminorderitemlist .top-holder .selectall').show();
		$('#adminorderitemlist .top-holder .clearselection').hide();
	} else {
		$('#adminorderitemlist .top-holder').hide();

	    document.adminorderitemlist.adminorderitemlist_selection_selectall.value = 0;
	}
}

function adminorderitem_selectall() {
	adminorderitem_checkall(true);

    document.adminorderitemlist.adminorderitemlist_selection_selectall.value = 1;

	$('#adminorderitemlist .top-holder .selectall').hide();
	$('#adminorderitemlist .top-holder .clearselection').show();
}

function adminorderitem_clearselection() {
	adminorderitem_checkall(false);

    document.adminorderitemlist.adminorderitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminorderitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminorderitem-pagination-from"><{$limit_from}>-<span class="adminorderitem-pagination-to"><{$limit_to}></span> of <span class="adminorderitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminorderitemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminorderitemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminorderitem-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminorderitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminorderitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminorderitemlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminorderitemlistform :focusable:first').focus();
        }

    	$('#adminorderitemlistform').click(function(){
    	    var focused = $('#adminorderitemlistform :focus');

    	    if (focused.length == 0) {
                $('#adminorderitemlistform :focusable:first').focus();
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

