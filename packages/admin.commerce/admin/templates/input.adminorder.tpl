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

<h2 class="heading"><{$formtitle}></h2>

<{if $messages}>
    <ul class="message">
        <{foreach from=$messages key=field item=message}>
            <li data-error-field="<{$field}>"><{$message}></li>
        <{/foreach}>
    </ul>
<{/if}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminorderform" id="adminorderform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section" style="padding: 10px 0;">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'CUSTOMER_ID_COUNTRY' }>
                	<div class="form-row <{if in_array('CUSTOMER_ID_COUNTRY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_COUNTRY')}><{if in_array('CUSTOMER_ID_COUNTRY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-id-country">

                                                    <{if isset($formdata.CUSTOMER_ID_COUNTRY) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_ID_COUNTRY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-id-country" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_FIRST_NAME' }>
                	<div class="form-row <{if in_array('CUSTOMER_FIRST_NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_FIRST_NAME')}><{if in_array('CUSTOMER_FIRST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-first-name">

                                                    <{if isset($formdata.CUSTOMER_FIRST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_FIRST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-first-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_LAST_NAME' }>
                	<div class="form-row <{if in_array('CUSTOMER_LAST_NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_LAST_NAME')}><{if in_array('CUSTOMER_LAST_NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-last-name">

                                                    <{if isset($formdata.CUSTOMER_LAST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_LAST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-last-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_ADDRESS' }>
                	<div class="form-row <{if in_array('CUSTOMER_ADDRESS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_ADDRESS')}><{if in_array('CUSTOMER_ADDRESS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-address">

                                                    <{if isset($formdata.CUSTOMER_ADDRESS) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_ADDRESS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-address" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ADDRESS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_CITY' }>
                	<div class="form-row <{if in_array('CUSTOMER_CITY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_CITY')}><{if in_array('CUSTOMER_CITY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-city">

                                                    <{if isset($formdata.CUSTOMER_CITY) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_CITY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-city" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_CITY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_STATE' }>
                	<div class="form-row <{if in_array('CUSTOMER_STATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_STATE')}><{if in_array('CUSTOMER_STATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-state">

                                                    <{if isset($formdata.CUSTOMER_STATE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_STATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-state" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_STATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_ZIP_CODE' }>
                	<div class="form-row <{if in_array('CUSTOMER_ZIP_CODE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_ZIP_CODE')}><{if in_array('CUSTOMER_ZIP_CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-zip-code">

                                                    <{if isset($formdata.CUSTOMER_ZIP_CODE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_ZIP_CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-zip-code" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_EMAIL' }>
                	<div class="form-row <{if in_array('CUSTOMER_EMAIL', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_EMAIL')}><{if in_array('CUSTOMER_EMAIL', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-email">

                                                    <{if isset($formdata.CUSTOMER_EMAIL) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_EMAIL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-email" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="32"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOMER_PHONE' }>
                	<div class="form-row <{if in_array('CUSTOMER_PHONE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOMER_PHONE')}><{if in_array('CUSTOMER_PHONE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-customer-phone">

                                                    <{if isset($formdata.CUSTOMER_PHONE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_PHONE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-phone" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TOTAL_VALUE' }>
                	<div class="form-row <{if in_array('TOTAL_VALUE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TOTAL_VALUE')}><{if in_array('TOTAL_VALUE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-total-value">

                                                    <{if isset($formdata.TOTAL_VALUE) }>
                            <{assign var='tmp_value' value=$formdata.TOTAL_VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-total-value currency-format" type="text" name="<{$prefix}>adminorder_formdata_TOTAL_VALUE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'COUPON_CODE' }>
                	<div class="form-row <{if in_array('COUPON_CODE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_COUPON_CODE')}><{if in_array('COUPON_CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-coupon-code">

                                                    <{if isset($formdata.COUPON_CODE) }>
                            <{assign var='tmp_value' value=$formdata.COUPON_CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-coupon-code" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'COUPON_DISCOUNT' }>
                	<div class="form-row <{if in_array('COUPON_DISCOUNT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_COUPON_DISCOUNT')}><{if in_array('COUPON_DISCOUNT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-coupon-discount">

                                                    <{if isset($formdata.COUPON_DISCOUNT) }>
                            <{assign var='tmp_value' value=$formdata.COUPON_DISCOUNT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-coupon-discount number-format" type="text" name="<{$prefix}>adminorder_formdata_COUPON_DISCOUNT" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_PAYMENT_TYPE' }>
                	<div class="form-row <{if in_array('ID_PAYMENT_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAYMENT_TYPE')}><{if in_array('ID_PAYMENT_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-payment-type">

                                                    <{if isset($formdata.ID_PAYMENT_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAYMENT_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$formdata.ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'CREATION_DATE' }>
                	<div class="form-row <{if in_array('CREATION_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CREATION_DATE')}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-creation-date">

                                                    <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>adminorder_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PAYMENT_DATE' }>
                	<div class="form-row <{if in_array('PAYMENT_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAYMENT_DATE')}><{if in_array('PAYMENT_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-payment-date">

                                                    <{if isset($formdata.PAYMENT_DATE) }>
                            <{assign var='tmp_value' value=$formdata.PAYMENT_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-payment-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PAYMENT_DATE" name="<{$prefix}>adminorder_formdata_PAYMENT_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PAYMENT_REF' }>
                	<div class="form-row <{if in_array('PAYMENT_REF', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAYMENT_REF')}><{if in_array('PAYMENT_REF', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-payment-ref">

                                                    <{if isset($formdata.PAYMENT_REF) }>
                            <{assign var='tmp_value' value=$formdata.PAYMENT_REF}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-payment-ref" type="text" name="<{$prefix}>adminorder_formdata_PAYMENT_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'REFUND_DATE' }>
                	<div class="form-row <{if in_array('REFUND_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_REFUND_DATE')}><{if in_array('REFUND_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-refund-date">

                                                    <{if isset($formdata.REFUND_DATE) }>
                            <{assign var='tmp_value' value=$formdata.REFUND_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-refund-date field-date" type="text" id="<{$prefix}>adminorder_formdata_REFUND_DATE" name="<{$prefix}>adminorder_formdata_REFUND_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'REFUND_REF' }>
                	<div class="form-row <{if in_array('REFUND_REF', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_REFUND_REF')}><{if in_array('REFUND_REF', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-refund-ref">

                                                    <{if isset($formdata.REFUND_REF) }>
                            <{assign var='tmp_value' value=$formdata.REFUND_REF}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-refund-ref" type="text" name="<{$prefix}>adminorder_formdata_REFUND_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PROCESSED_DATE' }>
                	<div class="form-row <{if in_array('PROCESSED_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PROCESSED_DATE')}><{if in_array('PROCESSED_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-processed-date">

                                                    <{if isset($formdata.PROCESSED_DATE) }>
                            <{assign var='tmp_value' value=$formdata.PROCESSED_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-processed-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PROCESSED_DATE" name="<{$prefix}>adminorder_formdata_PROCESSED_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_ORDER_STATUS' }>
                	<div class="form-row <{if in_array('ID_ADMIN_ORDER_STATUS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_ORDER_STATUS')}><{if in_array('ID_ADMIN_ORDER_STATUS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-order-status">

                                                    <{if isset($formdata.ID_ADMIN_ORDER_STATUS) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_ORDER_STATUS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$formdata.ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'NOTE' }>
                	<div class="form-row <{if in_array('NOTE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_NOTE')}><{if in_array('NOTE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-note">

                                                    <{if isset($formdata.NOTE) }>
                            <{assign var='tmp_value' value=$formdata.NOTE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-note" id="<{$prefix}>adminorder_formdata_NOTE" name="<{$prefix}>adminorder_formdata_NOTE" rows="5" ><{$tmp_value}></textarea>
                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminorderform').attr('action', '<{$actionurl}>');$('#adminorderform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorder/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


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
</script>

<{include file="footer.tpl"}>