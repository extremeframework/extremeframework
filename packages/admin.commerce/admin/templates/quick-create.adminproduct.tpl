<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_ADMIN_PRODUCT')|ucwords}></h3>
</div>


<div id="adminproduct-edit" class="edit_details">

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

    <form name="adminproductform" id="adminproductform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminproduct/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminproduct_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminproduct_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminproduct_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="adminproduct_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="adminproduct_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TITLE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>adminproduct_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IMAGE'])}>
    
        <{if $preset == 'IMAGE'}>
            <input type="hidden" class="input-image" name="adminproduct_formdata_IMAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IMAGE']) && !$acleditablecolumns['IMAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IMAGE'])}>
            <input type="hidden" class="input-image" name="adminproduct_formdata_IMAGE" value="<{$details->IMAGE}>" />
        <{else}>
    		<td class="form-row form-row-image">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IMAGE')}></label>
                </div>
            </td>
            <td class="form-row form-row-image" colspan="3">
                <div class="form-field form-field-value column-image">
                                            

	<input class="input-image input-type-file" type="file" name="<{$prefix}>adminproduct_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>adminproduct_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.adminproductform.<{$prefix}>adminproduct_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>adminproduct_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>adminproduct_formdata_IMAGE" value="<{$details->IMAGE}>" />
                        <{if $columntooltips.IMAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IMAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LIST_PRICE'])}>
    
        <{if $preset == 'LIST_PRICE'}>
            <input type="hidden" class="input-list-price" name="adminproduct_formdata_LIST_PRICE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LIST_PRICE']) && !$acleditablecolumns['LIST_PRICE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LIST_PRICE'])}>
            <input type="hidden" class="input-list-price" name="adminproduct_formdata_LIST_PRICE" value="<{$details->LIST_PRICE}>" />
        <{else}>
    		<td class="form-row form-row-list-price">
                <div class="form-field form-field-label">
        		    <label><{_t('L_LIST_PRICE')}></label>
                </div>
            </td>
            <td class="form-row form-row-list-price" colspan="3">
                <div class="form-field form-field-value column-list-price">
                                            
        <input class="input-list-price input-type-currency currency-format" type="text" name="<{$prefix}>adminproduct_formdata_LIST_PRICE" value="<{if $details->LIST_PRICE != 0}><{$details->LIST_PRICE}><{/if}>"  />
                        <{if $columntooltips.LIST_PRICE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LIST_PRICE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PRICE'])}>
    
        <{if $preset == 'PRICE'}>
            <input type="hidden" class="input-price" name="adminproduct_formdata_PRICE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PRICE']) && !$acleditablecolumns['PRICE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PRICE'])}>
            <input type="hidden" class="input-price" name="adminproduct_formdata_PRICE" value="<{$details->PRICE}>" />
        <{else}>
    		<td class="form-row form-row-price">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PRICE')}></label>
                </div>
            </td>
            <td class="form-row form-row-price" colspan="3">
                <div class="form-field form-field-value column-price">
                                            
        <input class="input-price input-type-currency currency-format" type="text" name="<{$prefix}>adminproduct_formdata_PRICE" value="<{if $details->PRICE != 0}><{$details->PRICE}><{/if}>"  />
                        <{if $columntooltips.PRICE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PRICE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                            </tbody>
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

        <{plugin key="adminproduct_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminproductform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminproductform :input').change(function() {
        $('#adminproductform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminproductform').length) {
            if ($('#adminproductform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/savedraft/",
                    data: $('#adminproductform').serialize()
                });

                $('#adminproductform').data('changed', false);
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
    adminproduct_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminproductform').find('[name*=adminproduct_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminproduct_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminproduct_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminproduct_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminproduct_apply_block_visibility(key, value);
        });
    }

    adminproduct_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminproduct_update_visibility_settings = function () {
        var model = adminproduct_get_editing_model();

        var settings = adminproduct_get_visibility_settings(model);

        adminproduct_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminproductform :input').change(function() {
            adminproduct_update_visibility_settings();
        });

        adminproduct_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/new">
                    <strong><{_t('L_GO_TO_FULL_FORM')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminproductform', 'f2', 'a.button-save');
    	bind_hotkey('#adminproductform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminproductform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminproductform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminproductform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>