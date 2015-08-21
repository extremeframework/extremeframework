<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Admin Menu Item')|ucwords}></h3>
</div>


<div id="adminmenuitem-edit" class="edit_details">

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

    <form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmenuitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmenuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmenuitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin menu item name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                
<tr class="form-row form-row-enable-left">
            
        
        
        
        <{if !isset($excludedcolumns['ENABLE_LEFT'])}>
    
        <{if $preset == 'ENABLE_LEFT'}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_LEFT']) && !$acleditablecolumns['ENABLE_LEFT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_LEFT'])}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$details->ENABLE_LEFT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enable left?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-left" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $details->ENABLE_LEFT}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$details->ENABLE_LEFT}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.ENABLE_LEFT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_LEFT}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-enable-top">
            
        
        
        
        <{if !isset($excludedcolumns['ENABLE_TOP'])}>
    
        <{if $preset == 'ENABLE_TOP'}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_TOP']) && !$acleditablecolumns['ENABLE_TOP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_TOP'])}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$details->ENABLE_TOP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enable top?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-top" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $details->ENABLE_TOP}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$details->ENABLE_TOP}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.ENABLE_TOP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_TOP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-enable-quick">
            
        
        
        
        <{if !isset($excludedcolumns['ENABLE_QUICK'])}>
    
        <{if $preset == 'ENABLE_QUICK'}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_QUICK']) && !$acleditablecolumns['ENABLE_QUICK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_QUICK'])}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$details->ENABLE_QUICK}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enable quick?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-quick" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $details->ENABLE_QUICK}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$details->ENABLE_QUICK}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.ENABLE_QUICK}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_QUICK}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-enable-all">
            
        
        
        
        <{if !isset($excludedcolumns['ENABLE_ALL'])}>
    
        <{if $preset == 'ENABLE_ALL'}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_ALL']) && !$acleditablecolumns['ENABLE_ALL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_ALL'])}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$details->ENABLE_ALL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enable all?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-all" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $details->ENABLE_ALL}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$details->ENABLE_ALL}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.ENABLE_ALL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_ALL}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-enable-settings">
            
        
        
        
        <{if !isset($excludedcolumns['ENABLE_SETTINGS'])}>
    
        <{if $preset == 'ENABLE_SETTINGS'}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_SETTINGS']) && !$acleditablecolumns['ENABLE_SETTINGS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_SETTINGS'])}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$details->ENABLE_SETTINGS}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enable settings?')}></label>
            </td>
            <td class="form-field form-field-value column-enable-settings" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $details->ENABLE_SETTINGS}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$details->ENABLE_SETTINGS}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.ENABLE_SETTINGS}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_SETTINGS}>"></i>
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
        
        <{plugin key="adminmenuitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmenuitemform :input').change(function() {
        $('#adminmenuitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmenuitemform').length) {
            if ($('#adminmenuitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/savedraft/",
                    data: $('#adminmenuitemform').serialize()
                });

                $('#adminmenuitemform').data('changed', false);
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
    adminmenuitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmenuitemform').find('[name*=adminmenuitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmenuitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmenuitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmenuitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmenuitem_apply_block_visibility(key, value);
        });
    }

    adminmenuitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmenuitem_update_visibility_settings = function () {
        var model = adminmenuitem_get_editing_model();

        var settings = adminmenuitem_get_visibility_settings(model);

        adminmenuitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmenuitemform :input').change(function() {
            adminmenuitem_update_visibility_settings();
        });

        adminmenuitem_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuitemform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>