<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Payment Type')|ucwords}></h3>
</div>


<div id="paymenttype-edit" class="edit_details">

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

    <form name="paymenttypeform" id="paymenttypeform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/paymenttype/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="paymenttype_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="paymenttype_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="paymenttype_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="paymenttype_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="paymenttype_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Payment type name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>paymenttype_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-code form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Code')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
                                    <{if $details->ID && $details->CODE != ''}>
                        <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$details->CODE}>" />
                        
    <{$details->CODE|escape}>
                    <{else}>
                        

    <input class="input-code input-type-text" type="text" name="<{$prefix}>paymenttype_formdata_CODE" value="<{$details->CODE|escape}>"  />
                        <{if $columntooltips.CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                        <{/if}>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-is-enabled">
            
        
        
        
        <{if !isset($excludedcolumns['IS_ENABLED'])}>
    
        <{if $preset == 'IS_ENABLED'}>
            <input type="hidden" class="input-is-enabled" name="paymenttype_formdata_IS_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_ENABLED']) && !$acleditablecolumns['IS_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_ENABLED'])}>
            <input type="hidden" class="input-is-enabled" name="paymenttype_formdata_IS_ENABLED" value="<{$details->IS_ENABLED}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Enabled?')}></label>
            </td>
            <td class="form-field form-field-value column-is-enabled" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>paymenttype_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>paymenttype_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.IS_ENABLED}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IS_ENABLED}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                    
<tr class="form-row form-row-note">
            
        
        
        
        <{if !isset($excludedcolumns['NOTE'])}>
    
        <{if $preset == 'NOTE'}>
            <input type="hidden" class="input-note" name="paymenttype_formdata_NOTE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NOTE']) && !$acleditablecolumns['NOTE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NOTE'])}>
            <input type="hidden" class="input-note" name="paymenttype_formdata_NOTE" value="<{$details->NOTE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Note')}></label>
            </td>
            <td class="form-field form-field-value column-note" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-note " id="<{$prefix}>paymenttype_formdata_NOTE_<{$tmpid}>" name="<{$prefix}>paymenttype_formdata_NOTE" rows="5" ><{$details->NOTE}></textarea>
                    <{if $columntooltips.NOTE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NOTE}>"></i>
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
        
        <{plugin key="paymenttype_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('paymenttype_formdata_NAME', 'paymenttype_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#paymenttypeform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#paymenttypeform :input').change(function() {
        $('#paymenttypeform').data('changed', true);
    });

        function saveDraft() {
        if ($('#paymenttypeform').length) {
            if ($('#paymenttypeform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/paymenttype/savedraft/",
                    data: $('#paymenttypeform').serialize()
                });

                $('#paymenttypeform').data('changed', false);
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
    paymenttype_get_editing_model = function () {
        var model = {};

        var formdata = $('#paymenttypeform').find('[name*=paymenttype_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('paymenttype_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    paymenttype_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    paymenttype_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            paymenttype_apply_block_visibility(key, value);
        });
    }

    paymenttype_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    paymenttype_update_visibility_settings = function () {
        var model = paymenttype_get_editing_model();

        var settings = paymenttype_get_visibility_settings(model);

        paymenttype_apply_visibility_settings(settings);
    }

    $(function() {
        $('#paymenttypeform :input').change(function() {
            paymenttype_update_visibility_settings();
        });

        paymenttype_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#paymenttypeform', 'f2', 'a.button-save');
    	bind_hotkey('#paymenttypeform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#paymenttypeform', 'f3', 'a.button-save-more');
    	bind_hotkey('#paymenttypeform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#paymenttypeform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>