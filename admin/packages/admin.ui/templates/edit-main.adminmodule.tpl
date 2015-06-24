<div class="edit-main edit_details">
    <{if isset($messages.adminmodule) }>
        <ul class="message">
            <{foreach from=$messages.adminmodule key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminmoduleform" id="adminmoduleform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmodule/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmodule_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmodule_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmodule_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmodule_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmodule_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ADMIN_MODULE_NAME"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmodule_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminmodule_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminmodule_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_MODULE"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            

    <input class="input-module input-type-text" type="text" name="<{$prefix}>adminmodule_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
                        <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PREFIX'])}>
    
        <{if $preset == 'PREFIX'}>
            <input type="hidden" class="input-prefix" name="adminmodule_formdata_PREFIX" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PREFIX']) && !$acleditablecolumns['PREFIX'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PREFIX'])}>
            <input type="hidden" class="input-prefix" name="adminmodule_formdata_PREFIX" value="<{$details->PREFIX}>" />
        <{else}>
    		<td class="form-row form-row-prefix form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_PREFIX"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-prefix form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-prefix">
                                            

    <input class="input-prefix input-type-text" type="text" name="<{$prefix}>adminmodule_formdata_PREFIX" value="<{$details->PREFIX|escape}>"  />
                        <{if $columntooltips.PREFIX}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PREFIX}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['AVAILABLE_ACTIONS'])}>
    
        <{if $preset == 'AVAILABLE_ACTIONS'}>
            <input type="hidden" class="input-available-actions" name="adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['AVAILABLE_ACTIONS']) && !$acleditablecolumns['AVAILABLE_ACTIONS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['AVAILABLE_ACTIONS'])}>
            <input type="hidden" class="input-available-actions" name="adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$details->AVAILABLE_ACTIONS}>" />
        <{else}>
    		<td class="form-row form-row-available-actions">
                <div class="form-field form-field-label">
        		    <label><{label key="L_AVAILABLE_ACTIONS"}></label>
                </div>
            </td>
            <td class="form-row form-row-available-actions" colspan="3">
                <div class="form-field form-field-value column-available-actions">
                                            

    <input class="input-available-actions input-type-text" type="text" name="<{$prefix}>adminmodule_formdata_AVAILABLE_ACTIONS" value="<{$details->AVAILABLE_ACTIONS|escape}>"  />
                        <{if $columntooltips.AVAILABLE_ACTIONS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.AVAILABLE_ACTIONS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_COMMENT_ENABLED'])}>
    
        <{if $preset == 'IS_COMMENT_ENABLED'}>
            <input type="hidden" class="input-is-comment-enabled" name="adminmodule_formdata_IS_COMMENT_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_COMMENT_ENABLED']) && !$acleditablecolumns['IS_COMMENT_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_COMMENT_ENABLED'])}>
            <input type="hidden" class="input-is-comment-enabled" name="adminmodule_formdata_IS_COMMENT_ENABLED" value="<{$details->IS_COMMENT_ENABLED}>" />
        <{else}>
    		<td class="form-row form-row-is-comment-enabled">
                <div class="form-field form-field-label">
        		    <label><{label key="L_IS_COMMENT_ENABLED"}></label>
                </div>
            </td>
            <td class="form-row form-row-is-comment-enabled" colspan="3">
                <div class="form-field form-field-value column-is-comment-enabled">
                                            

    <span class="input-type-radio"><input class="input-is-comment-enabled" type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="1" <{if $details->IS_COMMENT_ENABLED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="0" <{if !$details->IS_COMMENT_ENABLED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.IS_COMMENT_ENABLED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_COMMENT_ENABLED}>"></i>
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
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
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
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
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

        <{plugin key="adminmodule_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmoduleform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmoduleform :input').change(function() {
        $('#adminmoduleform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmoduleform').length) {
            if ($('#adminmoduleform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/savedraft/",
                    data: $('#adminmoduleform').serialize()
                });

                $('#adminmoduleform').data('changed', false);
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
    adminmodule_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmoduleform').find('[name*=adminmodule_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmodule_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmodule_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmodule_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmodule_apply_block_visibility(key, value);
        });
    }

    adminmodule_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmodule_update_visibility_settings = function () {
        var model = adminmodule_get_editing_model();

        var settings = adminmodule_get_visibility_settings(model);

        adminmodule_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmoduleform :input').change(function() {
            adminmodule_update_visibility_settings();
        });

        adminmodule_update_visibility_settings();
    });
</script>