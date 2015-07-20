

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="menuitemquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/menuitem/search" method="get">
            <input type="text" name="menuitem_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#menuitemquicksearch').submit(); return false;">
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
            $('#menuitemquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#menuitemquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.menuitem.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.menuitem.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Menu Item', true)|strtolower}>"/><{_t('New')}> <{_t('Menu Item')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.menuitem.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="menuitem_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select data-url="<{$smarty.const.APPLICATION_URL}>/menuitem/customfilter/{id}" class="menuitem-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="menuitem" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer menuitem-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/menuitem"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons menuitem-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.menuitem-custom-filter', '.menuitem-custom-filter-footer', '.menuitem-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.menuitem[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="menuitem_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="menuitemlist" id="menuitemlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/menuitem/" method="post">
<input type="hidden" name="menuitemlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function menuitem_reset() {
	$('input, select', '#menuitem-search').val('');
}

function menuitem_search() {
	$('#menuitem-search').submit();
}

function menuitem_save() {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/save/?back=0');
	$('#menuitemlistform').submit();
}

function menuitem_delete() {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/delete/');
	$('#menuitemlistform').submit();
}

function menuitem_copy() {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/copy/');
	$('#menuitemlistform').submit();
}

function menuitem_approve() {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/approve/');
	$('#menuitemlistform').submit();
}

function menuitem_batchedit() {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/batchedit/');
	$('#menuitemlistform').submit();
}

function menuitem_update(col, val) {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/bulkupdate/' + col + '/' + val);
	$('#menuitemlistform').submit();
}

function menuitem_dupdate(col, val) {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/bulkdupdate/' + col + '/' + val);
	$('#menuitemlistform').submit();
}

function menuitem_customaction(controller, action) {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#menuitemlistform').submit();
}

function menuitem_filter(col, val) {
	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/filter/' + col + '/' + val);
	$('#menuitemlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function menuitem_<{$item->ACTION}>() {
        	$('#menuitemlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/menuitem/<{$item->ACTION}>/');
        	$('#menuitemlistform').submit();
		}
	<{/if}>
<{/foreach}>

function menuitem_checkall(checked) {
	$('#menuitemlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('menuitemlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#menuitemlist .top-holder').show();

		$('#menuitemlist .top-holder .selectall').show();
		$('#menuitemlist .top-holder .clearselection').hide();
	} else {
		$('#menuitemlist .top-holder').hide();

	    document.menuitemlist.menuitemlist_selection_selectall.value = 0;
	}
}

function menuitem_selectall() {
	menuitem_checkall(true);

    document.menuitemlist.menuitemlist_selection_selectall.value = 1;

	$('#menuitemlist .top-holder .selectall').hide();
	$('#menuitemlist .top-holder .clearselection').show();
}

function menuitem_clearselection() {
	menuitem_checkall(false);

    document.menuitemlist.menuitemlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.menuitem.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/menuitem/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="menuitem-pagination-from"><{$limit_from}>-<span class="menuitem-pagination-to"><{$limit_to}></span> of <span class="menuitem-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/menuitem/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#menuitemlistform', 'left', '.pagination-prev');
            	bind_hotkey('#menuitemlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="menuitem-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.menuitem-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.menuitem-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#menuitemlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#menuitemlistform :focusable:first').focus();
        }

    	$('#menuitemlistform').click(function(){
    	    var focused = $('#menuitemlistform :focus');

    	    if (focused.length == 0) {
                $('#menuitemlistform :focusable:first').focus();
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

