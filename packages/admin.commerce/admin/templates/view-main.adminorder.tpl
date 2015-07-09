<div class="view-main">
    <{plugin key="adminorder_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY']) && ((isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) && $aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || $aclviewablecolumns['CUSTOMER_ID_COUNTRY']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_ID_COUNTRY', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-id-country">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_COUNTRY')}></label>
            </td>
            <td class="form-field form-field-value column-customer-id-country" colspan="3">
            	<div class="attribute-line column-customer-id-country type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_ID_COUNTRY']) && $acleditablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_ID_COUNTRY']) || $acleditablecolumns['CUSTOMER_ID_COUNTRY'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_ID_COUNTRY|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-id-country input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ID_COUNTRY" value="<{$details->CUSTOMER_ID_COUNTRY|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_ID_COUNTRY|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) && $aclviewablecolumns['CUSTOMER_FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) || $aclviewablecolumns['CUSTOMER_FIRST_NAME']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_FIRST_NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-first-name">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_FIRST_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-customer-first-name" colspan="3">
            	<div class="attribute-line column-customer-first-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_FIRST_NAME']) && $acleditablecolumns['CUSTOMER_FIRST_NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_FIRST_NAME']) || $acleditablecolumns['CUSTOMER_FIRST_NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_FIRST_NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-first-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_FIRST_NAME" value="<{$details->CUSTOMER_FIRST_NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_FIRST_NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) && $aclviewablecolumns['CUSTOMER_LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) || $aclviewablecolumns['CUSTOMER_LAST_NAME']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_LAST_NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-last-name">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_LAST_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-customer-last-name" colspan="3">
            	<div class="attribute-line column-customer-last-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_LAST_NAME']) && $acleditablecolumns['CUSTOMER_LAST_NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_LAST_NAME']) || $acleditablecolumns['CUSTOMER_LAST_NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_LAST_NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-last-name input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_LAST_NAME" value="<{$details->CUSTOMER_LAST_NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_LAST_NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_ADDRESS']) && ((isset($aclviewablecolumns['CUSTOMER_ADDRESS']) && $aclviewablecolumns['CUSTOMER_ADDRESS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ADDRESS']) || $aclviewablecolumns['CUSTOMER_ADDRESS']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_ADDRESS', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-address">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_ADDRESS')}></label>
            </td>
            <td class="form-field form-field-value column-customer-address" colspan="3">
            	<div class="attribute-line column-customer-address type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_ADDRESS']) && $acleditablecolumns['CUSTOMER_ADDRESS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_ADDRESS']) || $acleditablecolumns['CUSTOMER_ADDRESS'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_ADDRESS|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-address input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ADDRESS" value="<{$details->CUSTOMER_ADDRESS|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_ADDRESS|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_CITY']) && ((isset($aclviewablecolumns['CUSTOMER_CITY']) && $aclviewablecolumns['CUSTOMER_CITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_CITY']) || $aclviewablecolumns['CUSTOMER_CITY']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_CITY', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-city">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_CITY')}></label>
            </td>
            <td class="form-field form-field-value column-customer-city" colspan="3">
            	<div class="attribute-line column-customer-city type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_CITY']) && $acleditablecolumns['CUSTOMER_CITY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_CITY']) || $acleditablecolumns['CUSTOMER_CITY'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_CITY|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-city input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_CITY" value="<{$details->CUSTOMER_CITY|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_CITY|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_STATE']) && ((isset($aclviewablecolumns['CUSTOMER_STATE']) && $aclviewablecolumns['CUSTOMER_STATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_STATE']) || $aclviewablecolumns['CUSTOMER_STATE']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_STATE', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-state">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_STATE')}></label>
            </td>
            <td class="form-field form-field-value column-customer-state" colspan="3">
            	<div class="attribute-line column-customer-state type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_STATE']) && $acleditablecolumns['CUSTOMER_STATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_STATE']) || $acleditablecolumns['CUSTOMER_STATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_STATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-state input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_STATE" value="<{$details->CUSTOMER_STATE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_STATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE']) && ((isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) && $aclviewablecolumns['CUSTOMER_ZIP_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) || $aclviewablecolumns['CUSTOMER_ZIP_CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_ZIP_CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-zip-code">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_ZIP_CODE')}></label>
            </td>
            <td class="form-field form-field-value column-customer-zip-code" colspan="3">
            	<div class="attribute-line column-customer-zip-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_ZIP_CODE']) && $acleditablecolumns['CUSTOMER_ZIP_CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_ZIP_CODE']) || $acleditablecolumns['CUSTOMER_ZIP_CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_ZIP_CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-zip-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_ZIP_CODE" value="<{$details->CUSTOMER_ZIP_CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_ZIP_CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_EMAIL']) && ((isset($aclviewablecolumns['CUSTOMER_EMAIL']) && $aclviewablecolumns['CUSTOMER_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_EMAIL']) || $aclviewablecolumns['CUSTOMER_EMAIL']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_EMAIL', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-email">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_EMAIL')}></label>
            </td>
            <td class="form-field form-field-value column-customer-email" colspan="3">
            	<div class="attribute-line column-customer-email type-email">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_EMAIL']) && $acleditablecolumns['CUSTOMER_EMAIL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_EMAIL']) || $acleditablecolumns['CUSTOMER_EMAIL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_EMAIL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-email input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_EMAIL" value="<{$details->CUSTOMER_EMAIL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_EMAIL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CUSTOMER_PHONE']) && ((isset($aclviewablecolumns['CUSTOMER_PHONE']) && $aclviewablecolumns['CUSTOMER_PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_PHONE']) || $aclviewablecolumns['CUSTOMER_PHONE']))) }>
        <{if !isset($columns2hide) || !in_array('CUSTOMER_PHONE', $columns2hide) }>
    		<td class="form-field form-field-label column-customer-phone">
	            		        <label class="attribute-name"><{_t('L_CUSTOMER_PHONE')}></label>
            </td>
            <td class="form-field form-field-value column-customer-phone" colspan="3">
            	<div class="attribute-line column-customer-phone type-phone">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CUSTOMER_PHONE']) && $acleditablecolumns['CUSTOMER_PHONE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CUSTOMER_PHONE']) || $acleditablecolumns['CUSTOMER_PHONE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CUSTOMER_PHONE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-customer-phone input-type-text" type="text" name="<{$prefix}>adminorder_formdata_CUSTOMER_PHONE" value="<{$details->CUSTOMER_PHONE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CUSTOMER_PHONE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TOTAL_VALUE']) && ((isset($aclviewablecolumns['TOTAL_VALUE']) && $aclviewablecolumns['TOTAL_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOTAL_VALUE']) || $aclviewablecolumns['TOTAL_VALUE']))) }>
        <{if !isset($columns2hide) || !in_array('TOTAL_VALUE', $columns2hide) }>
    		<td class="form-field form-field-label column-total-value">
	            		        <label class="attribute-name"><{_t('L_TOTAL_VALUE')}></label>
            </td>
            <td class="form-field form-field-value column-total-value" colspan="3">
            	<div class="attribute-line column-total-value type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TOTAL_VALUE']) && $acleditablecolumns['TOTAL_VALUE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TOTAL_VALUE']) || $acleditablecolumns['TOTAL_VALUE'])) }>
                    		    <span class="value-mode">
                                    
        <span class="currency currency-format"><{if $details->TOTAL_VALUE != 0}><{$details->TOTAL_VALUE}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-total-value input-type-currency currency-format" type="text" name="<{$prefix}>adminorder_formdata_TOTAL_VALUE" value="<{if $details->TOTAL_VALUE != 0}><{$details->TOTAL_VALUE}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="currency currency-format"><{if $details->TOTAL_VALUE != 0}><{$details->TOTAL_VALUE}><{/if}></span>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['COUPON_CODE']) && ((isset($aclviewablecolumns['COUPON_CODE']) && $aclviewablecolumns['COUPON_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_CODE']) || $aclviewablecolumns['COUPON_CODE']))) }>
        <{if !isset($columns2hide) || !in_array('COUPON_CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-coupon-code">
	            		        <label class="attribute-name"><{_t('L_COUPON_CODE')}></label>
            </td>
            <td class="form-field form-field-value column-coupon-code" colspan="3">
            	<div class="attribute-line column-coupon-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['COUPON_CODE']) && $acleditablecolumns['COUPON_CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['COUPON_CODE']) || $acleditablecolumns['COUPON_CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->COUPON_CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-coupon-code input-type-text" type="text" name="<{$prefix}>adminorder_formdata_COUPON_CODE" value="<{$details->COUPON_CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->COUPON_CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['COUPON_DISCOUNT']) && ((isset($aclviewablecolumns['COUPON_DISCOUNT']) && $aclviewablecolumns['COUPON_DISCOUNT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_DISCOUNT']) || $aclviewablecolumns['COUPON_DISCOUNT']))) }>
        <{if !isset($columns2hide) || !in_array('COUPON_DISCOUNT', $columns2hide) }>
    		<td class="form-field form-field-label column-coupon-discount">
	            		        <label class="attribute-name"><{_t('L_COUPON_DISCOUNT')}></label>
            </td>
            <td class="form-field form-field-value column-coupon-discount" colspan="3">
            	<div class="attribute-line column-coupon-discount type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['COUPON_DISCOUNT']) && $acleditablecolumns['COUPON_DISCOUNT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['COUPON_DISCOUNT']) || $acleditablecolumns['COUPON_DISCOUNT'])) }>
                    		    <span class="value-mode">
                                    
        <span class="number number-format"><{if $details->COUPON_DISCOUNT != 0}><{$details->COUPON_DISCOUNT}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-coupon-discount input-type-number number-format" type="text" name="<{$prefix}>adminorder_formdata_COUPON_DISCOUNT" value="<{if $details->COUPON_DISCOUNT != 0}><{$details->COUPON_DISCOUNT}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="number number-format"><{if $details->COUPON_DISCOUNT != 0}><{$details->COUPON_DISCOUNT}><{/if}></span>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_PAYMENT_TYPE']) && ((isset($aclviewablecolumns['ID_PAYMENT_TYPE']) && $aclviewablecolumns['ID_PAYMENT_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAYMENT_TYPE']) || $aclviewablecolumns['ID_PAYMENT_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PAYMENT_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-payment-type">
	                    		        	                <{if isset($smarty.session.acl.paymenttype.view)}>
    	                    <{if $details->ID_PAYMENT_TYPE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="paymenttype" data-id="<{$details->refuuid_ID_PAYMENT_TYPE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_PAYMENT_TYPE')}></label>
            </td>
            <td class="form-field form-field-value column-id-payment-type" colspan="3">
            	<div class="attribute-line column-id-payment-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PAYMENT_TYPE']) && $acleditablecolumns['ID_PAYMENT_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PAYMENT_TYPE']) || $acleditablecolumns['ID_PAYMENT_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PAYMENT_TYPE}>
        <{if isset($smarty.session.acl.paymenttype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$details->refuuid_ID_PAYMENT_TYPE}>"><{$details->reftext_ID_PAYMENT_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAYMENT_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAYMENT_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PaymentType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-payment-type" class="input-id-payment-type" name="`$prefix`adminorder_formdata_ID_PAYMENT_TYPE" value=$details->ID_PAYMENT_TYPE text=$details->reftext_ID_PAYMENT_TYPE datasource="PAYMENT_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/new" title="Create a New Payment Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-payment-type input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_PAYMENT_TYPE" value="<{$details->ID_PAYMENT_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PAYMENT_TYPE}>
        <{if isset($smarty.session.acl.paymenttype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$details->refuuid_ID_PAYMENT_TYPE}>"><{$details->reftext_ID_PAYMENT_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAYMENT_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAYMENT_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('CREATION_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-creation-date">
	            		        <label class="attribute-name"><{_t('L_CREATION_DATE')}></label>
            </td>
            <td class="form-field form-field-value column-creation-date" colspan="3">
            	<div class="attribute-line column-creation-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CREATION_DATE']) && $acleditablecolumns['CREATION_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CREATION_DATE']) || $acleditablecolumns['CREATION_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CREATION_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-creation-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_CREATION_DATE" name="<{$prefix}>adminorder_formdata_CREATION_DATE" value="<{$details->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CREATION_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PAYMENT_DATE']) && ((isset($aclviewablecolumns['PAYMENT_DATE']) && $aclviewablecolumns['PAYMENT_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_DATE']) || $aclviewablecolumns['PAYMENT_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('PAYMENT_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-payment-date">
	            		        <label class="attribute-name"><{_t('L_PAYMENT_DATE')}></label>
            </td>
            <td class="form-field form-field-value column-payment-date" colspan="3">
            	<div class="attribute-line column-payment-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PAYMENT_DATE']) && $acleditablecolumns['PAYMENT_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PAYMENT_DATE']) || $acleditablecolumns['PAYMENT_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PAYMENT_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-payment-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PAYMENT_DATE" name="<{$prefix}>adminorder_formdata_PAYMENT_DATE" value="<{$details->PAYMENT_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PAYMENT_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PAYMENT_REF']) && ((isset($aclviewablecolumns['PAYMENT_REF']) && $aclviewablecolumns['PAYMENT_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_REF']) || $aclviewablecolumns['PAYMENT_REF']))) }>
        <{if !isset($columns2hide) || !in_array('PAYMENT_REF', $columns2hide) }>
    		<td class="form-field form-field-label column-payment-ref">
	            		        <label class="attribute-name"><{_t('L_PAYMENT_REF')}></label>
            </td>
            <td class="form-field form-field-value column-payment-ref" colspan="3">
            	<div class="attribute-line column-payment-ref type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PAYMENT_REF']) && $acleditablecolumns['PAYMENT_REF']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PAYMENT_REF']) || $acleditablecolumns['PAYMENT_REF'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PAYMENT_REF|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-payment-ref input-type-text" type="text" name="<{$prefix}>adminorder_formdata_PAYMENT_REF" value="<{$details->PAYMENT_REF|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PAYMENT_REF|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['REFUND_DATE']) && ((isset($aclviewablecolumns['REFUND_DATE']) && $aclviewablecolumns['REFUND_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_DATE']) || $aclviewablecolumns['REFUND_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('REFUND_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-refund-date">
	            		        <label class="attribute-name"><{_t('L_REFUND_DATE')}></label>
            </td>
            <td class="form-field form-field-value column-refund-date" colspan="3">
            	<div class="attribute-line column-refund-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['REFUND_DATE']) && $acleditablecolumns['REFUND_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['REFUND_DATE']) || $acleditablecolumns['REFUND_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->REFUND_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-refund-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_REFUND_DATE" name="<{$prefix}>adminorder_formdata_REFUND_DATE" value="<{$details->REFUND_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->REFUND_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['REFUND_REF']) && ((isset($aclviewablecolumns['REFUND_REF']) && $aclviewablecolumns['REFUND_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_REF']) || $aclviewablecolumns['REFUND_REF']))) }>
        <{if !isset($columns2hide) || !in_array('REFUND_REF', $columns2hide) }>
    		<td class="form-field form-field-label column-refund-ref">
	            		        <label class="attribute-name"><{_t('L_REFUND_REF')}></label>
            </td>
            <td class="form-field form-field-value column-refund-ref" colspan="3">
            	<div class="attribute-line column-refund-ref type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['REFUND_REF']) && $acleditablecolumns['REFUND_REF']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['REFUND_REF']) || $acleditablecolumns['REFUND_REF'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->REFUND_REF|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-refund-ref input-type-text" type="text" name="<{$prefix}>adminorder_formdata_REFUND_REF" value="<{$details->REFUND_REF|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->REFUND_REF|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PROCESSED_DATE']) && ((isset($aclviewablecolumns['PROCESSED_DATE']) && $aclviewablecolumns['PROCESSED_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PROCESSED_DATE']) || $aclviewablecolumns['PROCESSED_DATE']))) }>
        <{if !isset($columns2hide) || !in_array('PROCESSED_DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-processed-date">
	            		        <label class="attribute-name"><{_t('L_PROCESSED_DATE')}></label>
            </td>
            <td class="form-field form-field-value column-processed-date" colspan="3">
            	<div class="attribute-line column-processed-date type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PROCESSED_DATE']) && $acleditablecolumns['PROCESSED_DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PROCESSED_DATE']) || $acleditablecolumns['PROCESSED_DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PROCESSED_DATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-processed-date input-type-date field-date" type="text" id="<{$prefix}>adminorder_formdata_PROCESSED_DATE" name="<{$prefix}>adminorder_formdata_PROCESSED_DATE" value="<{$details->PROCESSED_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PROCESSED_DATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) && $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_ORDER_STATUS', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-order-status">
	                    		                    		        <label class="attribute-name"><{_t('L_ADMIN_ORDER_STATUS')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-order-status" colspan="3">
            	<div class="attribute-line column-id-admin-order-status type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS']) && $acleditablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_ORDER_STATUS']) || $acleditablecolumns['ID_ADMIN_ORDER_STATUS'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_ORDER_STATUS}>
        <{if isset($smarty.session.acl.adminorderstatus.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/view/<{$details->refuuid_ID_ADMIN_ORDER_STATUS}>"><{$details->reftext_ID_ADMIN_ORDER_STATUS|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_ORDER_STATUS|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_ORDER_STATUS}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminOrderStatus')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-order-status" class="input-id-admin-order-status" name="`$prefix`adminorder_formdata_ID_ADMIN_ORDER_STATUS" value=$details->ID_ADMIN_ORDER_STATUS text=$details->reftext_ID_ADMIN_ORDER_STATUS datasource="ADMIN_ORDER_STATUS" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/new" title="Create a New Admin Order Status">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-order-status input-type-text" type="text" name="<{$prefix}>adminorder_formdata_ID_ADMIN_ORDER_STATUS" value="<{$details->ID_ADMIN_ORDER_STATUS|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_ORDER_STATUS}>
        <{if isset($smarty.session.acl.adminorderstatus.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/view/<{$details->refuuid_ID_ADMIN_ORDER_STATUS}>"><{$details->reftext_ID_ADMIN_ORDER_STATUS|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_ORDER_STATUS|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_ORDER_STATUS}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NOTE']) && ((isset($aclviewablecolumns['NOTE']) && $aclviewablecolumns['NOTE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NOTE']) || $aclviewablecolumns['NOTE']))) }>
        <{if !isset($columns2hide) || !in_array('NOTE', $columns2hide) }>
    		<td class="form-field form-field-label column-note">
	            		        <label class="attribute-name"><{_t('L_NOTE')}></label>
            </td>
            <td class="form-field form-field-value column-note" colspan="3">
            	<div class="attribute-line column-note type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['NOTE']) && $acleditablecolumns['NOTE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['NOTE']) || $acleditablecolumns['NOTE'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->NOTE|escape|nl2br|plugin:"adminorder_view_field_NOTE":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-note " id="<{$prefix}>adminorder_formdata_NOTE_<{$tmpid}>" name="<{$prefix}>adminorder_formdata_NOTE" rows="5" ><{$details->NOTE}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->NOTE|escape|nl2br|plugin:"adminorder_view_field_NOTE":$details}>
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
                    <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                    	<div class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                                    		<div class="attribute-value">
                                                <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                    		</div>
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

    <{foreach from=$additional_view_fields item=item}>
    	<div class="attribute-line custom-field type-<{$item.type}>">
    		<label class="attribute-name"><{$item.label}></label>
    		<div class="attribute-value">
                <{$item.value}>
    		</div>
    	</div>
	<{/foreach}>

    <{plugin key="adminorder_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminorderview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminorderview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminorderview_apply_block_visibility(key, value);
            });
        }

        adminorderview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminorderview_update_visibility_settings = function () {
            var settings = adminorderview_get_visibility_settings();

            adminorderview_apply_visibility_settings(settings);
        }

        $(function() {
            adminorderview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminorder/fieldSave",
//                        data: td.find(':input').serialize() + "&adminorder_formdata_UUID=<{$details->UUID}>"
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