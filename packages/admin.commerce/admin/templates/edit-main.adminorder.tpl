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
        <input type="hidden" name="view-type" value="edit" />
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
                                                                                            
<tr class="form-row form-row-customer-id-country">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY'])}>
    
        <{if $preset == 'CUSTOMER_ID_COUNTRY'}>
            <input type="hidden" class="input-customer-id-country" name="adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_ID_COUNTRY']) && !$acleditablecolumns['CUSTOMER_ID_COUNTRY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_ID_COUNTRY'])}>
            <input type="hidden" class="input-customer-id-country" name="adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$details->CUSTOMER_ID_COUNTRY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer country')}></label>
            </td>
            <td class="form-field form-field-value column-customer-id-country" colspan="3">
                                    

    <input class="input-customer-id-country input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$details->CUSTOMER_ID_COUNTRY|escape}>"  />
                    <{if $columntooltips.CUSTOMER_ID_COUNTRY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_ID_COUNTRY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-first-name">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME'])}>
    
        <{if $preset == 'CUSTOMER_FIRST_NAME'}>
            <input type="hidden" class="input-customer-first-name" name="adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_FIRST_NAME']) && !$acleditablecolumns['CUSTOMER_FIRST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_FIRST_NAME'])}>
            <input type="hidden" class="input-customer-first-name" name="adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$details->CUSTOMER_FIRST_NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer first name')}></label>
            </td>
            <td class="form-field form-field-value column-customer-first-name" colspan="3">
                                    

    <input class="input-customer-first-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$details->CUSTOMER_FIRST_NAME|escape}>"  />
                    <{if $columntooltips.CUSTOMER_FIRST_NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_FIRST_NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-last-name">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME'])}>
    
        <{if $preset == 'CUSTOMER_LAST_NAME'}>
            <input type="hidden" class="input-customer-last-name" name="adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_LAST_NAME']) && !$acleditablecolumns['CUSTOMER_LAST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_LAST_NAME'])}>
            <input type="hidden" class="input-customer-last-name" name="adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$details->CUSTOMER_LAST_NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer last name')}></label>
            </td>
            <td class="form-field form-field-value column-customer-last-name" colspan="3">
                                    

    <input class="input-customer-last-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$details->CUSTOMER_LAST_NAME|escape}>"  />
                    <{if $columntooltips.CUSTOMER_LAST_NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_LAST_NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-address">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_ADDRESS'])}>
    
        <{if $preset == 'CUSTOMER_ADDRESS'}>
            <input type="hidden" class="input-customer-address" name="adminorder_formdata_CUSTOMER_ADDRESS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_ADDRESS']) && !$acleditablecolumns['CUSTOMER_ADDRESS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_ADDRESS'])}>
            <input type="hidden" class="input-customer-address" name="adminorder_formdata_CUSTOMER_ADDRESS" value="<{$details->CUSTOMER_ADDRESS}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer address')}></label>
            </td>
            <td class="form-field form-field-value column-customer-address" colspan="3">
                                    

    <input class="input-customer-address input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ADDRESS" value="<{$details->CUSTOMER_ADDRESS|escape}>"  />
                    <{if $columntooltips.CUSTOMER_ADDRESS}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_ADDRESS}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-city">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_CITY'])}>
    
        <{if $preset == 'CUSTOMER_CITY'}>
            <input type="hidden" class="input-customer-city" name="adminorder_formdata_CUSTOMER_CITY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_CITY']) && !$acleditablecolumns['CUSTOMER_CITY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_CITY'])}>
            <input type="hidden" class="input-customer-city" name="adminorder_formdata_CUSTOMER_CITY" value="<{$details->CUSTOMER_CITY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer city')}></label>
            </td>
            <td class="form-field form-field-value column-customer-city" colspan="3">
                                    

    <input class="input-customer-city input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_CITY" value="<{$details->CUSTOMER_CITY|escape}>"  />
                    <{if $columntooltips.CUSTOMER_CITY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_CITY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-state">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_STATE'])}>
    
        <{if $preset == 'CUSTOMER_STATE'}>
            <input type="hidden" class="input-customer-state" name="adminorder_formdata_CUSTOMER_STATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_STATE']) && !$acleditablecolumns['CUSTOMER_STATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_STATE'])}>
            <input type="hidden" class="input-customer-state" name="adminorder_formdata_CUSTOMER_STATE" value="<{$details->CUSTOMER_STATE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer state')}></label>
            </td>
            <td class="form-field form-field-value column-customer-state" colspan="3">
                                    

    <input class="input-customer-state input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_STATE" value="<{$details->CUSTOMER_STATE|escape}>"  />
                    <{if $columntooltips.CUSTOMER_STATE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_STATE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-zip-code">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE'])}>
    
        <{if $preset == 'CUSTOMER_ZIP_CODE'}>
            <input type="hidden" class="input-customer-zip-code" name="adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_ZIP_CODE']) && !$acleditablecolumns['CUSTOMER_ZIP_CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_ZIP_CODE'])}>
            <input type="hidden" class="input-customer-zip-code" name="adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$details->CUSTOMER_ZIP_CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer zip code')}></label>
            </td>
            <td class="form-field form-field-value column-customer-zip-code" colspan="3">
                                    

    <input class="input-customer-zip-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$details->CUSTOMER_ZIP_CODE|escape}>"  />
                    <{if $columntooltips.CUSTOMER_ZIP_CODE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_ZIP_CODE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-email">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_EMAIL'])}>
    
        <{if $preset == 'CUSTOMER_EMAIL'}>
            <input type="hidden" class="input-customer-email" name="adminorder_formdata_CUSTOMER_EMAIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_EMAIL']) && !$acleditablecolumns['CUSTOMER_EMAIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_EMAIL'])}>
            <input type="hidden" class="input-customer-email" name="adminorder_formdata_CUSTOMER_EMAIL" value="<{$details->CUSTOMER_EMAIL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer email')}></label>
            </td>
            <td class="form-field form-field-value column-customer-email" colspan="3">
                                    

    <input class="input-customer-email input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$details->CUSTOMER_EMAIL|escape}>"  />
                    <{if $columntooltips.CUSTOMER_EMAIL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_EMAIL}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-customer-phone">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOMER_PHONE'])}>
    
        <{if $preset == 'CUSTOMER_PHONE'}>
            <input type="hidden" class="input-customer-phone" name="adminorder_formdata_CUSTOMER_PHONE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOMER_PHONE']) && !$acleditablecolumns['CUSTOMER_PHONE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOMER_PHONE'])}>
            <input type="hidden" class="input-customer-phone" name="adminorder_formdata_CUSTOMER_PHONE" value="<{$details->CUSTOMER_PHONE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Customer phone')}></label>
            </td>
            <td class="form-field form-field-value column-customer-phone" colspan="3">
                                    

    <input class="input-customer-phone input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$details->CUSTOMER_PHONE|escape}>"  />
                    <{if $columntooltips.CUSTOMER_PHONE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOMER_PHONE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-total-value">
            
        
        
        
        <{if !isset($excludedcolumns['TOTAL_VALUE'])}>
    
        <{if $preset == 'TOTAL_VALUE'}>
            <input type="hidden" class="input-total-value" name="adminorder_formdata_TOTAL_VALUE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TOTAL_VALUE']) && !$acleditablecolumns['TOTAL_VALUE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TOTAL_VALUE'])}>
            <input type="hidden" class="input-total-value" name="adminorder_formdata_TOTAL_VALUE" value="<{$details->TOTAL_VALUE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Total value')}></label>
            </td>
            <td class="form-field form-field-value column-total-value" colspan="3">
                                    
        <input class="input-total-value input-type-currency currency-format" type="text" name="<{$prefix}>adminorder_formdata_TOTAL_VALUE" value="<{if $details->TOTAL_VALUE != 0}><{$details->TOTAL_VALUE}><{/if}>"  />
                    <{if $columntooltips.TOTAL_VALUE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TOTAL_VALUE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-coupon-code">
            
        
        
        
        <{if !isset($excludedcolumns['COUPON_CODE'])}>
    
        <{if $preset == 'COUPON_CODE'}>
            <input type="hidden" class="input-coupon-code" name="adminorder_formdata_COUPON_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COUPON_CODE']) && !$acleditablecolumns['COUPON_CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COUPON_CODE'])}>
            <input type="hidden" class="input-coupon-code" name="adminorder_formdata_COUPON_CODE" value="<{$details->COUPON_CODE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Coupon code')}></label>
            </td>
            <td class="form-field form-field-value column-coupon-code" colspan="3">
                                    

    <input class="input-coupon-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$details->COUPON_CODE|escape}>"  />
                    <{if $columntooltips.COUPON_CODE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.COUPON_CODE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-coupon-discount">
            
        
        
        
        <{if !isset($excludedcolumns['COUPON_DISCOUNT'])}>
    
        <{if $preset == 'COUPON_DISCOUNT'}>
            <input type="hidden" class="input-coupon-discount" name="adminorder_formdata_COUPON_DISCOUNT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COUPON_DISCOUNT']) && !$acleditablecolumns['COUPON_DISCOUNT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COUPON_DISCOUNT'])}>
            <input type="hidden" class="input-coupon-discount" name="adminorder_formdata_COUPON_DISCOUNT" value="<{$details->COUPON_DISCOUNT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Coupon discount')}></label>
            </td>
            <td class="form-field form-field-value column-coupon-discount" colspan="3">
                                    
        <input class="input-coupon-discount input-type-number number-format" type="text" name="<{$prefix}>adminorder_formdata_COUPON_DISCOUNT" value="<{if $details->COUPON_DISCOUNT != 0}><{$details->COUPON_DISCOUNT}><{/if}>"  />
                    <{if $columntooltips.COUPON_DISCOUNT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.COUPON_DISCOUNT}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-payment-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PAYMENT_TYPE'])}>
    
        <{if $preset == 'ID_PAYMENT_TYPE'}>
            <input type="hidden" class="input-id-payment-type" name="adminorder_formdata_ID_PAYMENT_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAYMENT_TYPE']) && !$acleditablecolumns['ID_PAYMENT_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAYMENT_TYPE'])}>
            <input type="hidden" class="input-id-payment-type" name="adminorder_formdata_ID_PAYMENT_TYPE" value="<{$details->ID_PAYMENT_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Payment type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-payment-type" colspan="3">
                                    
            <{if Framework::hasModule('PaymentType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-payment-type" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$details->ID_PAYMENT_TYPE text=$details->reftext_ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.paymenttype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new" title="Create a New Payment Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-payment-type input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_PAYMENT_TYPE" value="<{$details->ID_PAYMENT_TYPE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_PAYMENT_TYPE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAYMENT_TYPE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-creation-date">
            
        
        
                    </tr>                                                                                            
<tr class="form-row form-row-payment-date">
            
        
        
        
        <{if !isset($excludedcolumns['PAYMENT_DATE'])}>
    
        <{if $preset == 'PAYMENT_DATE'}>
            <input type="hidden" class="input-payment-date" name="adminorder_formdata_PAYMENT_DATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PAYMENT_DATE']) && !$acleditablecolumns['PAYMENT_DATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PAYMENT_DATE'])}>
            <input type="hidden" class="input-payment-date" name="adminorder_formdata_PAYMENT_DATE" value="<{$details->PAYMENT_DATE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Payment date')}></label>
            </td>
            <td class="form-field form-field-value column-payment-date" colspan="3">
                                    
    <input class="input-payment-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PAYMENT_DATE" name="<{$prefix}>adminorder_formdata_PAYMENT_DATE" value="<{$details->PAYMENT_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.PAYMENT_DATE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PAYMENT_DATE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-payment-ref">
            
        
        
        
        <{if !isset($excludedcolumns['PAYMENT_REF'])}>
    
        <{if $preset == 'PAYMENT_REF'}>
            <input type="hidden" class="input-payment-ref" name="adminorder_formdata_PAYMENT_REF" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PAYMENT_REF']) && !$acleditablecolumns['PAYMENT_REF'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PAYMENT_REF'])}>
            <input type="hidden" class="input-payment-ref" name="adminorder_formdata_PAYMENT_REF" value="<{$details->PAYMENT_REF}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Payment ref')}></label>
            </td>
            <td class="form-field form-field-value column-payment-ref" colspan="3">
                                    

    <input class="input-payment-ref input-type-text" type="text" name="<{$prefix}>adminorder_formdata_PAYMENT_REF" value="<{$details->PAYMENT_REF|escape}>"  />
                    <{if $columntooltips.PAYMENT_REF}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PAYMENT_REF}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-refund-date">
            
        
        
        
        <{if !isset($excludedcolumns['REFUND_DATE'])}>
    
        <{if $preset == 'REFUND_DATE'}>
            <input type="hidden" class="input-refund-date" name="adminorder_formdata_REFUND_DATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['REFUND_DATE']) && !$acleditablecolumns['REFUND_DATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['REFUND_DATE'])}>
            <input type="hidden" class="input-refund-date" name="adminorder_formdata_REFUND_DATE" value="<{$details->REFUND_DATE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Refund date')}></label>
            </td>
            <td class="form-field form-field-value column-refund-date" colspan="3">
                                    
    <input class="input-refund-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_REFUND_DATE" name="<{$prefix}>adminorder_formdata_REFUND_DATE" value="<{$details->REFUND_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.REFUND_DATE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.REFUND_DATE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-refund-ref">
            
        
        
        
        <{if !isset($excludedcolumns['REFUND_REF'])}>
    
        <{if $preset == 'REFUND_REF'}>
            <input type="hidden" class="input-refund-ref" name="adminorder_formdata_REFUND_REF" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['REFUND_REF']) && !$acleditablecolumns['REFUND_REF'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['REFUND_REF'])}>
            <input type="hidden" class="input-refund-ref" name="adminorder_formdata_REFUND_REF" value="<{$details->REFUND_REF}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Refund ref')}></label>
            </td>
            <td class="form-field form-field-value column-refund-ref" colspan="3">
                                    

    <input class="input-refund-ref input-type-text" type="text" name="<{$prefix}>adminorder_formdata_REFUND_REF" value="<{$details->REFUND_REF|escape}>"  />
                    <{if $columntooltips.REFUND_REF}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.REFUND_REF}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-processed-date">
            
        
        
        
        <{if !isset($excludedcolumns['PROCESSED_DATE'])}>
    
        <{if $preset == 'PROCESSED_DATE'}>
            <input type="hidden" class="input-processed-date" name="adminorder_formdata_PROCESSED_DATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PROCESSED_DATE']) && !$acleditablecolumns['PROCESSED_DATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PROCESSED_DATE'])}>
            <input type="hidden" class="input-processed-date" name="adminorder_formdata_PROCESSED_DATE" value="<{$details->PROCESSED_DATE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Processed date')}></label>
            </td>
            <td class="form-field form-field-value column-processed-date" colspan="3">
                                    
    <input class="input-processed-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PROCESSED_DATE" name="<{$prefix}>adminorder_formdata_PROCESSED_DATE" value="<{$details->PROCESSED_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.PROCESSED_DATE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PROCESSED_DATE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-admin-order-status">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS'])}>
    
        <{if $preset == 'ID_ADMIN_ORDER_STATUS'}>
            <input type="hidden" class="input-id-admin-order-status" name="adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS']) && !$acleditablecolumns['ID_ADMIN_ORDER_STATUS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS'])}>
            <input type="hidden" class="input-id-admin-order-status" name="adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$details->ID_ADMIN_ORDER_STATUS}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Admin order status')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-order-status" colspan="3">
                                    
            <{if Framework::hasModule('AdminOrderStatus')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-admin-order-status" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$details->ID_ADMIN_ORDER_STATUS text=$details->reftext_ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminorderstatus.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/new" title="Create a New Admin Order Status">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-order-status input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$details->ID_ADMIN_ORDER_STATUS|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ADMIN_ORDER_STATUS}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_ORDER_STATUS}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-note">
            
        
        
        
        <{if !isset($excludedcolumns['NOTE'])}>
    
        <{if $preset == 'NOTE'}>
            <input type="hidden" class="input-note" name="adminorder_formdata_NOTE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NOTE']) && !$acleditablecolumns['NOTE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NOTE'])}>
            <input type="hidden" class="input-note" name="adminorder_formdata_NOTE" value="<{$details->NOTE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Note')}></label>
            </td>
            <td class="form-field form-field-value column-note" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-note " id="<{$prefix}>adminorder_formdata_NOTE_<{$tmpid}>" name="<{$prefix}>adminorder_formdata_NOTE" rows="5" ><{$details->NOTE}></textarea>
                    <{if $columntooltips.NOTE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NOTE}>"></i>
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
</script>