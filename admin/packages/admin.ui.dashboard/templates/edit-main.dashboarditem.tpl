<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="dashboarditemform" id="dashboarditemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/dashboarditem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="dashboarditem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="dashboarditem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="dashboarditem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="dashboarditem_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="dashboarditem_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Dashboard item title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-dashboard">
            
        
        
        
        <{if !isset($excludedcolumns['ID_DASHBOARD'])}>
    
        <{if $preset == 'ID_DASHBOARD'}>
            <input type="hidden" class="input-id-dashboard" name="dashboarditem_formdata_ID_DASHBOARD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_DASHBOARD']) && !$acleditablecolumns['ID_DASHBOARD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_DASHBOARD'])}>
            <input type="hidden" class="input-id-dashboard" name="dashboarditem_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Dashboard')}></label>
            </td>
            <td class="form-field form-field-value column-id-dashboard" colspan="3">
                                    
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-dashboard" class="input-id-dashboard" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD" value=$details->ID_DASHBOARD text=$details->reftext_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.dashboard.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-dashboard input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_DASHBOARD}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_DASHBOARD}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-image">
            
        
        
        
        <{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="dashboarditem_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="dashboarditem_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>dashboarditem_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>dashboarditem_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.dashboarditemform.<{$prefix}>dashboarditem_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>dashboarditem_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>dashboarditem_formdata_IMAGE" value="<{$details->IMAGE}>" />
                    <{if $columntooltips.IMAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-path">
            
        
        
        
        <{if !isset($excludedcolumns['PATH'])}>
    
        <{if $preset == 'PATH'}>
            <input type="hidden" class="input-path" name="dashboarditem_formdata_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PATH']) && !$acleditablecolumns['PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PATH'])}>
            <input type="hidden" class="input-path" name="dashboarditem_formdata_PATH" value="<{$details->PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Path')}></label>
            </td>
            <td class="form-field form-field-value column-path" colspan="3">
                                    

    <input class="input-path input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_PATH" value="<{$details->PATH|escape}>"  />
                    <{if $columntooltips.PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-dashboard-item-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_DASHBOARD_ITEM_TYPE'])}>
    
        <{if $preset == 'ID_DASHBOARD_ITEM_TYPE'}>
            <input type="hidden" class="input-id-dashboard-item-type" name="dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_DASHBOARD_ITEM_TYPE']) && !$acleditablecolumns['ID_DASHBOARD_ITEM_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_DASHBOARD_ITEM_TYPE'])}>
            <input type="hidden" class="input-id-dashboard-item-type" name="dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value="<{$details->ID_DASHBOARD_ITEM_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Dashboard item type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-dashboard-item-type" colspan="3">
                                    
            <{if Framework::hasModule('DashboardItemType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-dashboard-item-type" class="input-id-dashboard-item-type" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value=$details->ID_DASHBOARD_ITEM_TYPE text=$details->reftext_ID_DASHBOARD_ITEM_TYPE datasource="DASHBOARD_ITEM_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.dashboarditemtype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/new" title="Create a New Dashboard Item Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-dashboard-item-type input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value="<{$details->ID_DASHBOARD_ITEM_TYPE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_DASHBOARD_ITEM_TYPE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_DASHBOARD_ITEM_TYPE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
        
        
        
        <{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="dashboarditem_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="dashboarditem_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Ordering')}></label>
            </td>
            <td class="form-field form-field-value column-ordering" colspan="3">
                                    
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>dashboarditem_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                    <{if $columntooltips.ORDERING}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
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
        
        <{plugin key="dashboarditem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#dashboarditemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#dashboarditemform :input').change(function() {
        $('#dashboarditemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#dashboarditemform').length) {
            if ($('#dashboarditemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/savedraft/",
                    data: $('#dashboarditemform').serialize()
                });

                $('#dashboarditemform').data('changed', false);
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
    dashboarditem_get_editing_model = function () {
        var model = {};

        var formdata = $('#dashboarditemform').find('[name*=dashboarditem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('dashboarditem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    dashboarditem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    dashboarditem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            dashboarditem_apply_block_visibility(key, value);
        });
    }

    dashboarditem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    dashboarditem_update_visibility_settings = function () {
        var model = dashboarditem_get_editing_model();

        var settings = dashboarditem_get_visibility_settings(model);

        dashboarditem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#dashboarditemform :input').change(function() {
            dashboarditem_update_visibility_settings();
        });

        dashboarditem_update_visibility_settings();
    });
</script>