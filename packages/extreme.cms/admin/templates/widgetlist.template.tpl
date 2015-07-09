

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="templatequicksearch" class="form-quicksearch scope-main" action="<{$smarty.const.APPLICATION_URL}>/template/search" method="post" enctype="multipart/form-data">
            <input type="text" name="template_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('L_SEARCH')}>" />
	        <a class="button-quick-search" onclick="$('#templatequicksearch').submit(); return false;">
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
            $('#templatequicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#templatequicksearch').submit();
                    }
                }, 300 );
            });
        });
    </script>

<{if isset($title) }>
    <h1 class="heading">
        <span class="h"><{$title}></span>

        <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
            <a style="text-decoration: none" class="button-view-refresh scope-main" href="<{$smarty.const.APPLICATION_URL}>/template"><i class="fa fa-refresh"></i></a>
        </span>
    </h1>
<{/if}>

<{if isset($messages.template) }>
<{foreach from=$messages.template key=ignored item=message}>
<li><{$message}></li>
<{/foreach}>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="templatelist" id="templatelistform" class="form-list scope-main" action="<{$smarty.const.APPLICATION_URL}>/template/" method="post">

<input type="hidden" name="templatelist_selection_selectall" value="0" />

<!-- Filters -->

<!-- Control buttons -->
<{if isset($smarty.session.acl.template.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.template.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main" href="<{$smarty.const.APPLICATION_URL}>/template/new/<{if isset($preset) && isset($presetvalue)}>preset/<{$preset}>/presetvalue/<{$presetvalue}><{/if}><{if isset($presetstring)}>?<{$presetstring}><{/if}>"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('L_NEW')}> <{_t('L_TEMPLATE')|strtolower}>"/><{_t('L_NEW')}> <{_t('L_TEMPLATE')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.template.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="template_delete()"><span class="button-face"><{_t('L_DELETE')}></span></a>
                        </div>
                                            <{/if}>
                                                                                    <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.template[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="template_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
function template_reset() {
	$('input, select', '#template-search').val('');
}

function template_search() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/search/');
	$('#templatelistform').submit();
}

function template_save() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/save/?back=0');
	$('#templatelistform').submit();
}

function template_delete() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/delete/');
	$('#templatelistform').submit();
}

function template_copy() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/copy/');
	$('#templatelistform').submit();
}

function template_approve() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/approve/');
	$('#templatelistform').submit();
}

function template_batchedit() {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/batchedit/');
	$('#templatelistform').submit();
}

function template_update(col, val) {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/bulkupdate/' + col + '/' + val);
	$('#templatelistform').submit();
}

function template_dupdate(col, val) {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/bulkdupdate/' + col + '/' + val);
	$('#templatelistform').submit();
}

function template_customaction(controller, action) {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#templatelistform').submit();
}

function template_filter(col, val) {
	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/filter/' + col + '/' + val);
	$('#templatelistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function template_<{$item->ACTION}>() {
        	$('#templatelistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/template/<{$item->ACTION}>/');
        	$('#templatelistform').submit();
		}
	<{/if}>
<{/foreach}>

function template_checkall(checked) {
	$('#templatelist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('templatelist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#templatelist .top-holder').show();

		$('#templatelist .top-holder .selectall').show();
		$('#templatelist .top-holder .clearselection').hide();
	} else {
		$('#templatelist .top-holder').hide();

	    document.templatelist.templatelist_selection_selectall.value = 0;
	}
}

function template_selectall() {
	template_checkall(true);

    document.templatelist.templatelist_selection_selectall.value = 1;

	$('#templatelist .top-holder .selectall').hide();
	$('#templatelist .top-holder .clearselection').show();
}

function template_clearselection() {
	template_checkall(false);

    document.templatelist.templatelist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.template.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/template/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="template-pagination-from"><{$limit_from}>-<span class="template-pagination-to"><{$limit_to}></span> of <span class="template-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/template/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

            <script type="text/javascript">
            $(function() {
            	bind_hotkey('#templatelistform', 'left', '.pagination-prev');
            	bind_hotkey('#templatelistform', 'right', '.pagination-next');
            });
        </script>
    <{else}>
	<br>
	<div style="float:left">
		<span class="template-list-count list-count"><{$total}></span> <{_t('L_RECORDS')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.template-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.template-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#templatelistform', 'f2', '.button-new');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#templatelistform :focusable:first').focus();
        }

    	$('#templatelistform').click(function(){
    	    var focused = $('#templatelistform :focus');

    	    if (focused.length == 0) {
                $('#templatelistform :focusable:first').focus();
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

