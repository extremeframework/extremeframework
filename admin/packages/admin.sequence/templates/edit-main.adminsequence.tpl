<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminsequenceform" id="adminsequenceform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminsequence/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminsequence_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminsequence_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminsequence_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminsequence_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminsequence_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminsequence_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SEQUENCE_FORMAT'])}>
    
        <{if $preset == 'SEQUENCE_FORMAT'}>
            <input type="hidden" class="input-sequence-format" name="adminsequence_formdata_SEQUENCE_FORMAT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SEQUENCE_FORMAT']) && !$acleditablecolumns['SEQUENCE_FORMAT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SEQUENCE_FORMAT'])}>
            <input type="hidden" class="input-sequence-format" name="adminsequence_formdata_SEQUENCE_FORMAT" value="<{$details->SEQUENCE_FORMAT}>" />
        <{else}>
    		<td class="form-row form-row-sequence-format">
                <div class="form-field form-field-label">
        		    <label><{_t('Sequence format')}></label>
                </div>
            </td>
            <td class="form-row form-row-sequence-format" colspan="3">
                <div class="form-field form-field-value column-sequence-format">
                                            

    <input class="input-sequence-format input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_FORMAT" value="<{$details->SEQUENCE_FORMAT|escape}>"  />
                        <{if $columntooltips.SEQUENCE_FORMAT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.SEQUENCE_FORMAT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CURRENT_VALUE'])}>
    
        <{if $preset == 'CURRENT_VALUE'}>
            <input type="hidden" class="input-current-value" name="adminsequence_formdata_CURRENT_VALUE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CURRENT_VALUE']) && !$acleditablecolumns['CURRENT_VALUE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CURRENT_VALUE'])}>
            <input type="hidden" class="input-current-value" name="adminsequence_formdata_CURRENT_VALUE" value="<{$details->CURRENT_VALUE}>" />
        <{else}>
    		<td class="form-row form-row-current-value">
                <div class="form-field form-field-label">
        		    <label><{_t('Current value')}></label>
                </div>
            </td>
            <td class="form-row form-row-current-value" colspan="3">
                <div class="form-field form-field-value column-current-value">
                                            

    <input class="input-current-value input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_CURRENT_VALUE" value="<{$details->CURRENT_VALUE|escape}>"  />
                        <{if $columntooltips.CURRENT_VALUE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CURRENT_VALUE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SEQUENCE_STEP'])}>
    
        <{if $preset == 'SEQUENCE_STEP'}>
            <input type="hidden" class="input-sequence-step" name="adminsequence_formdata_SEQUENCE_STEP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SEQUENCE_STEP']) && !$acleditablecolumns['SEQUENCE_STEP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SEQUENCE_STEP'])}>
            <input type="hidden" class="input-sequence-step" name="adminsequence_formdata_SEQUENCE_STEP" value="<{$details->SEQUENCE_STEP}>" />
        <{else}>
    		<td class="form-row form-row-sequence-step">
                <div class="form-field form-field-label">
        		    <label><{_t('Sequence step')}></label>
                </div>
            </td>
            <td class="form-row form-row-sequence-step" colspan="3">
                <div class="form-field form-field-value column-sequence-step">
                                            
        <input class="input-sequence-step input-type-number number-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_STEP" value="<{if $details->SEQUENCE_STEP != 0}><{$details->SEQUENCE_STEP}><{/if}>"  />
                        <{if $columntooltips.SEQUENCE_STEP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.SEQUENCE_STEP}>"></i>
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

        <{plugin key="adminsequence_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminsequenceform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminsequenceform :input').change(function() {
        $('#adminsequenceform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminsequenceform').length) {
            if ($('#adminsequenceform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminsequence/savedraft/",
                    data: $('#adminsequenceform').serialize()
                });

                $('#adminsequenceform').data('changed', false);
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
    adminsequence_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminsequenceform').find('[name*=adminsequence_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminsequence_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminsequence_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminsequence_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminsequence_apply_block_visibility(key, value);
        });
    }

    adminsequence_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminsequence_update_visibility_settings = function () {
        var model = adminsequence_get_editing_model();

        var settings = adminsequence_get_visibility_settings(model);

        adminsequence_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminsequenceform :input').change(function() {
            adminsequence_update_visibility_settings();
        });

        adminsequence_update_visibility_settings();
    });
</script>