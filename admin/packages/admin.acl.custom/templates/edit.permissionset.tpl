<{assign var='meta_description' value=$details->NAME}>
<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}>" id="<{$module}>">
    <{if $details->UUID}>
        <{$tmp1 = _t('Edit')}>
        <{$tmp2 = strtolower(_t('Permission Set'))}>
        <{$title = "`$tmp1` `$tmp2`"}>
    <{else}>
        <{$tmp1 = _t('New')}>
        <{$tmp2 = strtolower(_t('Permission Set'))}>
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
    $('#permissionsetform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/saveaddnew/');
	$('#permissionsetform').submit();
}

function saveclone()
{
    $('#permissionsetform').attr('action', '<{$smarty.const.APPLICATION_URL}>/permissionset/saveclone/');
	$('#permissionsetform').submit();
}
</script>

<h1 class="heading">
    <span class="h"><{$title}></span>

    <span style="margin-left:10px; font-size:12px; font-weight: normal" class="hidden-print">
        <a style="text-decoration: none" class="button-edit-refresh scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/<{if $details->UUID}>edit/<{$details->UUID}><{else}>new<{/if}>"><i class="fa fa-refresh"></i></a>

        <{if $details->UUID}>
            <!-- Live search -->
            <span id="permissionset-live-search" class="live-search edit-live-search"><input type="text" onfocus="if (this.value == '<{_t('Quick search', true)}>...') {this.value = '';}" onblur="if (this.value == '')  {this.value = '<{_t('Quick search', true)}>...';}" value="<{_t('Quick search', true)}>..." autocomplete="off"></span>
            <script type="text/javascript">
                $(document).ready(function(){
                	$('#permissionset-live-search input').liveSearch({url: '<{$smarty.const.APPLICATION_URL}>/permissionset/liveSearch?mode=edit&term='});

            	    $('#jquery-live-search').hide();
            	    $('#permissionsetform:not(.filter) :input:visible:first').focus();
                });
            </script>
        <{/if}>
    </span>
</h1>


<div id="permissionset-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
            <!-- Control buttons -->
        <div class="edit-buttons edit-buttons-top hidden-print">
            <div class="button-general button-save btn btn-success">
                <a class="button-save" onclick="$('#permissionsetform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    <!-- Details -->
    <div class="section">
        <div>
                            <{include file="edit-main.permissionset.tpl"}>
                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminpackagepermission) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.customaccessright) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.permissionsetitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="permissionsettabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminpackagepermission) }>
                    <li><a href="#tab-adminpackagepermissions"><{_t('Admin package permission')}> <span class="badge adminpackagepermission-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.customaccessright) }>
                    <li><a href="#tab-customaccessrights"><{_t('Custom access right')}> <span class="badge customaccessright-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.permissionsetitem) }>
                    <li><a href="#tab-permissionsetitems"><{_t('Permission set item')}> <span class="badge permissionsetitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminpackagepermission) }>
                    <div id="tab-adminpackagepermissions">
                    	<{if true || $tab == 'adminpackagepermissions'}>
                        	<h2 class="print"><{_t('Admin package permission')}></h2>
                                                            <{ajaxmodule class="WidgetListAdminPackagePermission" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.adminpackagepermission.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.customaccessright) }>
                    <div id="tab-customaccessrights">
                    	<{if true || $tab == 'customaccessrights'}>
                        	<h2 class="print"><{_t('Custom access right')}></h2>
                                                            <{ajaxmodule class="WidgetListCustomAccessRight" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.customaccessright.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.permissionsetitem) }>
                    <div id="tab-permissionsetitems">
                    	<{if true || $tab == 'permissionsetitems'}>
                        	<h2 class="print"><{_t('Permission set item')}></h2>
                                                            <{ajaxmodule class="WidgetListPermissionSetItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.permissionsetitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#permissionsettabs" ).tabs({
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
                <a class="button-save" onclick="$('#permissionsetform').submit();return false;"><span class="button-face"><{_t('Save')}></span></a>
            </div>

                            <{if !$details->ID}>
                    <div class="button-general button-save button-save-more btn btn-success">
                        <a class="button-save-more" onclick="saveaddnew();return false;"><span class="button-face"><{_t('Add More')}></span></a>
                    </div>
                <{/if}>
            
            <{if $details->ID}>
                            <{/if}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/cancel/"><{_t('Cancel')}></a>
            <div class="clearer"></div>
        </div>
    
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#permissionsetform', 'f2', 'a.button-save');
    	bind_hotkey('#permissionsetform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#permissionsetform', 'f3', 'a.button-save-more');
    	bind_hotkey('#permissionsetform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#permissionsetform', 'esc', 'a.button-cancel');
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