<div class="edit-main edit_details">
    <{if isset($messages.adminorderitem) }>
        <ul class="message">
            <{foreach from=$messages.adminorderitem key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminorderitemform" id="adminorderitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorderitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminorderitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminorderitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminorderitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_ORDER'])}>
    
        <{if $preset == 'ID_ADMIN_ORDER'}>
            <input type="hidden" class="input-id-admin-order" name="adminorderitem_formdata_ID_ADMIN_ORDER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_ORDER']) && !$acleditablecolumns['ID_ADMIN_ORDER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_ORDER'])}>
            <input type="hidden" class="input-id-admin-order" name="adminorderitem_formdata_ID_ADMIN_ORDER" value="<{$details->ID_ADMIN_ORDER}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-order">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_ORDER')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-order" colspan="3">
                <div class="form-field form-field-value column-id-admin-order">
                                            
            <{if Framework::hasModule('AdminOrder')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-order" class="input-id-admin-order" name="`$prefix`adminorderitem_formdata_ID_ADMIN_ORDER" value=$details->ID_ADMIN_ORDER text=$details->reftext_ID_ADMIN_ORDER datasource="ADMIN_ORDER" valuecol="ID" textcol="CUSTOMER_FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/new" title="Create a New Admin Order">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-order input-type-text" type="text" name="<{$prefix}>adminorderitem_formdata_ID_ADMIN_ORDER" value="<{$details->ID_ADMIN_ORDER|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_ORDER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_ORDER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_PRODUCT'])}>
    
        <{if $preset == 'ID_ADMIN_PRODUCT'}>
            <input type="hidden" class="input-id-admin-product" name="adminorderitem_formdata_ID_ADMIN_PRODUCT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PRODUCT']) && !$acleditablecolumns['ID_ADMIN_PRODUCT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PRODUCT'])}>
            <input type="hidden" class="input-id-admin-product" name="adminorderitem_formdata_ID_ADMIN_PRODUCT" value="<{$details->ID_ADMIN_PRODUCT}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-product">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_PRODUCT')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-product" colspan="3">
                <div class="form-field form-field-value column-id-admin-product">
                                            
            <{if Framework::hasModule('AdminProduct')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-product" class="input-id-admin-product" name="`$prefix`adminorderitem_formdata_ID_ADMIN_PRODUCT" value=$details->ID_ADMIN_PRODUCT text=$details->reftext_ID_ADMIN_PRODUCT datasource="ADMIN_PRODUCT" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/new" title="Create a New Admin Product">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-product input-type-text" type="text" name="<{$prefix}>adminorderitem_formdata_ID_ADMIN_PRODUCT" value="<{$details->ID_ADMIN_PRODUCT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_PRODUCT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PRODUCT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['QUANTITY'])}>
    
        <{if $preset == 'QUANTITY'}>
            <input type="hidden" class="input-quantity" name="adminorderitem_formdata_QUANTITY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['QUANTITY']) && !$acleditablecolumns['QUANTITY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['QUANTITY'])}>
            <input type="hidden" class="input-quantity" name="adminorderitem_formdata_QUANTITY" value="<{$details->QUANTITY}>" />
        <{else}>
    		<td class="form-row form-row-quantity">
                <div class="form-field form-field-label">
        		    <label><{_t('L_QUANTITY')}></label>
                </div>
            </td>
            <td class="form-row form-row-quantity" colspan="3">
                <div class="form-field form-field-value column-quantity">
                                            
        <input class="input-quantity input-type-number number-format" type="text" name="<{$prefix}>adminorderitem_formdata_QUANTITY" value="<{if $details->QUANTITY != 0}><{$details->QUANTITY}><{/if}>"  />
                        <{if $columntooltips.QUANTITY}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.QUANTITY}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PRICE'])}>
    
        <{if $preset == 'PRICE'}>
            <input type="hidden" class="input-price" name="adminorderitem_formdata_PRICE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PRICE']) && !$acleditablecolumns['PRICE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PRICE'])}>
            <input type="hidden" class="input-price" name="adminorderitem_formdata_PRICE" value="<{$details->PRICE}>" />
        <{else}>
    		<td class="form-row form-row-price">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PRICE')}></label>
                </div>
            </td>
            <td class="form-row form-row-price" colspan="3">
                <div class="form-field form-field-value column-price">
                                            
        <input class="input-price input-type-currency currency-format" type="text" name="<{$prefix}>adminorderitem_formdata_PRICE" value="<{if $details->PRICE != 0}><{$details->PRICE}><{/if}>"  />
                        <{if $columntooltips.PRICE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PRICE}>"></i>
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

        <{plugin key="adminorderitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminorderitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminorderitemform :input').change(function() {
        $('#adminorderitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminorderitemform').length) {
            if ($('#adminorderitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/savedraft/",
                    data: $('#adminorderitemform').serialize()
                });

                $('#adminorderitemform').data('changed', false);
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
    adminorderitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminorderitemform').find('[name*=adminorderitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminorderitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminorderitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminorderitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminorderitem_apply_block_visibility(key, value);
        });
    }

    adminorderitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminorderitem_update_visibility_settings = function () {
        var model = adminorderitem_get_editing_model();

        var settings = adminorderitem_get_visibility_settings(model);

        adminorderitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminorderitemform :input').change(function() {
            adminorderitem_update_visibility_settings();
        });

        adminorderitem_update_visibility_settings();
    });
</script>