<div class="view-main">
    <{plugin key="adminproduct_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Admin product title')}></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
            	<div class="attribute-line column-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TITLE']) && $acleditablecolumns['TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TITLE']) || $acleditablecolumns['TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>adminproduct_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TAG_LINE']) && ((isset($aclviewablecolumns['TAG_LINE']) && $aclviewablecolumns['TAG_LINE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TAG_LINE']) || $aclviewablecolumns['TAG_LINE']))) }>
        <{if !isset($columns2hide) || !in_array('TAG_LINE', $columns2hide) }>
    		<td class="form-field form-field-label column-tag-line">
	            		        <label class="attribute-name"><{_t('Tag line')}></label>
            </td>
            <td class="form-field form-field-value column-tag-line" colspan="3">
            	<div class="attribute-line column-tag-line type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TAG_LINE']) && $acleditablecolumns['TAG_LINE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TAG_LINE']) || $acleditablecolumns['TAG_LINE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TAG_LINE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>adminproduct_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TAG_LINE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
            	<div class="attribute-line column-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IMAGE']) && $acleditablecolumns['IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IMAGE']) || $acleditablecolumns['IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>adminproduct_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>adminproduct_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.adminproductform.<{$prefix}>adminproduct_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>adminproduct_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>adminproduct_formdata_IMAGE" value="<{$details->IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LIST_PRICE']) && ((isset($aclviewablecolumns['LIST_PRICE']) && $aclviewablecolumns['LIST_PRICE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LIST_PRICE']) || $aclviewablecolumns['LIST_PRICE']))) }>
        <{if !isset($columns2hide) || !in_array('LIST_PRICE', $columns2hide) }>
    		<td class="form-field form-field-label column-list-price">
	            		        <label class="attribute-name"><{_t('List price')}></label>
            </td>
            <td class="form-field form-field-value column-list-price" colspan="3">
            	<div class="attribute-line column-list-price type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LIST_PRICE']) && $acleditablecolumns['LIST_PRICE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LIST_PRICE']) || $acleditablecolumns['LIST_PRICE'])) }>
                    		    <span class="value-mode">
                                    
        <span class="currency currency-format"><{if $details->LIST_PRICE != 0}><{$details->LIST_PRICE}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-list-price input-type-currency currency-format" type="text" name="<{$prefix}>adminproduct_formdata_LIST_PRICE" value="<{if $details->LIST_PRICE != 0}><{$details->LIST_PRICE}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="currency currency-format"><{if $details->LIST_PRICE != 0}><{$details->LIST_PRICE}><{/if}></span>
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
                                    
        <input class="input-price input-type-currency currency-format" type="text" name="<{$prefix}>adminproduct_formdata_PRICE" value="<{if $details->PRICE != 0}><{$details->PRICE}><{/if}>"  />
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
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DESCRIPTION']) && ((isset($aclviewablecolumns['DESCRIPTION']) && $aclviewablecolumns['DESCRIPTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DESCRIPTION']) || $aclviewablecolumns['DESCRIPTION']))) }>
        <{if !isset($columns2hide) || !in_array('DESCRIPTION', $columns2hide) }>
    		<td class="form-field form-field-label column-description">
	            		        <label class="attribute-name"><{_t('Description')}></label>
            </td>
            <td class="form-field form-field-value column-description" colspan="3">
            	<div class="attribute-line column-description type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DESCRIPTION']) && $acleditablecolumns['DESCRIPTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DESCRIPTION']) || $acleditablecolumns['DESCRIPTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->DESCRIPTION|plugin:"adminproduct_view_field_DESCRIPTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>adminproduct_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>adminproduct_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->DESCRIPTION|plugin:"adminproduct_view_field_DESCRIPTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PRODUCT_ID_PAGE']) && ((isset($aclviewablecolumns['PRODUCT_ID_PAGE']) && $aclviewablecolumns['PRODUCT_ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PRODUCT_ID_PAGE']) || $aclviewablecolumns['PRODUCT_ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('PRODUCT_ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-product-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->PRODUCT_ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_PRODUCT_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Product page')}></label>
            </td>
            <td class="form-field form-field-value column-product-id-page" colspan="3">
            	<div class="attribute-line column-product-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PRODUCT_ID_PAGE']) && $acleditablecolumns['PRODUCT_ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PRODUCT_ID_PAGE']) || $acleditablecolumns['PRODUCT_ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_PRODUCT_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_PRODUCT_ID_PAGE}>"><{$details->reftext_PRODUCT_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_PRODUCT_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->PRODUCT_ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-product-id-page" class="input-product-id-page" name="`$prefix`adminproduct_formdata_PRODUCT_ID_PAGE" value=$details->PRODUCT_ID_PAGE text=$details->reftext_PRODUCT_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-product-id-page input-type-text" type="text" name="<{$prefix}>adminproduct_formdata_PRODUCT_ID_PAGE" value="<{$details->PRODUCT_ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PRODUCT_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_PRODUCT_ID_PAGE}>"><{$details->reftext_PRODUCT_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_PRODUCT_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->PRODUCT_ID_PAGE}>
    <{/if}>
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

    <{plugin key="adminproduct_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminproductview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminproductview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminproductview_apply_block_visibility(key, value);
            });
        }

        adminproductview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminproductview_update_visibility_settings = function () {
            var settings = adminproductview_get_visibility_settings();

            adminproductview_apply_visibility_settings(settings);
        }

        $(function() {
            adminproductview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminproduct/fieldSave",
//                        data: td.find(':input').serialize() + "&adminproduct_formdata_UUID=<{$details->UUID}>"
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