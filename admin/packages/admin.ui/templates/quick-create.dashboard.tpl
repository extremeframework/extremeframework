<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_QUICK_CREATE" format="ucwords"}> <{$smarty.const.L_DASHBOARD|ucwords}></h3>
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
    <{if isset($messages.dashboard) }>
        <ul class="message">
            <{foreach from=$messages.dashboard key=field item=message}>
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
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="dashboard_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="dashboard_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_DASHBOARD_NAME"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>dashboard_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_MENU'])}>
    
        <{if $preset == 'ID_ADMIN_MENU'}>
            <input type="hidden" class="input-id-admin-menu" name="dashboard_formdata_ID_ADMIN_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_MENU']) && !$acleditablecolumns['ID_ADMIN_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_MENU'])}>
            <input type="hidden" class="input-id-admin-menu" name="dashboard_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-menu">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ADMIN_MENU"}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-menu" colspan="3">
                <div class="form-field form-field-value column-id-admin-menu">
                                            
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`dashboard_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>dashboard_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_MENU}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_MENU}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_DASHBOARD_LAYOUT'])}>
    
        <{if $preset == 'ID_DASHBOARD_LAYOUT'}>
            <input type="hidden" class="input-id-dashboard-layout" name="dashboard_formdata_ID_DASHBOARD_LAYOUT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_DASHBOARD_LAYOUT']) && !$acleditablecolumns['ID_DASHBOARD_LAYOUT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_DASHBOARD_LAYOUT'])}>
            <input type="hidden" class="input-id-dashboard-layout" name="dashboard_formdata_ID_DASHBOARD_LAYOUT" value="<{$details->ID_DASHBOARD_LAYOUT}>" />
        <{else}>
    		<td class="form-row form-row-id-dashboard-layout">
                <div class="form-field form-field-label">
        		    <label><{label key="L_DASHBOARD_LAYOUT"}></label>
                </div>
            </td>
            <td class="form-row form-row-id-dashboard-layout" colspan="3">
                <div class="form-field form-field-value column-id-dashboard-layout">
                                            

    <input class="input-id-dashboard-layout input-type-text" type="text" name="<{$prefix}>dashboard_formdata_ID_DASHBOARD_LAYOUT" value="<{$details->ID_DASHBOARD_LAYOUT|escape}>"  />
                        <{if $columntooltips.ID_DASHBOARD_LAYOUT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_DASHBOARD_LAYOUT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DASHBOARD_FILE_PATH'])}>
    
        <{if $preset == 'DASHBOARD_FILE_PATH'}>
            <input type="hidden" class="input-dashboard-file-path" name="dashboard_formdata_DASHBOARD_FILE_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DASHBOARD_FILE_PATH']) && !$acleditablecolumns['DASHBOARD_FILE_PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DASHBOARD_FILE_PATH'])}>
            <input type="hidden" class="input-dashboard-file-path" name="dashboard_formdata_DASHBOARD_FILE_PATH" value="<{$details->DASHBOARD_FILE_PATH}>" />
        <{else}>
    		<td class="form-row form-row-dashboard-file-path">
                <div class="form-field form-field-label">
        		    <label><{label key="L_DASHBOARD_FILE_PATH"}></label>
                </div>
            </td>
            <td class="form-row form-row-dashboard-file-path" colspan="3">
                <div class="form-field form-field-value column-dashboard-file-path">
                                            

    <input class="input-dashboard-file-path input-type-text" type="text" name="<{$prefix}>dashboard_formdata_DASHBOARD_FILE_PATH" value="<{$details->DASHBOARD_FILE_PATH|escape}>"  />
                        <{if $columntooltips.DASHBOARD_FILE_PATH}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DASHBOARD_FILE_PATH}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr>
                                		<td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                            <div class="form-field form-field-label">
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>" colspan="3">
                                            <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                                <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                            </div>
                                        </td>
                            		</tr>
                            	<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <{/if}>

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

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
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
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>