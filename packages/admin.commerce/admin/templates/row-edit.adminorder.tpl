<{$row_edit = true}>
<{$force_boolean_dropdown = true}>
<{$force_image_input = true}>
<{$formdata = (array) $row}>

<tr id="item_<{$row->UUID}>" class="adminorder-rowedit <{if $row->UUID}>adminorder-rowedit-existing rowedit-existing<{/if}> <{if $messages.adminorder.0}>rowedit-with-message<{/if}> rowedit" data-id="<{$row->UUID}>">
	<td class="checkbox">
	    <{if $row->UUID}>
    		<input type="checkbox" class="adminorderlistchk" name="adminorderlist_selection[]" value="<{$row->UUID}>" />
	        <input type="hidden" name="adminorder_formdata_UUID" value="<{$row->UUID}>" />
    		<input type="hidden" class="column-id" name="<{$prefix}>adminorder_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
        <{/if}>
        <{if $presetparams}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="adminorder_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>
	</td>
	<td class="indicators"></td>
            <{if (in_array('CUSTOMER_ID_COUNTRY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY']) && ((isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) && $aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || $aclviewablecolumns['CUSTOMER_ID_COUNTRY']))) }>
                <td class="column column-customer-id-country key" >
                                            <{if (in_array('CUSTOMER_ID_COUNTRY', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_ID_COUNTRY) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_ID_COUNTRY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-id-country" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>	<{$row->CUSTOMER_ID_COUNTRY|escape}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_FIRST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) && $aclviewablecolumns['CUSTOMER_FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) || $aclviewablecolumns['CUSTOMER_FIRST_NAME']))) }>
                <td class="column column-customer-first-name text" >
                                            <{if (in_array('CUSTOMER_FIRST_NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_FIRST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_FIRST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-first-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>	<{$row->CUSTOMER_FIRST_NAME|escape}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_LAST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) && $aclviewablecolumns['CUSTOMER_LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) || $aclviewablecolumns['CUSTOMER_LAST_NAME']))) }>
                <td class="column column-customer-last-name text" >
                                            <{if (in_array('CUSTOMER_LAST_NAME', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_LAST_NAME) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_LAST_NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-last-name" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="200"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_LAST_NAME|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_CITY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_CITY']) && ((isset($aclviewablecolumns['CUSTOMER_CITY']) && $aclviewablecolumns['CUSTOMER_CITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_CITY']) || $aclviewablecolumns['CUSTOMER_CITY']))) }>
                <td class="column column-customer-city text" >
                                            <{if (in_array('CUSTOMER_CITY', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_CITY) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_CITY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-city" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_CITY" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_CITY|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_STATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_STATE']) && ((isset($aclviewablecolumns['CUSTOMER_STATE']) && $aclviewablecolumns['CUSTOMER_STATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_STATE']) || $aclviewablecolumns['CUSTOMER_STATE']))) }>
                <td class="column column-customer-state text" >
                                            <{if (in_array('CUSTOMER_STATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_STATE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_STATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-state" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_STATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_STATE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_ZIP_CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE']) && ((isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) && $aclviewablecolumns['CUSTOMER_ZIP_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) || $aclviewablecolumns['CUSTOMER_ZIP_CODE']))) }>
                <td class="column column-customer-zip-code text" >
                                            <{if (in_array('CUSTOMER_ZIP_CODE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_ZIP_CODE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_ZIP_CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-zip-code" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_ZIP_CODE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_EMAIL']) && ((isset($aclviewablecolumns['CUSTOMER_EMAIL']) && $aclviewablecolumns['CUSTOMER_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_EMAIL']) || $aclviewablecolumns['CUSTOMER_EMAIL']))) }>
                <td class="column column-customer-email email" >
                                            <{if (in_array('CUSTOMER_EMAIL', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_EMAIL) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_EMAIL}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-email" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="150"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_EMAIL|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CUSTOMER_PHONE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_PHONE']) && ((isset($aclviewablecolumns['CUSTOMER_PHONE']) && $aclviewablecolumns['CUSTOMER_PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_PHONE']) || $aclviewablecolumns['CUSTOMER_PHONE']))) }>
                <td class="column column-customer-phone phone" >
                                            <{if (in_array('CUSTOMER_PHONE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CUSTOMER_PHONE) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOMER_PHONE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-customer-phone" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->CUSTOMER_PHONE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('TOTAL_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TOTAL_VALUE']) && ((isset($aclviewablecolumns['TOTAL_VALUE']) && $aclviewablecolumns['TOTAL_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOTAL_VALUE']) || $aclviewablecolumns['TOTAL_VALUE']))) }>
                <td class="column column-total-value number" >
                                            <{if (in_array('TOTAL_VALUE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.TOTAL_VALUE) }>
                            <{assign var='tmp_value' value=$formdata.TOTAL_VALUE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-total-value currency-format" type="text" name="<{$prefix}>adminorder_formdata_TOTAL_VALUE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="currency currency-format"><{if $row->TOTAL_VALUE != 0}><{$row->TOTAL_VALUE}><{/if}></span>
    
            <{$summable.TOTAL_VALUE = $summable.TOTAL_VALUE + $row->TOTAL_VALUE scope=parent}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('COUPON_CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COUPON_CODE']) && ((isset($aclviewablecolumns['COUPON_CODE']) && $aclviewablecolumns['COUPON_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_CODE']) || $aclviewablecolumns['COUPON_CODE']))) }>
                <td class="column column-coupon-code text" >
                                            <{if (in_array('COUPON_CODE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.COUPON_CODE) }>
                            <{assign var='tmp_value' value=$formdata.COUPON_CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-coupon-code" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->COUPON_CODE|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('COUPON_DISCOUNT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COUPON_DISCOUNT']) && ((isset($aclviewablecolumns['COUPON_DISCOUNT']) && $aclviewablecolumns['COUPON_DISCOUNT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_DISCOUNT']) || $aclviewablecolumns['COUPON_DISCOUNT']))) }>
                <td class="column column-coupon-discount number" >
                                            <{if (in_array('COUPON_DISCOUNT', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.COUPON_DISCOUNT) }>
                            <{assign var='tmp_value' value=$formdata.COUPON_DISCOUNT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-coupon-discount number-format" type="text" name="<{$prefix}>adminorder_formdata_COUPON_DISCOUNT" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                                                <{else}>
                            <span>
            <span class="number number-format"><{if $row->COUPON_DISCOUNT != 0}><{$row->COUPON_DISCOUNT}><{/if}></span>
    
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_PAYMENT_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAYMENT_TYPE']) && ((isset($aclviewablecolumns['ID_PAYMENT_TYPE']) && $aclviewablecolumns['ID_PAYMENT_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAYMENT_TYPE']) || $aclviewablecolumns['ID_PAYMENT_TYPE']))) }>
                <td class="column column-id-payment-type reftext" >
                                            <{if (in_array('ID_PAYMENT_TYPE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_PAYMENT_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAYMENT_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$formdata.ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new" title="Create a New Payment Type">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAYMENT_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.paymenttype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$row->refuuid_ID_PAYMENT_TYPE}>"><{$row->reftext_ID_PAYMENT_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAYMENT_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAYMENT_TYPE}><{$row->ID_PAYMENT_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date datetime" >
                                            <{if (in_array('CREATION_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-creation-date field-date" type="text" id="<{$prefix}>adminorder_formdata_CREATION_DATE" name="<{$prefix}>adminorder_formdata_CREATION_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PAYMENT_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PAYMENT_DATE']) && ((isset($aclviewablecolumns['PAYMENT_DATE']) && $aclviewablecolumns['PAYMENT_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_DATE']) || $aclviewablecolumns['PAYMENT_DATE']))) }>
                <td class="column column-payment-date datetime" >
                                            <{if (in_array('PAYMENT_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PAYMENT_DATE) }>
                            <{assign var='tmp_value' value=$formdata.PAYMENT_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-payment-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PAYMENT_DATE" name="<{$prefix}>adminorder_formdata_PAYMENT_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->PAYMENT_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PAYMENT_REF', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PAYMENT_REF']) && ((isset($aclviewablecolumns['PAYMENT_REF']) && $aclviewablecolumns['PAYMENT_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_REF']) || $aclviewablecolumns['PAYMENT_REF']))) }>
                <td class="column column-payment-ref text" >
                                            <{if (in_array('PAYMENT_REF', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PAYMENT_REF) }>
                            <{assign var='tmp_value' value=$formdata.PAYMENT_REF}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-payment-ref" type="text" name="<{$prefix}>adminorder_formdata_PAYMENT_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->PAYMENT_REF|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('REFUND_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['REFUND_DATE']) && ((isset($aclviewablecolumns['REFUND_DATE']) && $aclviewablecolumns['REFUND_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_DATE']) || $aclviewablecolumns['REFUND_DATE']))) }>
                <td class="column column-refund-date datetime" >
                                            <{if (in_array('REFUND_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.REFUND_DATE) }>
                            <{assign var='tmp_value' value=$formdata.REFUND_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-refund-date field-date" type="text" id="<{$prefix}>adminorder_formdata_REFUND_DATE" name="<{$prefix}>adminorder_formdata_REFUND_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->REFUND_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('REFUND_REF', $filtercolumns)) }>
            <{if !isset($excludedcolumns['REFUND_REF']) && ((isset($aclviewablecolumns['REFUND_REF']) && $aclviewablecolumns['REFUND_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_REF']) || $aclviewablecolumns['REFUND_REF']))) }>
                <td class="column column-refund-ref text" >
                                            <{if (in_array('REFUND_REF', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.REFUND_REF) }>
                            <{assign var='tmp_value' value=$formdata.REFUND_REF}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-refund-ref" type="text" name="<{$prefix}>adminorder_formdata_REFUND_REF" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                                                <{else}>
                            <span>	<{$row->REFUND_REF|escape}>
</span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('PROCESSED_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PROCESSED_DATE']) && ((isset($aclviewablecolumns['PROCESSED_DATE']) && $aclviewablecolumns['PROCESSED_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PROCESSED_DATE']) || $aclviewablecolumns['PROCESSED_DATE']))) }>
                <td class="column column-processed-date datetime" >
                                            <{if (in_array('PROCESSED_DATE', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.PROCESSED_DATE) }>
                            <{assign var='tmp_value' value=$formdata.PROCESSED_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <input class="input-processed-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PROCESSED_DATE" name="<{$prefix}>adminorder_formdata_PROCESSED_DATE" value="<{$tmp_value|date_format:$smarty.const.SMARTY_DATE_FORMAT}>" <{if !$row_edit}>size="80"<{/if}> />
                                                <{else}>
                            <span>
            <{$row->PROCESSED_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	        <{if (in_array('ID_ADMIN_ORDER_STATUS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) && $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']))) }>
                <td class="column column-id-admin-order-status reftext" >
                                            <{if (in_array('ID_ADMIN_ORDER_STATUS', $roweditablecolumns)) }>
                    	                            <{if isset($formdata.ID_ADMIN_ORDER_STATUS) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_ORDER_STATUS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$formdata.ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                    <span class="onflycreation">
                                        <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/new" title="Create a New Admin Order Status">+</a>
                                    </span>
                                                                                                            <{else}>
                            <span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_ORDER_STATUS}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminorderstatus.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/view/<{$row->refuuid_ID_ADMIN_ORDER_STATUS}>"><{$row->reftext_ID_ADMIN_ORDER_STATUS|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_ORDER_STATUS|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_ORDER_STATUS}><{$row->ID_ADMIN_ORDER_STATUS|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
                        <{/if}>
                            		</td>
    	    <{/if}>
	    <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{include file="item.edit.tpl" customfield=$item id=$row->UUID value=CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<td class="actions">
	    <{if $row->UUID}>
    	    <div class="adminorder-rowedit-save-existing btn btn-success">Save</div>
        <{/if}>
	</td>
</tr>

<script type="text/javascript">
    <{if $messages.adminorder.0}>
        $('.adminorder-rowedit-message').html('<{$messages.adminorder.0}>').show();
    <{/if}>

    $('#adminorderlist #item_<{$row->UUID}> :input:visible:first').focus();

	$('#adminorderlist #item_<{$row->UUID}> select.autocomplete').select2();

    $('#adminorderlist > tbody tr.rowedit').enterAsTab({'allowSubmit': true});

    $("#adminorderlist > tbody tr.rowedit input[type=text]:last").on('keydown', function(e) {
        if (e.keyCode == "13") {
            $('.adminorder-rowedit-save').click();
        }
    });

    bind_hotkey("#adminorderlist > tbody tr.rowedit input[type=text]", 'f2', '.adminorder-rowedit-save');
    bind_hotkey("#adminorderlist > tbody tr.rowedit input[type=text]", 'esc', '.adminorder-rowedit-cancel');
</script>


