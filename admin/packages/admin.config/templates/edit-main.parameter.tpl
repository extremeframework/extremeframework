<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="parameterform" id="parameterform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/parameter/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="parameter_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="parameter_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="parameter_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="parameter_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="parameter_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>parameter_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Code')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>parameter_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PARAMETER_GROUP'])}>
    
        <{if $preset == 'ID_PARAMETER_GROUP'}>
            <input type="hidden" class="input-id-parameter-group" name="parameter_formdata_ID_PARAMETER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PARAMETER_GROUP']) && !$acleditablecolumns['ID_PARAMETER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PARAMETER_GROUP'])}>
            <input type="hidden" class="input-id-parameter-group" name="parameter_formdata_ID_PARAMETER_GROUP" value="<{$details->ID_PARAMETER_GROUP}>" />
        <{else}>
    		<td class="form-row form-row-id-parameter-group">
                <div class="form-field form-field-label">
        		    <label><{_t('Parameter group')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-parameter-group" colspan="3">
                <div class="form-field form-field-value column-id-parameter-group">
                                            
            <{if Framework::hasModule('ParameterGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-parameter-group" class="input-id-parameter-group" name="`$prefix`parameter_formdata_ID_PARAMETER_GROUP" value=$details->ID_PARAMETER_GROUP text=$details->reftext_ID_PARAMETER_GROUP datasource="PARAMETER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.parametergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/new" title="Create a New Parameter Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-parameter-group input-type-text" type="text" name="<{$prefix}>parameter_formdata_ID_PARAMETER_GROUP" value="<{$details->ID_PARAMETER_GROUP|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PARAMETER_GROUP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PARAMETER_GROUP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PARAMETER_TYPE'])}>
    
        <{if $preset == 'ID_PARAMETER_TYPE'}>
            <input type="hidden" class="input-id-parameter-type" name="parameter_formdata_ID_PARAMETER_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PARAMETER_TYPE']) && !$acleditablecolumns['ID_PARAMETER_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PARAMETER_TYPE'])}>
            <input type="hidden" class="input-id-parameter-type" name="parameter_formdata_ID_PARAMETER_TYPE" value="<{$details->ID_PARAMETER_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-parameter-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Parameter type')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-parameter-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-parameter-type">
                                            
            <{if Framework::hasModule('ParameterType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-parameter-type" class="input-id-parameter-type" name="`$prefix`parameter_formdata_ID_PARAMETER_TYPE" value=$details->ID_PARAMETER_TYPE text=$details->reftext_ID_PARAMETER_TYPE datasource="PARAMETER_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.parametertype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/new" title="Create a New Parameter Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-parameter-type input-type-text" type="text" name="<{$prefix}>parameter_formdata_ID_PARAMETER_TYPE" value="<{$details->ID_PARAMETER_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PARAMETER_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PARAMETER_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VALUE'])}>
    
        <{if $preset == 'VALUE'}>
            <input type="hidden" class="input-value" name="parameter_formdata_VALUE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALUE']) && !$acleditablecolumns['VALUE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALUE'])}>
            <input type="hidden" class="input-value" name="parameter_formdata_VALUE" value="<{$details->VALUE}>" />
        <{else}>
    		<td class="form-row form-row-value">
                <div class="form-field form-field-label">
        		    <label><{_t('Value')}></label>
                </div>
            </td>
            <td class="form-row form-row-value" colspan="3">
                <div class="form-field form-field-value column-value">
                                            

    <input class="input-value input-type-text" type="text" name="<{$prefix}>parameter_formdata_VALUE" value="<{$details->VALUE|escape}>"  />
                        <{if $columntooltips.VALUE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VALUE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DESCRIPTION'])}>
    
        <{if $preset == 'DESCRIPTION'}>
            <input type="hidden" class="input-description" name="parameter_formdata_DESCRIPTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DESCRIPTION']) && !$acleditablecolumns['DESCRIPTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DESCRIPTION'])}>
            <input type="hidden" class="input-description" name="parameter_formdata_DESCRIPTION" value="<{$details->DESCRIPTION}>" />
        <{else}>
    		<td class="form-row form-row-description">
                <div class="form-field form-field-label">
        		    <label><{_t('Description')}></label>
                </div>
            </td>
            <td class="form-row form-row-description" colspan="3">
                <div class="form-field form-field-value column-description">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>parameter_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>parameter_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                        <{if $columntooltips.DESCRIPTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DESCRIPTION}>"></i>
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

        <{plugin key="parameter_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('parameter_formdata_NAME', 'parameter_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#parameterform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#parameterform :input').change(function() {
        $('#parameterform').data('changed', true);
    });

        function saveDraft() {
        if ($('#parameterform').length) {
            if ($('#parameterform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/parameter/savedraft/",
                    data: $('#parameterform').serialize()
                });

                $('#parameterform').data('changed', false);
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
    parameter_get_editing_model = function () {
        var model = {};

        var formdata = $('#parameterform').find('[name*=parameter_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('parameter_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    parameter_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    parameter_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            parameter_apply_block_visibility(key, value);
        });
    }

    parameter_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    parameter_update_visibility_settings = function () {
        var model = parameter_get_editing_model();

        var settings = parameter_get_visibility_settings(model);

        parameter_apply_visibility_settings(settings);
    }

    $(function() {
        $('#parameterform :input').change(function() {
            parameter_update_visibility_settings();
        });

        parameter_update_visibility_settings();
    });
</script>