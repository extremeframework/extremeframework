<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminorder">

<{include file="top.tpl"}>

<script type="text/javascript">
function remove_attachment(element, attachment, spanid)
{
    element.value = element.value.replace(attachment, '');
    document.getElementById(spanid).style.visibility = 'hidden';
    document.getElementById(spanid).style.display = 'none';
}
</script>

<h1 class="heading">
    <span class="h"><i class="module-icon fa fa-paper-plane-o"></i><{$formtitle}></span>
</h1>

<div class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-top hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#adminorderform').attr('action', '<{$actionurl}>');$('#adminorderform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>

    <!-- Details -->
    <div class="section" style="padding: 10px 0;">
        <div>
            <div class="edit-main edit_details">
                <{if $messages}>
                    <ul class="message">
                        <{foreach from=$messages key=field item=message}>
                            <li data-error-field="<{$field}>"><{$message}></li>
                        <{/foreach}>
                    </ul>
                <{/if}>

                <form name="adminorderform" id="adminorderform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$columns item=column }>
                                <{if $columnsettings.$column }>
                                    <tr class="form-row form-row-<{$columnsettings.$column->code}> <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t($columnsettings.$column->text)}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$columnsettings.$column->code}>">
                                                <{include file="input-item.tpl"}>
                                            </div>
                                        </td>
                                    </tr>

                            
                                <{elseif $column == 'CUSTOMER_ID_COUNTRY' }>
                                    <tr class="form-row form-row-customer-id-country <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer country')}><{if in_array('CUSTOMER_ID_COUNTRY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-id-country">
                                                                        <{$tmp_value = $formdataCUSTOMER_ID_COUNTRY}>

                        
                            <input class="input-customer-id-country" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_FIRST_NAME' }>
                                    <tr class="form-row form-row-customer-first-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer first name')}><{if in_array('CUSTOMER_FIRST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-first-name">
                                                                        <{$tmp_value = $formdataCUSTOMER_FIRST_NAME}>

                        
                            <input class="input-customer-first-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_LAST_NAME' }>
                                    <tr class="form-row form-row-customer-last-name <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer last name')}><{if in_array('CUSTOMER_LAST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-last-name">
                                                                        <{$tmp_value = $formdataCUSTOMER_LAST_NAME}>

                        
                            <input class="input-customer-last-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_ADDRESS' }>
                                    <tr class="form-row form-row-customer-address <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer address')}><{if in_array('CUSTOMER_ADDRESS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-address">
                                                                        <{$tmp_value = $formdataCUSTOMER_ADDRESS}>

                        
                            <input class="input-customer-address" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ADDRESS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_CITY' }>
                                    <tr class="form-row form-row-customer-city <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer city')}><{if in_array('CUSTOMER_CITY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-city">
                                                                        <{$tmp_value = $formdataCUSTOMER_CITY}>

                        
                            <input class="input-customer-city" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_CITY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_STATE' }>
                                    <tr class="form-row form-row-customer-state <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer state')}><{if in_array('CUSTOMER_STATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-state">
                                                                        <{$tmp_value = $formdataCUSTOMER_STATE}>

                        
                            <input class="input-customer-state" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_STATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_ZIP_CODE' }>
                                    <tr class="form-row form-row-customer-zip-code <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer zip code')}><{if in_array('CUSTOMER_ZIP_CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-zip-code">
                                                                        <{$tmp_value = $formdataCUSTOMER_ZIP_CODE}>

                        
                            <input class="input-customer-zip-code" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_EMAIL' }>
                                    <tr class="form-row form-row-customer-email <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer email')}><{if in_array('CUSTOMER_EMAIL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-email">
                                                                        <{$tmp_value = $formdataCUSTOMER_EMAIL}>

                        
                            <input class="input-customer-email" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="32"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CUSTOMER_PHONE' }>
                                    <tr class="form-row form-row-customer-phone <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Customer phone')}><{if in_array('CUSTOMER_PHONE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-customer-phone">
                                                                        <{$tmp_value = $formdataCUSTOMER_PHONE}>

                        
                            <input class="input-customer-phone" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'TOTAL_VALUE' }>
                                    <tr class="form-row form-row-total-value <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Total value')}><{if in_array('TOTAL_VALUE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-total-value">
                                                                        <{$tmp_value = $formdataTOTAL_VALUE}>

                                                    
                            <input class="input-total-value currency-format" type="text" name="<{$prefix}>adminorder_formdata_TOTAL_VALUE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'COUPON_CODE' }>
                                    <tr class="form-row form-row-coupon-code <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Coupon code')}><{if in_array('COUPON_CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-coupon-code">
                                                                        <{$tmp_value = $formdataCOUPON_CODE}>

                        
                            <input class="input-coupon-code" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'COUPON_DISCOUNT' }>
                                    <tr class="form-row form-row-coupon-discount <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Coupon discount')}><{if in_array('COUPON_DISCOUNT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-coupon-discount">
                                                                        <{$tmp_value = $formdataCOUPON_DISCOUNT}>

                                                    
                            <input class="input-coupon-discount number-format" type="text" name="<{$prefix}>adminorder_formdata_COUPON_DISCOUNT" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_PAYMENT_TYPE' }>
                                    <tr class="form-row form-row-id-payment-type <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Payment type')}><{if in_array('ID_PAYMENT_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-payment-type">
                                                                        <{$tmp_value = $formdataID_PAYMENT_TYPE}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$formdata.ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" datasourcename="PaymentType" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'CREATION_DATE' }>
                                    <tr class="form-row form-row-creation-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Creation date')}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-creation-date">
                                                                        <{$tmp_value = $formdataCREATION_DATE}>

                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>adminorder_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PAYMENT_DATE' }>
                                    <tr class="form-row form-row-payment-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Payment date')}><{if in_array('PAYMENT_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-payment-date">
                                                                        <{$tmp_value = $formdataPAYMENT_DATE}>

                                                    <input class="input-payment-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PAYMENT_DATE" name="<{$prefix}>adminorder_formdata_PAYMENT_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PAYMENT_REF' }>
                                    <tr class="form-row form-row-payment-ref <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Payment ref')}><{if in_array('PAYMENT_REF', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-payment-ref">
                                                                        <{$tmp_value = $formdataPAYMENT_REF}>

                        
                            <input class="input-payment-ref" type="text" name="<{$prefix}>adminorder_formdata_PAYMENT_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'REFUND_DATE' }>
                                    <tr class="form-row form-row-refund-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Refund date')}><{if in_array('REFUND_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-refund-date">
                                                                        <{$tmp_value = $formdataREFUND_DATE}>

                                                    <input class="input-refund-date field-date" type="text" id="<{$prefix}>adminorder_formdata_REFUND_DATE" name="<{$prefix}>adminorder_formdata_REFUND_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'REFUND_REF' }>
                                    <tr class="form-row form-row-refund-ref <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Refund ref')}><{if in_array('REFUND_REF', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-refund-ref">
                                                                        <{$tmp_value = $formdataREFUND_REF}>

                        
                            <input class="input-refund-ref" type="text" name="<{$prefix}>adminorder_formdata_REFUND_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'PROCESSED_DATE' }>
                                    <tr class="form-row form-row-processed-date <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Processed date')}><{if in_array('PROCESSED_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-processed-date">
                                                                        <{$tmp_value = $formdataPROCESSED_DATE}>

                                                    <input class="input-processed-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PROCESSED_DATE" name="<{$prefix}>adminorder_formdata_PROCESSED_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                                    </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'ID_ADMIN_ORDER_STATUS' }>
                                    <tr class="form-row form-row-id-admin-order-status <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Admin order status')}><{if in_array('ID_ADMIN_ORDER_STATUS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-id-admin-order-status">
                                                                        <{$tmp_value = $formdataID_ADMIN_ORDER_STATUS}>

                                                    
                                <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$formdata.ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" datasourcename="AdminOrderStatus" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                                                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{elseif $column == 'NOTE' }>
                                    <tr class="form-row form-row-note <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                                		<td>
                                		    <div class="form-field form-field-label">
                                		        <label><{_t('Note')}><{if in_array('NOTE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                                		    </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-note">
                                                                        <{$tmp_value = $formdataNOTE}>

                        
                            <textarea class="input-note" id="<{$prefix}>adminorder_formdata_NOTE" name="<{$prefix}>adminorder_formdata_NOTE" rows="5" ><{$tmp_value}></textarea>
                                                                                                </div>
                                        </td>
                                    </tr>

                        	
                                <{/if}>
                            <{/foreach}>
                        </tbody>
                    </table>
                </form>
            </div>
    	</div>
        <div class="clearer"></div>
    </div>

    <!-- Control buttons -->
    <div class="edit-buttons edit-buttons-bottom hidden-print">
        <{foreach from=$formactions key=actiontitle item=actionurl}>
            <div class="button-general button-save btn btn-success">
                <a onclick="$('#adminorderform').attr('action', '<{$actionurl}>');$('#adminorderform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
            </div>
        <{/foreach}>
        <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/cancel/?back=0"><span class="button-face"><{_t('Cancel')}></span></a>
        <div class="clearer"></div>
    </div>
<div>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminorderform', 'f2', '.button-save');
    	bind_hotkey('#adminorderform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminorderform:not(.filter) :input:visible:first').focus();
        }
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>

<{include file="footer.tpl"}>