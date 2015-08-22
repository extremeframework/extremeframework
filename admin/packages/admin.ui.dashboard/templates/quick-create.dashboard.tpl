<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Dashboard')|ucwords}></h3>
</div>


<div id="dashboard-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="dashboardform" id="dashboardform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/dashboard/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="dashboard_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="dashboard_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="dashboard_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="dashboard_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="dashboard_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Dashboard name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>dashboard_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="dashboard_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="dashboard_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Dashboard title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>dashboard_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-subtitle">
            
        
        
        
        <{if !isset($excludedcolumns['SUBTITLE'])}>
    
        <{if $preset == 'SUBTITLE'}>
            <input type="hidden" class="input-subtitle" name="dashboard_formdata_SUBTITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SUBTITLE']) && !$acleditablecolumns['SUBTITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SUBTITLE'])}>
            <input type="hidden" class="input-subtitle" name="dashboard_formdata_SUBTITLE" value="<{$details->SUBTITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Subtitle')}></label>
            </td>
            <td class="form-field form-field-value column-subtitle" colspan="3">
                                    

    <input class="input-subtitle input-type-text" type="text" name="<{$prefix}>dashboard_formdata_SUBTITLE" value="<{$details->SUBTITLE|escape}>"  />
                    <{if $columntooltips.SUBTITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.SUBTITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-package">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_PACKAGE'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE'}>
            <input type="hidden" class="input-id-admin-package" name="dashboard_formdata_ID_ADMIN_PACKAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE']) && !$acleditablecolumns['ID_ADMIN_PACKAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE'])}>
            <input type="hidden" class="input-id-admin-package" name="dashboard_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin package')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-package" colspan="3">
                                    
            <{if Framework::hasModule('AdminPackage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package" class="input-id-admin-package" name="`$prefix`dashboard_formdata_ID_ADMIN_PACKAGE" value=$details->ID_ADMIN_PACKAGE text=$details->reftext_ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package input-type-text" type="text" name="<{$prefix}>dashboard_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_PACKAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-menu">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_MENU'])}>
    
        <{if $preset == 'ID_ADMIN_MENU'}>
            <input type="hidden" class="input-id-admin-menu" name="dashboard_formdata_ID_ADMIN_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_MENU']) && !$acleditablecolumns['ID_ADMIN_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_MENU'])}>
            <input type="hidden" class="input-id-admin-menu" name="dashboard_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin menu')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-menu" colspan="3">
                                    
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`dashboard_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmenu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>dashboard_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_MENU}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_MENU}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
    		<td>
                <div class="form-field form-field-label">
        		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                </div>
            </td>
            <td colspan="3">
                <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                    <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="dashboard_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#dashboardform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#dashboardform :input').change(function() {
        $('#dashboardform').data('changed', true);
    });

        function saveDraft() {
        if ($('#dashboardform').length) {
            if ($('#dashboardform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboard/savedraft/",
                    data: $('#dashboardform').serialize()
                });

                $('#dashboardform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    dashboard_get_editing_model = function () {
        var model = {};

        var formdata = $('#dashboardform').find('[name*=dashboard_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('dashboard_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    dashboard_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    dashboard_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            dashboard_apply_block_visibility(key, value);
        });
    }

    dashboard_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    dashboard_update_visibility_settings = function () {
        var model = dashboard_get_editing_model();

        var settings = dashboard_get_visibility_settings(model);

        dashboard_apply_visibility_settings(settings);
    }

    $(function() {
        $('#dashboardform :input').change(function() {
            dashboard_update_visibility_settings();
        });

        dashboard_update_visibility_settings();
    });
</script>                    </div>
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

    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
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