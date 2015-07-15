

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="pagegalleryquicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagegallery/search" method="get">
            <input type="text" name="pagegallery_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH', true)}>" />
	        <a class="button-quick-search" onclick="$('#pagegalleryquicksearch').submit(); return false;">
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
            $('#pagegalleryquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#pagegalleryquicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagegallery"><i class="fa fa-refresh"></i></a>
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
<{if isset($smarty.session.acl.pagegallery.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.pagegallery.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW', true)}> <{_t('L_PAGE_GALLERY', true)|strtolower}>"/><{_t('L_NEW')}> <{_t('L_PAGE_GALLERY')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.pagegallery.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="pagegallery_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.pagegallery[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="pagegallery_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="pagegallerylist" id="pagegallerylistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/pagegallery/" method="post">
<input type="hidden" name="pagegallerylist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function pagegallery_reset() {
	$('input, select', '#pagegallery-search').val('');
}

function pagegallery_search() {
	$('#pagegallery-search').submit();
}

function pagegallery_save() {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/save/?back=0');
	$('#pagegallerylistform').submit();
}

function pagegallery_delete() {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/delete/');
	$('#pagegallerylistform').submit();
}

function pagegallery_copy() {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/copy/');
	$('#pagegallerylistform').submit();
}

function pagegallery_approve() {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/approve/');
	$('#pagegallerylistform').submit();
}

function pagegallery_batchedit() {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/batchedit/');
	$('#pagegallerylistform').submit();
}

function pagegallery_update(col, val) {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/bulkupdate/' + col + '/' + val);
	$('#pagegallerylistform').submit();
}

function pagegallery_dupdate(col, val) {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/bulkdupdate/' + col + '/' + val);
	$('#pagegallerylistform').submit();
}

function pagegallery_customaction(controller, action) {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#pagegallerylistform').submit();
}

function pagegallery_filter(col, val) {
	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/filter/' + col + '/' + val);
	$('#pagegallerylistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function pagegallery_<{$item->ACTION}>() {
        	$('#pagegallerylistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/pagegallery/<{$item->ACTION}>/');
        	$('#pagegallerylistform').submit();
		}
	<{/if}>
<{/foreach}>

function pagegallery_checkall(checked) {
	$('#pagegallerylist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('pagegallerylist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#pagegallerylist .top-holder').show();

		$('#pagegallerylist .top-holder .selectall').show();
		$('#pagegallerylist .top-holder .clearselection').hide();
	} else {
		$('#pagegallerylist .top-holder').hide();

	    document.pagegallerylist.pagegallerylist_selection_selectall.value = 0;
	}
}

function pagegallery_selectall() {
	pagegallery_checkall(true);

    document.pagegallerylist.pagegallerylist_selection_selectall.value = 1;

	$('#pagegallerylist .top-holder .selectall').hide();
	$('#pagegallerylist .top-holder .clearselection').show();
}

function pagegallery_clearselection() {
	pagegallery_checkall(false);

    document.pagegallerylist.pagegallerylist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.pagegallery.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="pagegallery-pagination-from"><{$limit_from}>-<span class="pagegallery-pagination-to"><{$limit_to}></span> of <span class="pagegallery-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#pagegallerylistform', 'left', '.pagination-prev');
            	bind_hotkey('#pagegallerylistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="pagegallery-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.pagegallery-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.pagegallery-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#pagegallerylistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#pagegallerylistform :focusable:first').focus();
        }

    	$('#pagegallerylistform').click(function(){
    	    var focused = $('#pagegallerylistform :focus');

    	    if (focused.length == 0) {
                $('#pagegallerylistform :focusable:first').focus();
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

