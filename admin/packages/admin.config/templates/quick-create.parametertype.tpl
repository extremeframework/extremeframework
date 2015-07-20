<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Parameter Type')|ucwords}></h3>
</div>


<div id="parametertype-edit" class="edit_details">

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

    <form name="parametertypeform" id="parametertypeform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/parametertype/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="parametertype_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="parametertype_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="parametertype_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="parametertype_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="parametertype_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>parametertype_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['BASE_TYPE_CODE'])}>
    
        <{if $preset == 'BASE_TYPE_CODE'}>
            <input type="hidden" class="input-base-type-code" name="parametertype_formdata_BASE_TYPE_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['BASE_TYPE_CODE']) && !$acleditablecolumns['BASE_TYPE_CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['BASE_TYPE_CODE'])}>
            <input type="hidden" class="input-base-type-code" name="parametertype_formdata_BASE_TYPE_CODE" value="<{$details->BASE_TYPE_CODE}>" />
        <{else}>
    		<td class="form-row form-row-base-type-code">
                <div class="form-field form-field-label">
        		    <label><{_t('Base type code')}></label>
                </div>
            </td>
            <td class="form-row form-row-base-type-code" colspan="3">
                <div class="form-field form-field-value column-base-type-code">
                                            

    <input class="input-base-type-code input-type-text" type="text" name="<{$prefix}>parametertype_formdata_BASE_TYPE_CODE" value="<{$details->BASE_TYPE_CODE|escape}>"  />
                        <{if $columntooltips.BASE_TYPE_CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.BASE_TYPE_CODE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['EXTRA'])}>
    
        <{if $preset == 'EXTRA'}>
            <input type="hidden" class="input-extra" name="parametertype_formdata_EXTRA" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EXTRA']) && !$acleditablecolumns['EXTRA'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EXTRA'])}>
            <input type="hidden" class="input-extra" name="parametertype_formdata_EXTRA" value="<{$details->EXTRA}>" />
        <{else}>
    		<td class="form-row form-row-extra">
                <div class="form-field form-field-label">
        		    <label><{_t('Extra')}></label>
                </div>
            </td>
            <td class="form-row form-row-extra" colspan="3">
                <div class="form-field form-field-value column-extra">
                                            

    <input class="input-extra input-type-text" type="text" name="<{$prefix}>parametertype_formdata_EXTRA" value="<{$details->EXTRA|escape}>"  />
                        <{if $columntooltips.EXTRA}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.EXTRA}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="parametertype_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="parametertype_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>parametertype_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
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
                        <span><{_t('Additional information')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
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

        <{plugin key="parametertype_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#parametertypeform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#parametertypeform :input').change(function() {
        $('#parametertypeform').data('changed', true);
    });

        function saveDraft() {
        if ($('#parametertypeform').length) {
            if ($('#parametertypeform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/parametertype/savedraft/",
                    data: $('#parametertypeform').serialize()
                });

                $('#parametertypeform').data('changed', false);
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
    parametertype_get_editing_model = function () {
        var model = {};

        var formdata = $('#parametertypeform').find('[name*=parametertype_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('parametertype_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    parametertype_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    parametertype_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            parametertype_apply_block_visibility(key, value);
        });
    }

    parametertype_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    parametertype_update_visibility_settings = function () {
        var model = parametertype_get_editing_model();

        var settings = parametertype_get_visibility_settings(model);

        parametertype_apply_visibility_settings(settings);
    }

    $(function() {
        $('#parametertypeform :input').change(function() {
            parametertype_update_visibility_settings();
        });

        parametertype_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#parametertypeform', 'f2', 'a.button-save');
    	bind_hotkey('#parametertypeform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#parametertypeform', 'f3', 'a.button-save-more');
    	bind_hotkey('#parametertypeform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#parametertypeform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>