<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="optionform" id="optionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/option/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="option_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="option_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="option_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="option_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="option_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_OPTION_NAME')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>option_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="option_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="option_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CODE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="option_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>option_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VALUE'])}>
    
        <{if $preset == 'VALUE'}>
            <input type="hidden" class="input-value" name="option_formdata_VALUE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALUE']) && !$acleditablecolumns['VALUE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALUE'])}>
            <input type="hidden" class="input-value" name="option_formdata_VALUE" value="<{$details->VALUE}>" />
        <{else}>
    		<td class="form-row form-row-value">
                <div class="form-field form-field-label">
        		    <label><{_t('L_VALUE')}></label>
                </div>
            </td>
            <td class="form-row form-row-value" colspan="3">
                <div class="form-field form-field-value column-value">
                                            

    <input class="input-value input-type-text" type="text" name="<{$prefix}>option_formdata_VALUE" value="<{$details->VALUE|escape}>"  />
                        <{if $columntooltips.VALUE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VALUE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONTEXT'])}>
    
        <{if $preset == 'CONTEXT'}>
            <input type="hidden" class="input-context" name="option_formdata_CONTEXT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONTEXT']) && !$acleditablecolumns['CONTEXT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONTEXT'])}>
            <input type="hidden" class="input-context" name="option_formdata_CONTEXT" value="<{$details->CONTEXT}>" />
        <{else}>
    		<td class="form-row form-row-context">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CONTEXT')}></label>
                </div>
            </td>
            <td class="form-row form-row-context" colspan="3">
                <div class="form-field form-field-value column-context">
                                            

    <input class="input-context input-type-text" type="text" name="<{$prefix}>option_formdata_CONTEXT" value="<{$details->CONTEXT|escape}>"  />
                        <{if $columntooltips.CONTEXT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONTEXT}>"></i>
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
                        <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
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
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
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

        <{plugin key="option_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('option_formdata_NAME', 'option_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#optionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#optionform :input').change(function() {
        $('#optionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#optionform').length) {
            if ($('#optionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/option/savedraft/",
                    data: $('#optionform').serialize()
                });

                $('#optionform').data('changed', false);
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
    option_get_editing_model = function () {
        var model = {};

        var formdata = $('#optionform').find('[name*=option_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('option_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    option_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    option_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            option_apply_block_visibility(key, value);
        });
    }

    option_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    option_update_visibility_settings = function () {
        var model = option_get_editing_model();

        var settings = option_get_visibility_settings(model);

        option_apply_visibility_settings(settings);
    }

    $(function() {
        $('#optionform :input').change(function() {
            option_update_visibility_settings();
        });

        option_update_visibility_settings();
    });
</script>