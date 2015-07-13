<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_PAYMENT_TYPE')|ucwords}></h3>
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
    <{if isset($messages.paymenttype) }>
        <ul class="message">
            <{foreach from=$messages.paymenttype key=field item=message}>
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
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="paymenttype_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="paymenttype_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PAYMENT_TYPE_NAME')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>paymenttype_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_CODE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="paymenttype_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>paymenttype_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_ENABLED'])}>
    
        <{if $preset == 'IS_ENABLED'}>
            <input type="hidden" class="input-is-enabled" name="paymenttype_formdata_IS_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_ENABLED']) && !$acleditablecolumns['IS_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_ENABLED'])}>
            <input type="hidden" class="input-is-enabled" name="paymenttype_formdata_IS_ENABLED" value="<{$details->IS_ENABLED}>" />
        <{else}>
    		<td class="form-row form-row-is-enabled">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_ENABLED')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-enabled" colspan="3">
                <div class="form-field form-field-value column-is-enabled">
                                            

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>paymenttype_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>paymenttype_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_ENABLED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_ENABLED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NOTE'])}>
    
        <{if $preset == 'NOTE'}>
            <input type="hidden" class="input-note" name="paymenttype_formdata_NOTE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NOTE']) && !$acleditablecolumns['NOTE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NOTE'])}>
            <input type="hidden" class="input-note" name="paymenttype_formdata_NOTE" value="<{$details->NOTE}>" />
        <{else}>
    		<td class="form-row form-row-note">
                <div class="form-field form-field-label">
        		    <label><{_t('L_NOTE')}></label>
                </div>
            </td>
            <td class="form-row form-row-note" colspan="3">
                <div class="form-field form-field-value column-note">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-note " id="<{$prefix}>paymenttype_formdata_NOTE_<{$tmpid}>" name="<{$prefix}>paymenttype_formdata_NOTE" rows="5" ><{$details->NOTE}></textarea>
                        <{if $columntooltips.NOTE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NOTE}>"></i>
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
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new">
                    <strong><{_t('L_GO_TO_FULL_FORM')}></strong>
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