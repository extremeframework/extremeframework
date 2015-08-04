<div class="view-main">
    <{plugin key="adminorderitem_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER']) && $aclviewablecolumns['ID_ADMIN_ORDER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER']) || $aclviewablecolumns['ID_ADMIN_ORDER']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_ORDER', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-order">
	                    		        	                <{if isset($smarty.session.acl.adminorder.view)}>
    	                    <{if $details->ID_ADMIN_ORDER}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminorder" data-id="<{$details->refuuid_ID_ADMIN_ORDER}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Admin order')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-order" colspan="3">
            	<div class="attribute-line column-id-admin-order type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_ORDER']) && $acleditablecolumns['ID_ADMIN_ORDER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_ORDER']) || $acleditablecolumns['ID_ADMIN_ORDER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_ORDER}>
        <{if isset($smarty.session.acl.adminorder.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$details->refuuid_ID_ADMIN_ORDER}>"><{$details->reftext_ID_ADMIN_ORDER|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_ORDER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_ORDER}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminOrder')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-order" class="input-id-admin-order" name="`$prefix`adminorderitem_formdata_ID_ADMIN_ORDER" value=$details->ID_ADMIN_ORDER text=$details->reftext_ID_ADMIN_ORDER datasource="ADMIN_ORDER" valuecol="ID" textcol="CUSTOMER_FIRST_NAME" sortcol="CUSTOMER_FIRST_NAME"}>

                            <{if isset($smarty.session.acl.adminorder.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/new" title="Create a New Admin Order">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-order input-type-text" type="text" name="<{$prefix}>adminorderitem_formdata_ID_ADMIN_ORDER" value="<{$details->ID_ADMIN_ORDER|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_ORDER}>
        <{if isset($smarty.session.acl.adminorder.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$details->refuuid_ID_ADMIN_ORDER}>"><{$details->reftext_ID_ADMIN_ORDER|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_ORDER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_ORDER}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_PRODUCT']) && ((isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) && $aclviewablecolumns['ID_ADMIN_PRODUCT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_PRODUCT']) || $aclviewablecolumns['ID_ADMIN_PRODUCT']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_PRODUCT', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-product">
	                    		        	                <{if isset($smarty.session.acl.adminproduct.view)}>
    	                    <{if $details->ID_ADMIN_PRODUCT}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminproduct" data-id="<{$details->refuuid_ID_ADMIN_PRODUCT}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Admin product')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-product" colspan="3">
            	<div class="attribute-line column-id-admin-product type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_PRODUCT']) && $acleditablecolumns['ID_ADMIN_PRODUCT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_PRODUCT']) || $acleditablecolumns['ID_ADMIN_PRODUCT'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_PRODUCT}>
        <{if isset($smarty.session.acl.adminproduct.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$details->refuuid_ID_ADMIN_PRODUCT}>"><{$details->reftext_ID_ADMIN_PRODUCT|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PRODUCT|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PRODUCT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminProduct')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-product" class="input-id-admin-product" name="`$prefix`adminorderitem_formdata_ID_ADMIN_PRODUCT" value=$details->ID_ADMIN_PRODUCT text=$details->reftext_ID_ADMIN_PRODUCT datasource="ADMIN_PRODUCT" valuecol="ID" textcol="TITLE" sortcol="TITLE"}>

                            <{if isset($smarty.session.acl.adminproduct.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/new" title="Create a New Admin Product">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-product input-type-text" type="text" name="<{$prefix}>adminorderitem_formdata_ID_ADMIN_PRODUCT" value="<{$details->ID_ADMIN_PRODUCT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_PRODUCT}>
        <{if isset($smarty.session.acl.adminproduct.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/view/<{$details->refuuid_ID_ADMIN_PRODUCT}>"><{$details->reftext_ID_ADMIN_PRODUCT|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_PRODUCT|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_PRODUCT}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['QUANTITY']) && ((isset($aclviewablecolumns['QUANTITY']) && $aclviewablecolumns['QUANTITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['QUANTITY']) || $aclviewablecolumns['QUANTITY']))) }>
        <{if !isset($columns2hide) || !in_array('QUANTITY', $columns2hide) }>
    		<td class="form-field form-field-label column-quantity">
	            		        <label class="attribute-name"><{_t('Quantity')}></label>
            </td>
            <td class="form-field form-field-value column-quantity" colspan="3">
            	<div class="attribute-line column-quantity type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['QUANTITY']) && $acleditablecolumns['QUANTITY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['QUANTITY']) || $acleditablecolumns['QUANTITY'])) }>
                    		    <span class="value-mode">
                                    
        <span class="number number-format"><{if $details->QUANTITY != 0}><{$details->QUANTITY}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-quantity input-type-number number-format" type="text" name="<{$prefix}>adminorderitem_formdata_QUANTITY" value="<{if $details->QUANTITY != 0}><{$details->QUANTITY}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="number number-format"><{if $details->QUANTITY != 0}><{$details->QUANTITY}><{/if}></span>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PRICE']) && ((isset($aclviewablecolumns['PRICE']) && $aclviewablecolumns['PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRICE']) || $aclviewablecolumns['PRICE']))) }>
        <{if !isset($columns2hide) || !in_array('PRICE', $columns2hide) }>
    		<td class="form-field form-field-label column-price">
	            		        <label class="attribute-name"><{_t('Price')}></label>
            </td>
            <td class="form-field form-field-value column-price" colspan="3">
            	<div class="attribute-line column-price type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PRICE']) && $acleditablecolumns['PRICE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PRICE']) || $acleditablecolumns['PRICE'])) }>
                    		    <span class="value-mode">
                                    
        <span class="currency currency-format"><{if $details->PRICE != 0}><{$details->PRICE}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-price input-type-currency currency-format" type="text" name="<{$prefix}>adminorderitem_formdata_PRICE" value="<{if $details->PRICE != 0}><{$details->PRICE}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="currency currency-format"><{if $details->PRICE != 0}><{$details->PRICE}><{/if}></span>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
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
                                <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                		<div class="attribute-value">
                                            <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
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

    <{if $additional_view_fields}>
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                <{foreach from=$additional_view_fields item=item}>
                    <tr class="attribute-line">
                		<td class="form-field form-field-label">
            		        <label class="attribute-name"><{$item.label}></label>
                        </td>
                        <td class="form-field form-field-value">
                    		<div class="attribute-value">
                                <{$item.value}>
                    		</div>
                        </td>
            		</tr>
            	<{/foreach}>
            </tbody>
        </table>
    <{/if}>

    <{plugin key="adminorderitem_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminorderitemview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminorderitemview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminorderitemview_apply_block_visibility(key, value);
            });
        }

        adminorderitemview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminorderitemview_update_visibility_settings = function () {
            var settings = adminorderitemview_get_visibility_settings();

            adminorderitemview_apply_visibility_settings(settings);
        }

        $(function() {
            adminorderitemview_update_visibility_settings();
        });

        $(function() {
            // x. Row expanders
            $('.view-main .view-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);
                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var module = expander.data('module');
                var id = expander.data('id');

                // Hide others
                table.find('tr').not(tr).find('.view-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.view-embedded-view').not('tr.' + module + '-view-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.' + module + '-view-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/" + module + "/rowExpandedView/" + id + "?source=view&colcount=4"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
            });

//            // x. Onfly view edit
//            $('td.form-field-value').die('click').live('click', function(){
//                var td = $(this);
//
//                var view = $(this).find('.value-mode');
//                var edit = $(this).find('.edit-mode');
//                var input = $(this).find('.edit-mode>:input');
//
//                if (view.length == 0 || edit.length == 0) {
//                    return;
//                }
//
//                if (edit.is(":visible")) {
//                    return;
//                }
//
//                view.hide();
//                edit.show();
//
//                input.css('max-width', td.width() - 10);
//                input.focus();
//
//                var saved = false;
//
//                input.off('blur').on('blur', function(event) {
//                    event.preventDefault();
//
//                    // Workaround in case of an unexpected blur event from an auto-complete selection box
//                    if (input.is("select") && event.type == 'blur') {
//                        return;
//                    }
//
//                    var saved = false;
//                    input.change();
//                    saved = true;
//                });
//
//                input.off('change').on('change', function(event) {
//                    event.preventDefault();
//
//                    if (saved) {
//                        return;
//                    }
//
//                    var message = edit.find('.message');
//
//                    if (message.length == 0) {
//                        message = $('<div class="message"></div>').insertBefore(input);
//                    }
//
//                    $.ajax({
//                        type: "post",
//                        dataType: "json",
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminorderitem/fieldSave",
//                        data: td.find(':input').serialize() + "&adminorderitem_formdata_UUID=<{$details->UUID}>"
//                    }).done(function(data) {
//                        if (data.success) {
//                            if (input.is("select")) {
//                                var txt = input.find('option:selected').map(function () {
//                                    return $(this).text().trim();
//                                }).get().join(', ');
//
//                                view.html(txt);
//                            } else {
//                                view.html(input.val());
//                            }
//
//                            view.show();
//                            edit.hide();
//
//                            message.remove();
//                        } else {
//                            input.focus();
//
//                            message.html('<span>' + data.message + '</span>');
//                        }
//                    });
//                });
//            });
        });

    </script>
</div>