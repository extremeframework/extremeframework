<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="widgetpositionform" id="widgetpositionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/widgetposition/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="widgetposition_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="widgetposition_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="widgetposition_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="widgetposition_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="widgetposition_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Widget position name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>widgetposition_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-code form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="widgetposition_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="widgetposition_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Code')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
                                    <{if $details->ID && $details->CODE != ''}>
                        <input type="hidden" class="input-code" name="widgetposition_formdata_CODE" value="<{$details->CODE}>" />
                        
    <{$details->CODE|escape}>
                    <{else}>
                        

    <input class="input-code input-type-text" type="text" name="<{$prefix}>widgetposition_formdata_CODE" value="<{$details->CODE|escape}>"  />
                        <{if $columntooltips.CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                        <{/if}>
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
        
        <{plugin key="widgetposition_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('widgetposition_formdata_NAME', 'widgetposition_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#widgetpositionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#widgetpositionform :input').change(function() {
        $('#widgetpositionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#widgetpositionform').length) {
            if ($('#widgetpositionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/widgetposition/savedraft/",
                    data: $('#widgetpositionform').serialize()
                });

                $('#widgetpositionform').data('changed', false);
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
    widgetposition_get_editing_model = function () {
        var model = {};

        var formdata = $('#widgetpositionform').find('[name*=widgetposition_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('widgetposition_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    widgetposition_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    widgetposition_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            widgetposition_apply_block_visibility(key, value);
        });
    }

    widgetposition_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    widgetposition_update_visibility_settings = function () {
        var model = widgetposition_get_editing_model();

        var settings = widgetposition_get_visibility_settings(model);

        widgetposition_apply_visibility_settings(settings);
    }

    $(function() {
        $('#widgetpositionform :input').change(function() {
            widgetposition_update_visibility_settings();
        });

        widgetposition_update_visibility_settings();
    });
</script>