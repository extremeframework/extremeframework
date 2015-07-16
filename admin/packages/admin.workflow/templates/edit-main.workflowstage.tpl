<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="workflowstageform" id="workflowstageform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/workflowstage/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="workflowstage_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="workflowstage_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="workflowstage_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WORKFLOW'])}>
    
        <{if $preset == 'ID_WORKFLOW'}>
            <input type="hidden" class="input-id-workflow" name="workflowstage_formdata_ID_WORKFLOW" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WORKFLOW']) && !$acleditablecolumns['ID_WORKFLOW'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WORKFLOW'])}>
            <input type="hidden" class="input-id-workflow" name="workflowstage_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW}>" />
        <{else}>
    		<td class="form-row form-row-id-workflow">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WORKFLOW')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-workflow" colspan="3">
                <div class="form-field form-field-value column-id-workflow">
                                            
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`workflowstage_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                </span>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>workflowstage_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_WORKFLOW}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WORKFLOW}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="workflowstage_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="workflowstage_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WORKFLOW_STAGE_NAME')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>workflowstage_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="workflowstage_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="workflowstage_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CODE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="workflowstage_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>workflowstage_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_DEFAULT'])}>
    
        <{if $preset == 'IS_DEFAULT'}>
            <input type="hidden" class="input-is-default" name="workflowstage_formdata_IS_DEFAULT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_DEFAULT']) && !$acleditablecolumns['IS_DEFAULT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_DEFAULT'])}>
            <input type="hidden" class="input-is-default" name="workflowstage_formdata_IS_DEFAULT" value="<{$details->IS_DEFAULT}>" />
        <{else}>
    		<td class="form-row form-row-is-default">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_DEFAULT')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-default" colspan="3">
                <div class="form-field form-field-value column-is-default">
                                            

    <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="1" <{if $details->IS_DEFAULT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_DEFAULT" value="0" <{if !$details->IS_DEFAULT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_DEFAULT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_DEFAULT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_BINDING_OBJECT_EDITABLE'])}>
    
        <{if $preset == 'IS_BINDING_OBJECT_EDITABLE'}>
            <input type="hidden" class="input-is-binding-object-editable" name="workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_BINDING_OBJECT_EDITABLE']) && !$acleditablecolumns['IS_BINDING_OBJECT_EDITABLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_BINDING_OBJECT_EDITABLE'])}>
            <input type="hidden" class="input-is-binding-object-editable" name="workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="<{$details->IS_BINDING_OBJECT_EDITABLE}>" />
        <{else}>
    		<td class="form-row form-row-is-binding-object-editable">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_BINDING_OBJECT_EDITABLE')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-binding-object-editable" colspan="3">
                <div class="form-field form-field-value column-is-binding-object-editable">
                                            

    <span class="input-type-radio"><input class="input-is-binding-object-editable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="1" <{if $details->IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_EDITABLE" value="0" <{if !$details->IS_BINDING_OBJECT_EDITABLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_BINDING_OBJECT_EDITABLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_BINDING_OBJECT_EDITABLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_BINDING_OBJECT_DELETABLE'])}>
    
        <{if $preset == 'IS_BINDING_OBJECT_DELETABLE'}>
            <input type="hidden" class="input-is-binding-object-deletable" name="workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_BINDING_OBJECT_DELETABLE']) && !$acleditablecolumns['IS_BINDING_OBJECT_DELETABLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_BINDING_OBJECT_DELETABLE'])}>
            <input type="hidden" class="input-is-binding-object-deletable" name="workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="<{$details->IS_BINDING_OBJECT_DELETABLE}>" />
        <{else}>
    		<td class="form-row form-row-is-binding-object-deletable">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_BINDING_OBJECT_DELETABLE')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-binding-object-deletable" colspan="3">
                <div class="form-field form-field-value column-is-binding-object-deletable">
                                            

    <span class="input-type-radio"><input class="input-is-binding-object-deletable" type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="1" <{if $details->IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>workflowstage_formdata_IS_BINDING_OBJECT_DELETABLE" value="0" <{if !$details->IS_BINDING_OBJECT_DELETABLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_BINDING_OBJECT_DELETABLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_BINDING_OBJECT_DELETABLE}>"></i>
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

        <{plugin key="workflowstage_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('workflowstage_formdata_NAME', 'workflowstage_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#workflowstageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#workflowstageform :input').change(function() {
        $('#workflowstageform').data('changed', true);
    });

        function saveDraft() {
        if ($('#workflowstageform').length) {
            if ($('#workflowstageform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/workflowstage/savedraft/",
                    data: $('#workflowstageform').serialize()
                });

                $('#workflowstageform').data('changed', false);
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
    workflowstage_get_editing_model = function () {
        var model = {};

        var formdata = $('#workflowstageform').find('[name*=workflowstage_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('workflowstage_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    workflowstage_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    workflowstage_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            workflowstage_apply_block_visibility(key, value);
        });
    }

    workflowstage_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    workflowstage_update_visibility_settings = function () {
        var model = workflowstage_get_editing_model();

        var settings = workflowstage_get_visibility_settings(model);

        workflowstage_apply_visibility_settings(settings);
    }

    $(function() {
        $('#workflowstageform :input').change(function() {
            workflowstage_update_visibility_settings();
        });

        workflowstage_update_visibility_settings();
    });
</script>