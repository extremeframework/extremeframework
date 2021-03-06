<{include file="header.tpl"}>

</head>
<body class="module module-<{$module}>" id="<{$module}>">
<{assign var='title' value=_t('User Invitation')}>
<{include file="top.tpl"}>

<!-- Quick search -->
    <div class="quicksearch hidden-print">
        <form id="userinvitationquicksearch" class="form-quicksearch scope-list" action="<{$smarty.const.APPLICATION_URL}>/userinvitation/search" method="get">
            <input type="text" name="userinvitation_searchdata___QUICKSEARCH__" value="<{if isset($searchdata.__QUICKSEARCH__)}><{$searchdata.__QUICKSEARCH__}><{/if}>" size="25" placeholder="<{_t('Search', true)}>" />
	        <a class="button-quick-search" onclick="$('#userinvitationquicksearch').submit(); return false;">
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
            $('#userinvitationquicksearch input').keyup(function(){
                var input = $(this);

                delay(function(){
                    if (input.val() != latest) {
                        latest = input.val();
                        $('#userinvitationquicksearch').submit();
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
<{if isset($smarty.session.acl.userinvitation.new) }>
    <div id="sub-controls" class="hidden-print">
        <ul class="subtabs">
            <li class="">
            <div class="buttons">
                        	                		        <{if isset($smarty.session.acl.userinvitation.new) && !$readonly}>
            		        <div class="btn button-general">
            		            <a class="button-new scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/new/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-add.png" alt="<{_t('New', true)}> <{_t('User Invitation', true)|strtolower}>"/><{_t('New')}> <{_t('User Invitation')|strtolower}></span></a>
            		        </div>
                                    		        <{/if}>
        			                                <{if isset($additional_list_buttons) }>
            	    <{foreach from=$additional_list_buttons item=button}>
            		    <div class="btn button-general button-additional">
            		        <a class="button-<{$button.code}> scope-main" href="<{$button.link}>"><span class="button-face"><{$button.title}></span></a>
            		    </div>
            	    <{/foreach}>
        	    <{/if}>
                                                            <{if isset($smarty.session.acl.userinvitation.delete) && !$readonly}>
                                            <div class="btn button-general">
                            <a href="#" onclick="userinvitation_delete()"><span class="button-face"><{_t('Delete')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userinvitation.import)}>
                                            <div class="btn button-general">
                            <a class="button-import scope-main" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/import/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-import.png" alt="<{_t('Import', true)}>" /><{_t('Import')}></span></a>
                        </div>
                                            <{/if}>
                                                                                <{if isset($smarty.session.acl.userinvitation.export)}>
                                            <div class="btn button-general">
                            <a class="button-export" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/export/"><span class="button-face"><img class="button-icon" src="<{$smarty.const.APPLICATION_URL}>/images/button-icon-export.png" alt="<{_t('Export', true)}>" /><{_t('Export')}></span></a>
                        </div>
                                            <{/if}>
                                                                        <{if Framework::hasModule('AdminFilter')}>
                        <{if isset($smarty.session.acl.adminfilter.edit) }>
                            <div class="custom-filter">
                                <{html_ref_select multilingual="0" data-url="<{$smarty.const.APPLICATION_URL}>/userinvitation/customfilter/{id}" class="userinvitation-custom-filter" value="<{$filter->ID}>" datasource="ADMIN_FILTER" preset="MODULE" presetvalue="userinvitation" valuecol="UUID" textcol="NAME" sortcol="NAME"}>
                                <span class="custom-filter-footer userinvitation-custom-filter-footer hide">
                                    <hr>
                                    <ul>
                                    	<li><a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminfilter/new/preset/MODULE/presetvalue/userinvitation"><i class="fa fa-plus-circle"></i> <{_t('Create new filter')}></a></li>
                                    </ul>
                                </span>
                                <span class="custom-filter-icons userinvitation-custom-filter-icons pull-right" style="display:none">
                                    <i title="Delete" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/delete/{id}" class="fa fa-trash-o filter-option-icon pull-right"></i>
                                    <i title="Edit" data-url="<{$smarty.const.APPLICATION_URL}>/adminfilter/edit/{id}" class="fa fa-pencil filter-option-icon pull-right"></i>
                                </span>
                            </div>
                            <script type="text/javascript">
                                $(function() {
                                    FilterHelper.init('.userinvitation-custom-filter', '.userinvitation-custom-filter-footer', '.userinvitation-custom-filter-icons', '<i class="fa fa-filter" style="padding-right: 5px;color: gray;"></i>');
                                });
                            </script>
                        <{/if}>
                    <{/if}>
                                                <{if $admin_list_actions}>
            	    <div class="btn button-general dropdown" style="padding: 3px 6px 6px 5px;">
            	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);" title="<{_t('More', true)}>"><i class="fa fa-cog"></i>&nbsp;<i class="caret"></i></a>
            	        <ul class="dropdown-menu pull-right">
                            <{foreach from=$admin_list_actions item=item}>
                                <{if empty($item->ACL) || isset($smarty.session.acl.userinvitation[$item->ACL])}>
                                    <li><a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{/if}> <{if $item->LINK}>href="<{framework_report_link format=$item->LINK}>"<{/if}> <{if $item->ACTION}>onclick="userinvitation_<{$item->ACTION}>(); return false;"<{/if}>><span class="button-face"><{_t($item->TITLE)}></span></a></li>
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
<form name="userinvitationlist" id="userinvitationlistform" class="form-list scope-list" action="<{$smarty.const.APPLICATION_URL}>/userinvitation/" method="post">
<input type="hidden" name="userinvitationlist_selection_selectall" value="0" />

<div class="ajaxablelist">
<!--:listbodybegin:-->

<script type="text/javascript">
function userinvitation_reset() {
	$('input, select', '#userinvitation-search').val('');
}

function userinvitation_search() {
	$('#userinvitation-search').submit();
}

function userinvitation_save() {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/save/?back=0');
	$('#userinvitationlistform').submit();
}

function userinvitation_delete() {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/delete/');
	$('#userinvitationlistform').submit();
}

function userinvitation_copy() {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/copy/');
	$('#userinvitationlistform').submit();
}

function userinvitation_approve() {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/approve/');
	$('#userinvitationlistform').submit();
}

function userinvitation_batchedit() {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/batchedit/');
	$('#userinvitationlistform').submit();
}

function userinvitation_update(col, val) {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/bulkupdate/' + col + '/' + val);
	$('#userinvitationlistform').submit();
}

function userinvitation_dupdate(col, val) {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/bulkdupdate/' + col + '/' + val);
	$('#userinvitationlistform').submit();
}

function userinvitation_customaction(controller, action) {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/' + controller + '/' + action + '/');
	$('#userinvitationlistform').submit();
}

function userinvitation_filter(col, val) {
	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/filter/' + col + '/' + val);
	$('#userinvitationlistform').submit();
}

<{foreach from=$admin_list_actions item=item}>
	<{if $item->ACTION}>
		function userinvitation_<{$item->ACTION}>() {
        	$('#userinvitationlistform').attr('action', '<{$smarty.const.APPLICATION_URL}>/userinvitation/<{$item->ACTION}>/');
        	$('#userinvitationlistform').submit();
		}
	<{/if}>
<{/foreach}>

function userinvitation_checkall(checked) {
	$('#userinvitationlist thead input[type="checkbox"].checkall').attr('checked', checked);

    var elements = document.getElementsByName('userinvitationlist_selection[]');

    if (elements.length) {
        for (i = 0; i < elements.length; i++) {
            elements[i].checked = checked;

            $(elements[i]).change();
        }
    }

	if (checked) {
		$('#userinvitationlist .top-holder').show();

		$('#userinvitationlist .top-holder .selectall').show();
		$('#userinvitationlist .top-holder .clearselection').hide();
	} else {
		$('#userinvitationlist .top-holder').hide();

	    document.userinvitationlist.userinvitationlist_selection_selectall.value = 0;
	}
}

function userinvitation_selectall() {
	userinvitation_checkall(true);

    document.userinvitationlist.userinvitationlist_selection_selectall.value = 1;

	$('#userinvitationlist .top-holder .selectall').hide();
	$('#userinvitationlist .top-holder .clearselection').show();
}

function userinvitation_clearselection() {
	userinvitation_checkall(false);

    document.userinvitationlist.userinvitationlist_selection_selectall.value = 0;
}
</script>


<{if $customtemplate}>
    <{include file=$customtemplate}>
<{else}>
    <{include file="list-main.userinvitation.tpl"}>
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
	        <a class="pagination-limiter scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/limit/<{$item}>"><{$item}></a>
	    <{/if}>
	<{/foreach}>
	</div>

	<div class="pagination-count hidden-print" style="float:left">
		Showing <span class="userinvitation-pagination-from"><{$limit_from}>-<span class="userinvitation-pagination-to"><{$limit_to}></span> of <span class="userinvitation-list-count list-count"><{$total}></span>
	</div>

	<div class="pagination-pages hidden-print" style="text-align:center;">
    	<{assign var='counter' value='0'}>
    	<{foreach from=$pagination item=page}>
    	    <{if $counter}> | <{/if}>
    	    <{if $page->base}>
    	        <a class="pagination-pager <{$page->class}> scope-list" href="<{$smarty.const.APPLICATION_URL}>/userinvitation/page/<{$page->base}>"><{$page->text}></a>
    	    <{else}>
    	        <{$page->text}>
    	    <{/if}>
    	    <{assign var='counter' value='1'}>
    	<{/foreach}>
	</div>
	<div style="clear:both"></div>

    <{else}>
	<br>
	<div style="float:left">
		<span class="userinvitation-list-count list-count"><{$total}></span> <{_t('Records')}>
	</div>
	<div style="clear:both"></div>
<{/if}>

<script type="text/javascript">
    $(function() {
        <{if $total}>$('.userinvitation-badge-count').text('[' + <{$total}> + ']').show();<{/if}>
        <{if $total}>$('.userinvitation-list-count').text(<{$total}>).show();<{/if}>
    });

    $(function() {
    	bind_hotkey('#userinvitationlistform', 'f2', '.button-new');
    });

    $(function() {
    	$('body').attr('data-type', 'list');
    });

    $(function() {
        if (document.activeElement == document.body) {
    	    $('#userinvitationlistform :focusable:first').focus();
        }

    	$('#userinvitationlistform').click(function(){
    	    var focused = $('#userinvitationlistform :focus');

    	    if (focused.length == 0) {
                $('#userinvitationlistform :focusable:first').focus();
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

<{include file="footer.tpl"}>
