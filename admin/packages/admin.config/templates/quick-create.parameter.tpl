<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Parameter')|ucwords}></h3>
</div>


<div id="parameter-edit" class="edit_details">

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

    <form name="parameterform" id="parameterform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/parameter/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="parameter_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
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
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="parameter_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="parameter_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Parameter name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>parameter_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-code form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Code')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
                                    <{if $details->ID && $details->CODE != ''}>
                        <input type="hidden" class="input-code" name="parameter_formdata_CODE" value="<{$details->CODE}>" />
                        
    <{$details->CODE|escape}>
                    <{else}>
                        

    <input class="input-code input-type-text" type="text" name="<{$prefix}>parameter_formdata_CODE" value="<{$details->CODE|escape}>"  />
                        <{if $columntooltips.CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                        <{/if}>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-parameter-group">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PARAMETER_GROUP'])}>
    
        <{if $preset == 'ID_PARAMETER_GROUP'}>
            <input type="hidden" class="input-id-parameter-group" name="parameter_formdata_ID_PARAMETER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PARAMETER_GROUP']) && !$acleditablecolumns['ID_PARAMETER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PARAMETER_GROUP'])}>
            <input type="hidden" class="input-id-parameter-group" name="parameter_formdata_ID_PARAMETER_GROUP" value="<{$details->ID_PARAMETER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Parameter group')}></label>
            </td>
            <td class="form-field form-field-value column-id-parameter-group" colspan="3">
                                    
            <{if Framework::hasModule('ParameterGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-parameter-group" class="input-id-parameter-group" name="`$prefix`parameter_formdata_ID_PARAMETER_GROUP" value=$details->ID_PARAMETER_GROUP text=$details->reftext_ID_PARAMETER_GROUP datasource="PARAMETER_GROUP" datasourcename="ParameterGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-parameter-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PARAMETER_TYPE'])}>
    
        <{if $preset == 'ID_PARAMETER_TYPE'}>
            <input type="hidden" class="input-id-parameter-type" name="parameter_formdata_ID_PARAMETER_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PARAMETER_TYPE']) && !$acleditablecolumns['ID_PARAMETER_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PARAMETER_TYPE'])}>
            <input type="hidden" class="input-id-parameter-type" name="parameter_formdata_ID_PARAMETER_TYPE" value="<{$details->ID_PARAMETER_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Parameter type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-parameter-type" colspan="3">
                                    
            <{if Framework::hasModule('ParameterType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-parameter-type" class="input-id-parameter-type" name="`$prefix`parameter_formdata_ID_PARAMETER_TYPE" value=$details->ID_PARAMETER_TYPE text=$details->reftext_ID_PARAMETER_TYPE datasource="PARAMETER_TYPE" datasourcename="ParameterType" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parameter/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#parameterform', 'f2', 'a.button-save');
    	bind_hotkey('#parameterform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#parameterform', 'f3', 'a.button-save-more');
    	bind_hotkey('#parameterform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#parameterform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>