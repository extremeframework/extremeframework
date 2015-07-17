<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="screenfieldform" id="screenfieldform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/screenfield/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="screenfield_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="screenfield_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="screenfield_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_SCREEN'])}>
    
        <{if $preset == 'ID_SCREEN'}>
            <input type="hidden" class="input-id-screen" name="screenfield_formdata_ID_SCREEN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_SCREEN']) && !$acleditablecolumns['ID_SCREEN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_SCREEN'])}>
            <input type="hidden" class="input-id-screen" name="screenfield_formdata_ID_SCREEN" value="<{$details->ID_SCREEN}>" />
        <{else}>
    		<td class="form-row form-row-id-screen">
                <div class="form-field form-field-label">
        		    <label><{_t('L_SCREEN')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-screen" colspan="3">
                <div class="form-field form-field-value column-id-screen">
                                            
            <{if Framework::hasModule('Screen')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-screen" class="input-id-screen" name="`$prefix`screenfield_formdata_ID_SCREEN" value=$details->ID_SCREEN text=$details->reftext_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                </span>
                    <{else}>
            <input class="input-id-screen input-type-text" type="text" name="<{$prefix}>screenfield_formdata_ID_SCREEN" value="<{$details->ID_SCREEN|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_SCREEN}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_SCREEN}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="screenfield_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="screenfield_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TITLE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>screenfield_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="screenfield_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="screenfield_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CODE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="screenfield_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>screenfield_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_VALUE_TYPE'])}>
    
        <{if $preset == 'ID_VALUE_TYPE'}>
            <input type="hidden" class="input-id-value-type" name="screenfield_formdata_ID_VALUE_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_VALUE_TYPE']) && !$acleditablecolumns['ID_VALUE_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_VALUE_TYPE'])}>
            <input type="hidden" class="input-id-value-type" name="screenfield_formdata_ID_VALUE_TYPE" value="<{$details->ID_VALUE_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-value-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_VALUE_TYPE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-value-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-value-type">
                                            
            <{if Framework::hasModule('ValueType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-value-type" class="input-id-value-type" name="`$prefix`screenfield_formdata_ID_VALUE_TYPE" value=$details->ID_VALUE_TYPE text=$details->reftext_ID_VALUE_TYPE datasource="VALUE_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/new" title="Create a New Value Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-value-type input-type-text" type="text" name="<{$prefix}>screenfield_formdata_ID_VALUE_TYPE" value="<{$details->ID_VALUE_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_VALUE_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_VALUE_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DATASOURCE'])}>
    
        <{if $preset == 'DATASOURCE'}>
            <input type="hidden" class="input-datasource" name="screenfield_formdata_DATASOURCE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DATASOURCE']) && !$acleditablecolumns['DATASOURCE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DATASOURCE'])}>
            <input type="hidden" class="input-datasource" name="screenfield_formdata_DATASOURCE" value="<{$details->DATASOURCE}>" />
        <{else}>
    		<td class="form-row form-row-datasource">
                <div class="form-field form-field-label">
        		    <label><{_t('L_DATASOURCE')}></label>
                </div>
            </td>
            <td class="form-row form-row-datasource" colspan="3">
                <div class="form-field form-field-value column-datasource">
                                            

    <input class="input-datasource input-type-text" type="text" name="<{$prefix}>screenfield_formdata_DATASOURCE" value="<{$details->DATASOURCE|escape}>"  />
                        <{if $columntooltips.DATASOURCE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DATASOURCE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONDITION'])}>
    
        <{if $preset == 'CONDITION'}>
            <input type="hidden" class="input-condition" name="screenfield_formdata_CONDITION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONDITION']) && !$acleditablecolumns['CONDITION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONDITION'])}>
            <input type="hidden" class="input-condition" name="screenfield_formdata_CONDITION" value="<{$details->CONDITION}>" />
        <{else}>
    		<td class="form-row form-row-condition">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CONDITION')}></label>
                </div>
            </td>
            <td class="form-row form-row-condition" colspan="3">
                <div class="form-field form-field-value column-condition">
                                            

    <input class="input-condition input-type-text" type="text" name="<{$prefix}>screenfield_formdata_CONDITION" value="<{$details->CONDITION|escape}>"  />
                        <{if $columntooltips.CONDITION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONDITION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['VALUECOL'])}>
    
        <{if $preset == 'VALUECOL'}>
            <input type="hidden" class="input-valuecol" name="screenfield_formdata_VALUECOL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALUECOL']) && !$acleditablecolumns['VALUECOL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALUECOL'])}>
            <input type="hidden" class="input-valuecol" name="screenfield_formdata_VALUECOL" value="<{$details->VALUECOL}>" />
        <{else}>
    		<td class="form-row form-row-valuecol">
                <div class="form-field form-field-label">
        		    <label><{_t('L_VALUECOL')}></label>
                </div>
            </td>
            <td class="form-row form-row-valuecol" colspan="3">
                <div class="form-field form-field-value column-valuecol">
                                            

    <input class="input-valuecol input-type-text" type="text" name="<{$prefix}>screenfield_formdata_VALUECOL" value="<{$details->VALUECOL|escape}>"  />
                        <{if $columntooltips.VALUECOL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.VALUECOL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TEXTCOL'])}>
    
        <{if $preset == 'TEXTCOL'}>
            <input type="hidden" class="input-textcol" name="screenfield_formdata_TEXTCOL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TEXTCOL']) && !$acleditablecolumns['TEXTCOL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TEXTCOL'])}>
            <input type="hidden" class="input-textcol" name="screenfield_formdata_TEXTCOL" value="<{$details->TEXTCOL}>" />
        <{else}>
    		<td class="form-row form-row-textcol">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TEXTCOL')}></label>
                </div>
            </td>
            <td class="form-row form-row-textcol" colspan="3">
                <div class="form-field form-field-value column-textcol">
                                            

    <input class="input-textcol input-type-text" type="text" name="<{$prefix}>screenfield_formdata_TEXTCOL" value="<{$details->TEXTCOL|escape}>"  />
                        <{if $columntooltips.TEXTCOL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TEXTCOL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_MANDATORY'])}>
    
        <{if $preset == 'IS_MANDATORY'}>
            <input type="hidden" class="input-is-mandatory" name="screenfield_formdata_IS_MANDATORY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_MANDATORY']) && !$acleditablecolumns['IS_MANDATORY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_MANDATORY'])}>
            <input type="hidden" class="input-is-mandatory" name="screenfield_formdata_IS_MANDATORY" value="<{$details->IS_MANDATORY}>" />
        <{else}>
    		<td class="form-row form-row-is-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_MANDATORY')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-mandatory" colspan="3">
                <div class="form-field form-field-value column-is-mandatory">
                                            

    <span class="input-type-radio"><input class="input-is-mandatory" type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="1" <{if $details->IS_MANDATORY}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="0" <{if !$details->IS_MANDATORY}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_MANDATORY}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_MANDATORY}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="screenfield_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="screenfield_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ORDERING')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>screenfield_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
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

        <{plugin key="screenfield_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('screenfield_formdata_TITLE', 'screenfield_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#screenfieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#screenfieldform :input').change(function() {
        $('#screenfieldform').data('changed', true);
    });

        function saveDraft() {
        if ($('#screenfieldform').length) {
            if ($('#screenfieldform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/screenfield/savedraft/",
                    data: $('#screenfieldform').serialize()
                });

                $('#screenfieldform').data('changed', false);
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
    screenfield_get_editing_model = function () {
        var model = {};

        var formdata = $('#screenfieldform').find('[name*=screenfield_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('screenfield_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    screenfield_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    screenfield_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            screenfield_apply_block_visibility(key, value);
        });
    }

    screenfield_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    screenfield_update_visibility_settings = function () {
        var model = screenfield_get_editing_model();

        var settings = screenfield_get_visibility_settings(model);

        screenfield_apply_visibility_settings(settings);
    }

    $(function() {
        $('#screenfieldform :input').change(function() {
            screenfield_update_visibility_settings();
        });

        screenfield_update_visibility_settings();
    });
</script>