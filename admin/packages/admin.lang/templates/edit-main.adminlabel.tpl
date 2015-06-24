<div class="edit-main edit_details">
    <{if isset($messages.adminlabel) }>
        <ul class="message">
            <{foreach from=$messages.adminlabel key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminlabelform" id="adminlabelform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlabel/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminlabel_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminlabel_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminlabel_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LABEL'])}>
    
        <{if $preset == 'LABEL'}>
            <input type="hidden" class="input-label" name="adminlabel_formdata_LABEL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LABEL']) && !$acleditablecolumns['LABEL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LABEL'])}>
            <input type="hidden" class="input-label" name="adminlabel_formdata_LABEL" value="<{$details->LABEL}>" />
        <{else}>
    		<td class="form-row form-row-label">
                <div class="form-field form-field-label">
        		    <label><{label key="L_LABEL"}></label>
                </div>
            </td>
            <td class="form-row form-row-label" colspan="3">
                <div class="form-field form-field-value column-label">
                                            

    <input class="input-label input-type-text" type="text" name="<{$prefix}>adminlabel_formdata_LABEL" value="<{$details->LABEL|escape}>"  />
                        <{if $columntooltips.LABEL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LABEL}>"></i>
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

        <{plugin key="adminlabel_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlabelform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminlabelform :input').change(function() {
        $('#adminlabelform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminlabelform').length) {
            if ($('#adminlabelform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlabel/savedraft/",
                    data: $('#adminlabelform').serialize()
                });

                $('#adminlabelform').data('changed', false);
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
    adminlabel_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminlabelform').find('[name*=adminlabel_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminlabel_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminlabel_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminlabel_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminlabel_apply_block_visibility(key, value);
        });
    }

    adminlabel_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminlabel_update_visibility_settings = function () {
        var model = adminlabel_get_editing_model();

        var settings = adminlabel_get_visibility_settings(model);

        adminlabel_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminlabelform :input').change(function() {
            adminlabel_update_visibility_settings();
        });

        adminlabel_update_visibility_settings();
    });
</script>