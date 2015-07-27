<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="fieldform" id="fieldform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/field/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="field_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="field_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="field_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="field_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="field_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Field name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>field_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="field_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="field_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`field_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>field_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['COLUMN'])}>
    
        <{if $preset == 'COLUMN'}>
            <input type="hidden" class="input-column" name="field_formdata_COLUMN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COLUMN']) && !$acleditablecolumns['COLUMN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COLUMN'])}>
            <input type="hidden" class="input-column" name="field_formdata_COLUMN" value="<{$details->COLUMN}>" />
        <{else}>
    		<td class="form-row form-row-column form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Column')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-column form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-column">
                                            

    <input class="input-column input-type-text" type="text" name="<{$prefix}>field_formdata_COLUMN" value="<{$details->COLUMN|escape}>"  />
                        <{if $columntooltips.COLUMN}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.COLUMN}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TOOLTIP'])}>
    
        <{if $preset == 'TOOLTIP'}>
            <input type="hidden" class="input-tooltip" name="field_formdata_TOOLTIP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TOOLTIP']) && !$acleditablecolumns['TOOLTIP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TOOLTIP'])}>
            <input type="hidden" class="input-tooltip" name="field_formdata_TOOLTIP" value="<{$details->TOOLTIP}>" />
        <{else}>
    		<td class="form-row form-row-tooltip">
                <div class="form-field form-field-label">
        		    <label><{_t('Tooltip')}></label>
                </div>
            </td>
            <td class="form-row form-row-tooltip" colspan="3">
                <div class="form-field form-field-value column-tooltip">
                                            

    <input class="input-tooltip input-type-text" type="text" name="<{$prefix}>field_formdata_TOOLTIP" value="<{$details->TOOLTIP|escape}>"  />
                        <{if $columntooltips.TOOLTIP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TOOLTIP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_EXCLUDED'])}>
    
        <{if $preset == 'IS_EXCLUDED'}>
            <input type="hidden" class="input-is-excluded" name="field_formdata_IS_EXCLUDED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_EXCLUDED']) && !$acleditablecolumns['IS_EXCLUDED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_EXCLUDED'])}>
            <input type="hidden" class="input-is-excluded" name="field_formdata_IS_EXCLUDED" value="<{$details->IS_EXCLUDED}>" />
        <{else}>
    		<td class="form-row form-row-is-excluded">
                <div class="form-field form-field-label">
        		    <label><{_t('Excluded?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-excluded" colspan="3">
                <div class="form-field form-field-value column-is-excluded">
                                            

    <span class="input-type-radio"><input class="input-is-excluded" type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="1" <{if $details->IS_EXCLUDED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="0" <{if !$details->IS_EXCLUDED}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_EXCLUDED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_EXCLUDED}>"></i>
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

        <{plugin key="field_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#fieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#fieldform :input').change(function() {
        $('#fieldform').data('changed', true);
    });

        function saveDraft() {
        if ($('#fieldform').length) {
            if ($('#fieldform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/field/savedraft/",
                    data: $('#fieldform').serialize()
                });

                $('#fieldform').data('changed', false);
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
    field_get_editing_model = function () {
        var model = {};

        var formdata = $('#fieldform').find('[name*=field_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('field_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    field_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    field_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            field_apply_block_visibility(key, value);
        });
    }

    field_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    field_update_visibility_settings = function () {
        var model = field_get_editing_model();

        var settings = field_get_visibility_settings(model);

        field_apply_visibility_settings(settings);
    }

    $(function() {
        $('#fieldform :input').change(function() {
            field_update_visibility_settings();
        });

        field_update_visibility_settings();
    });
</script>