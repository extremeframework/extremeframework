

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="adminproductquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminproduct/search" method="get">
            <input type="text" name="adminproduct_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#adminproductquicksearch').submit(); return false;">
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
            $('#adminproductquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#adminproductquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.adminproduct.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.adminproduct.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('Admin Product', true)|strtolower}>"/><{_t('New')}> <{_t('Admin Product')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.adminproduct.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="adminproduct_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select multilingual="0" data-url="<{$smarty.const.APPLICATION_URL}>/adminproduct/customfilter/{id}" class="adminproduct-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="adminproduct" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer adminproduct-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/adminproduct"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons adminproduct-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.adminproduct-custom-filter', '.adminproduct-custom-filter-footer', '.adminproduct-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.adminproduct[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="adminproduct_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="adminproductlist" id="adminproductlistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminproduct/" method="post">
<input type="hidden" name="adminproductlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function adminproduct_reset() {
	$('input, select', '#adminproduct-search').val('');
}

function adminproduct_search() {
	$('#adminproduct-search').submit();
}

function adminproduct_save() {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/save/?back=0');
	$('#adminproductlistform').submit();
}

function adminproduct_delete() {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/delete/');
	$('#adminproductlistform').submit();
}

function adminproduct_copy() {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/copy/');
	$('#adminproductlistform').submit();
}

function adminproduct_approve() {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/approve/');
	$('#adminproductlistform').submit();
}

function adminproduct_batchedit() {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/batchedit/');
	$('#adminproductlistform').submit();
}

function adminproduct_update(col, val) {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/bulkupdate/' + col + '/' + val);
	$('#adminproductlistform').submit();
}

function adminproduct_dupdate(col, val) {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/bulkdupdate/' + col + '/' + val);
	$('#adminproductlistform').submit();
}

function adminproduct_customaction(controller, action) {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#adminproductlistform').submit();
}

function adminproduct_filter(col, val) {
	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/filter/' + col + '/' + val);
	$('#adminproductlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function adminproduct_<{$item->ACTION}>() {
        	$('#adminproductlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/adminproduct/<{$item->ACTION}>/');
        	$('#adminproductlistform').submit();
		}
	<{/if}>
<{/foreach}>

function adminproduct_checkall(checked) {
	$('#adminproductlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('adminproductlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#adminproductlist .top-holder').show();

		$('#adminproductlist .top-holder .selectall').show();
		$('#adminproductlist .top-holder .clearselection').hide();
	} else {
		$('#adminproductlist .top-holder').hide();

	    document.adminproductlist.adminproductlist_selection_selectall.value = 0;
	}
}

function adminproduct_selectall() {
	adminproduct_checkall(true);

    document.adminproductlist.adminproductlist_selection_selectall.value = 1;

	$('#adminproductlist .top-holder .selectall').hide();
	$('#adminproductlist .top-holder .clearselection').show();
}

function adminproduct_clearselection() {
	adminproduct_checkall(false);

    document.adminproductlist.adminproductlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.adminproduct.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="adminproduct-pagination-from"><{$limit_from}>-<span class="adminproduct-pagination-to"><{$limit_to}></span> of <span class="adminproduct-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#adminproductlistform', 'left', '.pagination-prev');
            	bind_hotkey('#adminproductlistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="adminproduct-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.adminproduct-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.adminproduct-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#adminproductlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#adminproductlistform :focusable:first').focus();
        }

    	$('#adminproductlistform').click(function(){
    	    var focused = $('#adminproductlistform :focus');

    	    if (focused.length == 0) {
                $('#adminproductlistform :focusable:first').focus();
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

