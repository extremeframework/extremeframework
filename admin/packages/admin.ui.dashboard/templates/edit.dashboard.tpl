<{assign var='meta_description' value=$details->NAME}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID}>
        <{$tmp1 = _t('Edit')}>
        <{$tmp2 = strtolower(_t('Dashboard'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{else}>
        <{$tmp1 = _t('New')}>
        <{$tmp2 = strtolower(_t('Dashboard'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{/if}>
<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}

function saveaddnew()
{
    $('#dashboardform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/saveaddnew/');
	$('#dashboardform').submit();
}

function saveclone()
{
    $('#dashboardform').attr('action', '<{$smarty.const.APPLICATION_URL}>/dashboard/saveclone/');
	$('#dashboardform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{ContextStack::getCurrentContext()}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="dashboard-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#dashboard-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/dashboard/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#dashboardform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="dashboard-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#dashboardform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.dashboard.tpl"}>
                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.dashboarditem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.usergroup) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.userpreference) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="dashboardtabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.dashboarditem) }>
                    <li><a href="#tab-dashboarditems"><{_t('Dashboard item')}> <span class="badge dashboarditem-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.usergroup) }>
                    <li><a href="#tab-usergroups"><{_t('User group')}> <span class="badge usergroup-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.userpreference) }>
                    <li><a href="#tab-userpreferences"><{_t('User preference')}> <span class="badge userpreference-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.dashboarditem) }>
                    <div id="tab-dashboarditems">
                    	<{if true || $tab == 'dashboarditems'}>
                        	<h2 class="print"><{_t('Dashboard item')}></h2>
                                                            <{ajaxmodule class="WidgetListDashboardItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_DASHBOARD="`$details->ID`" where=""  template='widgetlist.dashboarditem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.usergroup) }>
                    <div id="tab-usergroups">
                    	<{if true || $tab == 'usergroups'}>
                        	<h2 class="print"><{_t('User group')}></h2>
                                                            <{ajaxmodule class="WidgetListUserGroup" method="" readonly=!WorkflowHelper::isEditable($details->WFID) DEFAULT_ID_DASHBOARD="`$details->ID`" where=""  template='widgetlist.usergroup.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.userpreference) }>
                    <div id="tab-userpreferences">
                    	<{if true || $tab == 'userpreferences'}>
                        	<h2 class="print"><{_t('User preference')}></h2>
                                                            <{ajaxmodule class="WidgetListUserPreference" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_DASHBOARD="`$details->ID`" where=""  template='widgetlist.userpreference.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#dashboardtabs" ).tabs({
        		cookie: {
        			// store cookie for a day, without, it would be a session cookie
        			expires: 1
        		}
        	});
        });
        </script>
    <{/if}>

            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-bottom hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#dashboardform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#dashboardform', 'f2', 'a.button-save');
    	bind_hotkey('#dashboardform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#dashboardform', 'f3', 'a.button-save-more');
    	bind_hotkey('#dashboardform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#dashboardform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>
<script type="text/javascript">
    $(function() {
        LicenseHelper.init();
    });
</script>

<{include file="footer.tpl"}>