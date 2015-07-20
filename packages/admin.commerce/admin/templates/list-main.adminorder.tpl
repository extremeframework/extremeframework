<{plugin key="generic_list_before" args=""}>
<{plugin key="adminorder_list_before" args=""}>

<div class="table-top-scroll">
    <div class="table-top-scroll-div">&nbsp;</div>
</div>

<div class="table-bottom-scroll">
<div class="table-bottom-scroll-div">

<table class="item_list" id="adminorderlist" data-module="adminorder">
	<thead>
	<tr>
		<th class="checkbox"><input type="checkbox" id="chk-adminorder-all" onclick="adminorder_checkall(this.checked)" /></th>
		<th class="indicators"></th>
        <{assign var='colcount' value=1}>
        	                            <{if (in_array('CUSTOMER_ID_COUNTRY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY']) && ((isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) && $aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || $aclviewablecolumns['CUSTOMER_ID_COUNTRY']))) }>
    	            <th class="column-customer-id-country">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_id_country"><{_t('Customer country')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_FIRST_NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) && $aclviewablecolumns['CUSTOMER_FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) || $aclviewablecolumns['CUSTOMER_FIRST_NAME']))) }>
    	            <th class="column-customer-first-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_first_name"><{_t('Customer first name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_LAST_NAME', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) && $aclviewablecolumns['CUSTOMER_LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) || $aclviewablecolumns['CUSTOMER_LAST_NAME']))) }>
    	            <th class="column-customer-last-name">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_last_name"><{_t('Customer last name')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_CITY', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_CITY']) && ((isset($aclviewablecolumns['CUSTOMER_CITY']) && $aclviewablecolumns['CUSTOMER_CITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_CITY']) || $aclviewablecolumns['CUSTOMER_CITY']))) }>
    	            <th class="column-customer-city">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_city"><{_t('Customer city')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_STATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_STATE']) && ((isset($aclviewablecolumns['CUSTOMER_STATE']) && $aclviewablecolumns['CUSTOMER_STATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_STATE']) || $aclviewablecolumns['CUSTOMER_STATE']))) }>
    	            <th class="column-customer-state">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_state"><{_t('Customer state')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_ZIP_CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE']) && ((isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) && $aclviewablecolumns['CUSTOMER_ZIP_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) || $aclviewablecolumns['CUSTOMER_ZIP_CODE']))) }>
    	            <th class="column-customer-zip-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_zip_code"><{_t('Customer zip code')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_EMAIL', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_EMAIL']) && ((isset($aclviewablecolumns['CUSTOMER_EMAIL']) && $aclviewablecolumns['CUSTOMER_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_EMAIL']) || $aclviewablecolumns['CUSTOMER_EMAIL']))) }>
    	            <th class="column-customer-email">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_email"><{_t('Customer email')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CUSTOMER_PHONE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CUSTOMER_PHONE']) && ((isset($aclviewablecolumns['CUSTOMER_PHONE']) && $aclviewablecolumns['CUSTOMER_PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_PHONE']) || $aclviewablecolumns['CUSTOMER_PHONE']))) }>
    	            <th class="column-customer-phone">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/customer_phone"><{_t('Customer phone')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('TOTAL_VALUE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['TOTAL_VALUE']) && ((isset($aclviewablecolumns['TOTAL_VALUE']) && $aclviewablecolumns['TOTAL_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOTAL_VALUE']) || $aclviewablecolumns['TOTAL_VALUE']))) }>
    	            <th class="column-total-value">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/total_value"><{_t('Total value')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('COUPON_CODE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['COUPON_CODE']) && ((isset($aclviewablecolumns['COUPON_CODE']) && $aclviewablecolumns['COUPON_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_CODE']) || $aclviewablecolumns['COUPON_CODE']))) }>
    	            <th class="column-coupon-code">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/coupon_code"><{_t('Coupon code')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('COUPON_DISCOUNT', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['COUPON_DISCOUNT']) && ((isset($aclviewablecolumns['COUPON_DISCOUNT']) && $aclviewablecolumns['COUPON_DISCOUNT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_DISCOUNT']) || $aclviewablecolumns['COUPON_DISCOUNT']))) }>
    	            <th class="column-coupon-discount">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/coupon_discount"><{_t('Coupon discount')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_PAYMENT_TYPE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_PAYMENT_TYPE']) && ((isset($aclviewablecolumns['ID_PAYMENT_TYPE']) && $aclviewablecolumns['ID_PAYMENT_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAYMENT_TYPE']) || $aclviewablecolumns['ID_PAYMENT_TYPE']))) }>
    	            <th class="column-id-payment-type">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/id_payment_type"><{_t('Payment type')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
    	            <th class="column-creation-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/creation_date"><{_t('Creation date')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PAYMENT_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PAYMENT_DATE']) && ((isset($aclviewablecolumns['PAYMENT_DATE']) && $aclviewablecolumns['PAYMENT_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_DATE']) || $aclviewablecolumns['PAYMENT_DATE']))) }>
    	            <th class="column-payment-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/payment_date"><{_t('Payment date')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PAYMENT_REF', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PAYMENT_REF']) && ((isset($aclviewablecolumns['PAYMENT_REF']) && $aclviewablecolumns['PAYMENT_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_REF']) || $aclviewablecolumns['PAYMENT_REF']))) }>
    	            <th class="column-payment-ref">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/payment_ref"><{_t('Payment ref')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('REFUND_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['REFUND_DATE']) && ((isset($aclviewablecolumns['REFUND_DATE']) && $aclviewablecolumns['REFUND_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_DATE']) || $aclviewablecolumns['REFUND_DATE']))) }>
    	            <th class="column-refund-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/refund_date"><{_t('Refund date')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('REFUND_REF', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['REFUND_REF']) && ((isset($aclviewablecolumns['REFUND_REF']) && $aclviewablecolumns['REFUND_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_REF']) || $aclviewablecolumns['REFUND_REF']))) }>
    	            <th class="column-refund-ref">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/refund_ref"><{_t('Refund ref')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('PROCESSED_DATE', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['PROCESSED_DATE']) && ((isset($aclviewablecolumns['PROCESSED_DATE']) && $aclviewablecolumns['PROCESSED_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PROCESSED_DATE']) || $aclviewablecolumns['PROCESSED_DATE']))) }>
    	            <th class="column-processed-date">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/processed_date"><{_t('Processed date')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		                        <{if (in_array('ID_ADMIN_ORDER_STATUS', $filtercolumns)) }>
    	        <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) && $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']))) }>
    	            <th class="column-id-admin-order-status">
            	                    	            <a class="sorter scope-list" href="<{$smarty.const.APPLICATION_URL}>/adminorder/sort/id_admin_order_status"><{_t('Admin order status')}></a>
            	        
                		    				</th>
            		<{assign var='colcount' value=$colcount+1}>
                <{/if}>
            <{/if}>
		        <{foreach from=$customfields item=item}>
            <th class="column-<{$item->COLUMN}>">
	            <{$item->NAME}>
			</th>
			<{assign var='colcount' value=$colcount+1}>
    	<{/foreach}>
		<{plugin key="adminorder_list_columns_headers" args=""}>
		<th class="actions"></th>
	</tr>
	</thead>
    <{php}>
    	$template->assign('summable', array());
    <{/php}>
	<tbody>
	<{if $pagination}>
	<tr class="top-holder" style="display:none">
	    <td colspan="<{$colcount+2}>" style="text-align:center;">
	    	<div class="selectall">All <{$rows|@count}> <{_t('Admin Orders')|strtolower}> on this page are selected. <a onclick="adminorder_selectall()">Select all <{$total}> <{_t('Admin Orders')|strtolower}> in the list</a></div>
	    	<div class="clearselection">All <{$total}> <{_t('Admin Orders')|strtolower}> in the list are selected. <a onclick="adminorder_clearselection()">Clear selection</a></div>
		</td>
	</tr>
	<{/if}>
	<{foreach from=$rows key=counter item=row}>
        <{include file="row-view.adminorder.tpl"}>
	<{/foreach}>
	</tbody>
	<tfoot>
	    	        <{if !$readonly}>
            	<tr class="additem">
            	    <td colspan="2"></td>
            		<td colspan="<{$colcount}>">
                        <span style="cursor:pointer;text-decoration:underline;color:blue" class="adminorder-rowedit-add"><{_t('Add item')}></span>
                	    <span class="adminorder-rowedit-buttons" style="display:none">
                    	    <div class="rowedit-save adminorder-rowedit-save btn btn-success"><{_t('Save')}></div>
                    	    <a class="rowedit-cancel adminorder-rowedit-cancel button-cancel"><{_t('Cancel')}></a>
                        </span>
                        <span class="adminorder-rowedit-message rowedit-message" style="display:none"></span>
                    </td>
            	</tr>
            <{/if}>
        
                    <{if $rows}>
            	<tr style="background-color:#F4FAE1;">
            		<th colspan="2"><{_t('Total')}></th>
            	                	        <{if (in_array('CUSTOMER_ID_COUNTRY', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY']) && ((isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) && $aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || $aclviewablecolumns['CUSTOMER_ID_COUNTRY']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_FIRST_NAME', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) && $aclviewablecolumns['CUSTOMER_FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) || $aclviewablecolumns['CUSTOMER_FIRST_NAME']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_LAST_NAME', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) && $aclviewablecolumns['CUSTOMER_LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) || $aclviewablecolumns['CUSTOMER_LAST_NAME']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_CITY', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_CITY']) && ((isset($aclviewablecolumns['CUSTOMER_CITY']) && $aclviewablecolumns['CUSTOMER_CITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_CITY']) || $aclviewablecolumns['CUSTOMER_CITY']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_STATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_STATE']) && ((isset($aclviewablecolumns['CUSTOMER_STATE']) && $aclviewablecolumns['CUSTOMER_STATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_STATE']) || $aclviewablecolumns['CUSTOMER_STATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_ZIP_CODE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE']) && ((isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) && $aclviewablecolumns['CUSTOMER_ZIP_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) || $aclviewablecolumns['CUSTOMER_ZIP_CODE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_EMAIL', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_EMAIL']) && ((isset($aclviewablecolumns['CUSTOMER_EMAIL']) && $aclviewablecolumns['CUSTOMER_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_EMAIL']) || $aclviewablecolumns['CUSTOMER_EMAIL']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CUSTOMER_PHONE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CUSTOMER_PHONE']) && ((isset($aclviewablecolumns['CUSTOMER_PHONE']) && $aclviewablecolumns['CUSTOMER_PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_PHONE']) || $aclviewablecolumns['CUSTOMER_PHONE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('TOTAL_VALUE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['TOTAL_VALUE']) && ((isset($aclviewablecolumns['TOTAL_VALUE']) && $aclviewablecolumns['TOTAL_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOTAL_VALUE']) || $aclviewablecolumns['TOTAL_VALUE']))) }>
                    	                                		    <th><{if $summable.TOTAL_VALUE}><span class="currency currency-format"><{$summable.TOTAL_VALUE}></span><{/if}></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('COUPON_CODE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['COUPON_CODE']) && ((isset($aclviewablecolumns['COUPON_CODE']) && $aclviewablecolumns['COUPON_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_CODE']) || $aclviewablecolumns['COUPON_CODE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('COUPON_DISCOUNT', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['COUPON_DISCOUNT']) && ((isset($aclviewablecolumns['COUPON_DISCOUNT']) && $aclviewablecolumns['COUPON_DISCOUNT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_DISCOUNT']) || $aclviewablecolumns['COUPON_DISCOUNT']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_PAYMENT_TYPE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_PAYMENT_TYPE']) && ((isset($aclviewablecolumns['ID_PAYMENT_TYPE']) && $aclviewablecolumns['ID_PAYMENT_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAYMENT_TYPE']) || $aclviewablecolumns['ID_PAYMENT_TYPE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PAYMENT_DATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PAYMENT_DATE']) && ((isset($aclviewablecolumns['PAYMENT_DATE']) && $aclviewablecolumns['PAYMENT_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_DATE']) || $aclviewablecolumns['PAYMENT_DATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PAYMENT_REF', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PAYMENT_REF']) && ((isset($aclviewablecolumns['PAYMENT_REF']) && $aclviewablecolumns['PAYMENT_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_REF']) || $aclviewablecolumns['PAYMENT_REF']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('REFUND_DATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['REFUND_DATE']) && ((isset($aclviewablecolumns['REFUND_DATE']) && $aclviewablecolumns['REFUND_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_DATE']) || $aclviewablecolumns['REFUND_DATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('REFUND_REF', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['REFUND_REF']) && ((isset($aclviewablecolumns['REFUND_REF']) && $aclviewablecolumns['REFUND_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_REF']) || $aclviewablecolumns['REFUND_REF']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('PROCESSED_DATE', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['PROCESSED_DATE']) && ((isset($aclviewablecolumns['PROCESSED_DATE']) && $aclviewablecolumns['PROCESSED_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PROCESSED_DATE']) || $aclviewablecolumns['PROCESSED_DATE']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            	        <{if (in_array('ID_ADMIN_ORDER_STATUS', $filtercolumns)) }>
                            <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) && $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']))) }>
                    	                                            <th></th>
                                                            <{/if}>
                        <{/if}>
            		            		<{plugin key="adminorder_list_columns_footers" args=""}>
                    <th></th>
            	</tr>
        	<{/if}>
        
	</tfoot>
</table>
</div>
</div>

<{plugin key="generic_list_after" args=""}>
<{plugin key="adminorder_list_after" args=""}>

<script type="text/javascript">
    $(document).ready(function(){
        // s. Synchronize table top scroll and bottom scroll
		var topScroll = $('.table-top-scroll');
		var bottomScroll = $('.table-bottom-scroll');

		$('.table-top-scroll-div').css('width', $('.table-bottom-scroll-div').outerWidth());
		$('.table-bottom-scroll-div').css('width', $('.table-top-scroll-div').outerWidth());

		topScroll.scroll(function(){
			bottomScroll.scrollLeft(topScroll.scrollLeft());
		});

		bottomScroll.scroll(function(){
			topScroll.scrollLeft(bottomScroll.scrollLeft());
		});

        <{if !$readonly}>
            // x. Double-click on a viewing-row to edit it
            $('#adminorderlist > tbody tr.row-view').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowEdit/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorder-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Double-click on a editing-row to cancel editing
            $('#adminorderlist > tbody tr.rowedit-existing').die('dblclick').live('dblclick', function(){
                var tr = $(this);

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowView/" + tr.data('id'),
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorder-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. Button Save in an editing-row to save the editing item
            $('.adminorder-rowedit-save-existing').die('click').live('click', function(event) {
                event.preventDefault();

                tinyMCE.triggerSave();

                var tr = $(this).closest('tr');

                var fd = new FormData();

                if ($('input[type="file"]').length) {
                    var files = $('input[type="file"]')[0].files;
                    for (var i = 0; i < files.length; i++) {
                        fd.append("file_" + i, files[i]);
                    }
                }

                var others = tr.find(':input').serializeArray();
                $.each(others, function(key, input) {
                    fd.append(input.name, input.value);
                });

                <{if $preset}>
                    fd.append('preset', '<{$preset}>');
                    fd.append('presetvalue', '<{$presetvalue}>');
                <{/if}>

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowSave",
                    data: fd,
                    contentType: false,
                    processData: false
                }).done(function(html) {
                    $('.adminorder-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();
                });
            });

            // x. 'Add item' link to quick-add a new item
            $('.adminorder-rowedit-add').click(function() {
                if ($('#adminorderlist #item_').length > 0) {
                    return;
                }

                $.ajax({
                    type: "get",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowNew",
                    data: "<{if $preset}>preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('#adminorderlist > tbody').append(html);

                    $('.adminorder-rowedit-add').hide();
                    $('.adminorder-rowedit-buttons').show();
                });
            });

            // x. Button Cancel to cancel the quick-add item
            $('.adminorder-rowedit-cancel').click(function(event) {
                event.preventDefault();

                var tr = $('#adminorderlist #item_');

                tr.remove();

                $('.adminorder-rowedit-message').html('').hide();

                $('.adminorder-rowedit-add').show();
                $('.adminorder-rowedit-buttons').hide();
            });

            // x. Button Save to save the quick-add item
            $('.adminorder-rowedit-save').click(function(event) {
                event.preventDefault();

                var tr = $('#adminorderlist #item_');

                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowSave",
                    data: tr.find(':input').serialize() + "<{if $preset}>&preset=<{$preset}>&presetvalue=<{$presetvalue}><{/if}>"
                }).done(function(html) {
                    $('.adminorder-rowedit-message').html('').hide();

                    tr.after(html);
                    tr.remove();

                    if ($('#adminorderlist #item_').length == 0) {
                        $('.adminorder-rowedit-add').show();
                        $('.adminorder-rowedit-buttons').hide();

                        $('.adminorder-list-count, .adminorder-pagination-to').each(function(){
                            var counter = $(this);

                            counter.text(parseInt(counter.text()) + 1);
                        });

                        $('.adminorder-rowedit-add').click();
                    }
                });
            });
        <{/if}>

                    // x. Row expanders
            $('#adminorderlist .list-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);

                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var id = tr.data('id');

                // Hide others
                table.find('tr.row-view').not('tr#item_' + id).find('.list-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.row-embedded-view').not('tr.adminorder-row-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.adminorder-row-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowExpandedView/" + id + "?source=list&colcount=<{$colcount}>&readonly=<{$readonly}>"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
                tr.after(tr_expandable);
            });

            <{if !$readonly}>
                // x. Row embedded view - Edit
                $('#adminorderlist tr.row-embedded-view .row-embedded-view-edit').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowExpandedEdit/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Save
                $('#adminorderlist tr.row-embedded-view .row-embedded-edit-save').die('click').live('click', function(event) {
                    event.preventDefault();

                    tinyMCE.triggerSave();

                    var tr = $(this).closest('tr');

                    $.ajax({
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowExpandedSave?source=list&colcount=" + <{$colcount}>,
                        type: "post",
                        data: new FormData($('#adminorderform')[0]),
                        contentType: false,
                        processData: false
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });

                // x. Row embedded edit - Cancel
                $('#adminorderlist tr.row-embedded-view .row-embedded-edit-cancel').die('click').live('click', function(event) {
                    event.preventDefault();

                    var tr = $(this).closest('tr');
                    var id = tr.data('id');

                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/adminorder/rowExpandedView/" + id + "?source=list&colcount=" + <{$colcount}>
                    }).done(function(html) {
                        tr.after(html);
                        tr.remove();
                    });
                });
            <{/if}>
            });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        // x. Shift-checkbox
        $('.adminorderlistchk').shiftcheckbox();

        // x. CSS for selected rows
        $('.adminorderlistchk').change(function(){
        	if ($(this).is(':checked')) {
    			$(this).closest('tr').addClass('row-selected');
    		} else {
    			$(this).closest('tr').removeClass('row-selected');
    		}
        });

        $('.adminorderlistchk').click(function(){
    		$('#adminorderlist .top-holder').hide();

    	    document.adminorderlist.adminorderlist_selection_selectall.value = 0;
        });
    });
</script>