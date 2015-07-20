<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Admin Order')|ucwords}></h3>
</div>


<div id="adminorder-edit" class="edit_details">

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

    <form name="adminorderform" id="adminorderform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminorder/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminorder_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminorder_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminorder_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME'])}>
    
        <{if $preset == 'CUSTOMER_FIRST_NAME'}>
            <input type="hidden" class="input-customer-first-name" name="adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_FIRST_NAME']) && !$acleditablecolumns['CUSTOMER_FIRST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_FIRST_NAME'])}>
            <input type="hidden" class="input-customer-first-name" name="adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$details->CUSTOMER_FIRST_NAME}>" />
        <{else}>
    		<td class="form-row form-row-customer-first-name">
                <div class="form-field form-field-label">
        		    <label><{_t('Customer first name')}></label>
                </div>
            </td>
            <td class="form-row form-row-customer-first-name" colspan="3">
                <div class="form-field form-field-value column-customer-first-name">
                                            

    <input class="input-customer-first-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$details->CUSTOMER_FIRST_NAME|escape}>"  />
                        <{if $columntooltips.CUSTOMER_FIRST_NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_FIRST_NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOMER_LAST_NAME'])}>
    
        <{if $preset == 'CUSTOMER_LAST_NAME'}>
            <input type="hidden" class="input-customer-last-name" name="adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_LAST_NAME']) && !$acleditablecolumns['CUSTOMER_LAST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_LAST_NAME'])}>
            <input type="hidden" class="input-customer-last-name" name="adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$details->CUSTOMER_LAST_NAME}>" />
        <{else}>
    		<td class="form-row form-row-customer-last-name">
                <div class="form-field form-field-label">
        		    <label><{_t('Customer last name')}></label>
                </div>
            </td>
            <td class="form-row form-row-customer-last-name" colspan="3">
                <div class="form-field form-field-value column-customer-last-name">
                                            

    <input class="input-customer-last-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$details->CUSTOMER_LAST_NAME|escape}>"  />
                        <{if $columntooltips.CUSTOMER_LAST_NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_LAST_NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                        <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE'])}>
    
        <{if $preset == 'CUSTOMER_ZIP_CODE'}>
            <input type="hidden" class="input-customer-zip-code" name="adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_ZIP_CODE']) && !$acleditablecolumns['CUSTOMER_ZIP_CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_ZIP_CODE'])}>
            <input type="hidden" class="input-customer-zip-code" name="adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$details->CUSTOMER_ZIP_CODE}>" />
        <{else}>
    		<td class="form-row form-row-customer-zip-code">
                <div class="form-field form-field-label">
        		    <label><{_t('Customer zip code')}></label>
                </div>
            </td>
            <td class="form-row form-row-customer-zip-code" colspan="3">
                <div class="form-field form-field-value column-customer-zip-code">
                                            

    <input class="input-customer-zip-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$details->CUSTOMER_ZIP_CODE|escape}>"  />
                        <{if $columntooltips.CUSTOMER_ZIP_CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_ZIP_CODE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOMER_EMAIL'])}>
    
        <{if $preset == 'CUSTOMER_EMAIL'}>
            <input type="hidden" class="input-customer-email" name="adminorder_formdata_CUSTOMER_EMAIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_EMAIL']) && !$acleditablecolumns['CUSTOMER_EMAIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_EMAIL'])}>
            <input type="hidden" class="input-customer-email" name="adminorder_formdata_CUSTOMER_EMAIL" value="<{$details->CUSTOMER_EMAIL}>" />
        <{else}>
    		<td class="form-row form-row-customer-email">
                <div class="form-field form-field-label">
        		    <label><{_t('Customer email')}></label>
                </div>
            </td>
            <td class="form-row form-row-customer-email" colspan="3">
                <div class="form-field form-field-value column-customer-email">
                                            

    <input class="input-customer-email input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$details->CUSTOMER_EMAIL|escape}>"  />
                        <{if $columntooltips.CUSTOMER_EMAIL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_EMAIL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CUSTOMER_PHONE'])}>
    
        <{if $preset == 'CUSTOMER_PHONE'}>
            <input type="hidden" class="input-customer-phone" name="adminorder_formdata_CUSTOMER_PHONE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_PHONE']) && !$acleditablecolumns['CUSTOMER_PHONE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_PHONE'])}>
            <input type="hidden" class="input-customer-phone" name="adminorder_formdata_CUSTOMER_PHONE" value="<{$details->CUSTOMER_PHONE}>" />
        <{else}>
    		<td class="form-row form-row-customer-phone">
                <div class="form-field form-field-label">
        		    <label><{_t('Customer phone')}></label>
                </div>
            </td>
            <td class="form-row form-row-customer-phone" colspan="3">
                <div class="form-field form-field-value column-customer-phone">
                                            

    <input class="input-customer-phone input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$details->CUSTOMER_PHONE|escape}>"  />
                        <{if $columntooltips.CUSTOMER_PHONE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_PHONE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['COUPON_CODE'])}>
    
        <{if $preset == 'COUPON_CODE'}>
            <input type="hidden" class="input-coupon-code" name="adminorder_formdata_COUPON_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COUPON_CODE']) && !$acleditablecolumns['COUPON_CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COUPON_CODE'])}>
            <input type="hidden" class="input-coupon-code" name="adminorder_formdata_COUPON_CODE" value="<{$details->COUPON_CODE}>" />
        <{else}>
    		<td class="form-row form-row-coupon-code">
                <div class="form-field form-field-label">
        		    <label><{_t('Coupon code')}></label>
                </div>
            </td>
            <td class="form-row form-row-coupon-code" colspan="3">
                <div class="form-field form-field-value column-coupon-code">
                                            

    <input class="input-coupon-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$details->COUPON_CODE|escape}>"  />
                        <{if $columntooltips.COUPON_CODE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.COUPON_CODE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PAYMENT_TYPE'])}>
    
        <{if $preset == 'ID_PAYMENT_TYPE'}>
            <input type="hidden" class="input-id-payment-type" name="adminorder_formdata_ID_PAYMENT_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAYMENT_TYPE']) && !$acleditablecolumns['ID_PAYMENT_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAYMENT_TYPE'])}>
            <input type="hidden" class="input-id-payment-type" name="adminorder_formdata_ID_PAYMENT_TYPE" value="<{$details->ID_PAYMENT_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-payment-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Payment type')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-payment-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-payment-type">
                                            
            <{if Framework::hasModule('PaymentType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-payment-type" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$details->ID_PAYMENT_TYPE text=$details->reftext_ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new" title="Create a New Payment Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-payment-type input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_PAYMENT_TYPE" value="<{$details->ID_PAYMENT_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PAYMENT_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAYMENT_TYPE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS'])}>
    
        <{if $preset == 'ID_ADMIN_ORDER_STATUS'}>
            <input type="hidden" class="input-id-admin-order-status" name="adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS']) && !$acleditablecolumns['ID_ADMIN_ORDER_STATUS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS'])}>
            <input type="hidden" class="input-id-admin-order-status" name="adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$details->ID_ADMIN_ORDER_STATUS}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-order-status">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin order status')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-order-status" colspan="3">
                <div class="form-field form-field-value column-id-admin-order-status">
                                            
            <{if Framework::hasModule('AdminOrderStatus')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-order-status" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$details->ID_ADMIN_ORDER_STATUS text=$details->reftext_ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/new" title="Create a New Admin Order Status">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-order-status input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$details->ID_ADMIN_ORDER_STATUS|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_ORDER_STATUS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_ORDER_STATUS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NOTE'])}>
    
        <{if $preset == 'NOTE'}>
            <input type="hidden" class="input-note" name="adminorder_formdata_NOTE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NOTE']) && !$acleditablecolumns['NOTE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NOTE'])}>
            <input type="hidden" class="input-note" name="adminorder_formdata_NOTE" value="<{$details->NOTE}>" />
        <{else}>
    		<td class="form-row form-row-note">
                <div class="form-field form-field-label">
        		    <label><{_t('Note')}></label>
                </div>
            </td>
            <td class="form-row form-row-note" colspan="3">
                <div class="form-field form-field-value column-note">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-note " id="<{$prefix}>adminorder_formdata_NOTE_<{$tmpid}>" name="<{$prefix}>adminorder_formdata_NOTE" rows="5" ><{$details->NOTE}></textarea>
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

        <{plugin key="adminorder_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminorderform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminorderform :input').change(function() {
        $('#adminorderform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminorderform').length) {
            if ($('#adminorderform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/savedraft/",
                    data: $('#adminorderform').serialize()
                });

                $('#adminorderform').data('changed', false);
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
    adminorder_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminorderform').find('[name*=adminorder_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminorder_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminorder_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminorder_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminorder_apply_block_visibility(key, value);
        });
    }

    adminorder_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminorder_update_visibility_settings = function () {
        var model = adminorder_get_editing_model();

        var settings = adminorder_get_visibility_settings(model);

        adminorder_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminorderform :input').change(function() {
            adminorder_update_visibility_settings();
        });

        adminorder_update_visibility_settings();
    });
</script>                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminorderitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminordertabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminorderitem) }>
                    <li><a href="#tab-adminorderitems"><{_t('Admin order item')}> <span class="badge adminorderitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminorderitem) }>
                    <div id="tab-adminorderitems">
                    	<{if true || $tab == 'adminorderitems'}>
                        	<h2 class="print"><{_t('Admin order item')}></h2>
                                                            <{ajaxmodule class="WidgetListAdminOrderItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_ORDER="`$details->ID`" where=""  template='widgetlist.adminorderitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminordertabs" ).tabs({
        		cookie: {
        			// store cookie for a day, without, it would be a session cookie
        			expires: 1
        		}
        	});
        });
        </script>
    <{/if}>

    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminorderform', 'f2', 'a.button-save');
    	bind_hotkey('#adminorderform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminorderform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminorderform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>