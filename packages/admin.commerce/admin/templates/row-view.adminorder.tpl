<tr id="item_<{$row->UUID}>" class="row-view <{if $counter%2 }>row1<{else}>row0<{/if}> payment-type-<{$row->reftext_ID_PAYMENT_TYPE|ascode}> status-<{$row->reftext_ID_ADMIN_ORDER_STATUS|ascode}>" data-id="<{$row->UUID}>"<{if $row->NOTE}> title="<{$row->NOTE|strip_tags}>"<{/if}>>
    <{assign var='alreadyindent' value=0}>
    <{assign var='alreadyhaslink' value=0}>
	<{assign var="rowsignature" value=$row->UUID}>
	<td class="checkbox">
		<input type="checkbox" id="chk-adminorder-<{$row->UUID}>" class="adminorderlistchk" name="adminorderlist_selection[]" value="<{$row->UUID}>" />
		<input type="hidden" class="column-id" name="<{$prefix}>adminorder_multiformdata_UUID[<{$rowsignature}>]" value="<{$row->UUID}>" />
	</td>
	<td class="indicators"><i class="fa fa-caret-right row-expander list-row-expander"></i></td>
            <{if (in_array('CUSTOMER_ID_COUNTRY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_ID_COUNTRY']) && ((isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) && $aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ID_COUNTRY']) || $aclviewablecolumns['CUSTOMER_ID_COUNTRY']))) }>
                <td class="column column-customer-id-country key " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>	<{$row->CUSTOMER_ID_COUNTRY|escape}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_FIRST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_FIRST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) && $aclviewablecolumns['CUSTOMER_FIRST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_FIRST_NAME']) || $aclviewablecolumns['CUSTOMER_FIRST_NAME']))) }>
                <td class="column column-customer-first-name text " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>	<{$row->CUSTOMER_FIRST_NAME|escape}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_LAST_NAME', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_LAST_NAME']) && ((isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) && $aclviewablecolumns['CUSTOMER_LAST_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_LAST_NAME']) || $aclviewablecolumns['CUSTOMER_LAST_NAME']))) }>
                <td class="column column-customer-last-name text " >
                                        	<span>	<{$row->CUSTOMER_LAST_NAME|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_CITY', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_CITY']) && ((isset($aclviewablecolumns['CUSTOMER_CITY']) && $aclviewablecolumns['CUSTOMER_CITY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_CITY']) || $aclviewablecolumns['CUSTOMER_CITY']))) }>
                <td class="column column-customer-city text " >
                                        	<span>	<{$row->CUSTOMER_CITY|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_STATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_STATE']) && ((isset($aclviewablecolumns['CUSTOMER_STATE']) && $aclviewablecolumns['CUSTOMER_STATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_STATE']) || $aclviewablecolumns['CUSTOMER_STATE']))) }>
                <td class="column column-customer-state text " >
                                        	<span>	<{$row->CUSTOMER_STATE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_ZIP_CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_ZIP_CODE']) && ((isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) && $aclviewablecolumns['CUSTOMER_ZIP_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_ZIP_CODE']) || $aclviewablecolumns['CUSTOMER_ZIP_CODE']))) }>
                <td class="column column-customer-zip-code text " >
                                        	<span>	<{$row->CUSTOMER_ZIP_CODE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_EMAIL', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_EMAIL']) && ((isset($aclviewablecolumns['CUSTOMER_EMAIL']) && $aclviewablecolumns['CUSTOMER_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_EMAIL']) || $aclviewablecolumns['CUSTOMER_EMAIL']))) }>
                <td class="column column-customer-email email " >
                                        	<span>	<{$row->CUSTOMER_EMAIL|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CUSTOMER_PHONE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CUSTOMER_PHONE']) && ((isset($aclviewablecolumns['CUSTOMER_PHONE']) && $aclviewablecolumns['CUSTOMER_PHONE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CUSTOMER_PHONE']) || $aclviewablecolumns['CUSTOMER_PHONE']))) }>
                <td class="column column-customer-phone phone " >
                                        	<span>	<{$row->CUSTOMER_PHONE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('TOTAL_VALUE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['TOTAL_VALUE']) && ((isset($aclviewablecolumns['TOTAL_VALUE']) && $aclviewablecolumns['TOTAL_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOTAL_VALUE']) || $aclviewablecolumns['TOTAL_VALUE']))) }>
                <td class="column column-total-value number " >
                                        	<span>
            <span class="currency currency-format"><{if $row->TOTAL_VALUE != 0}><{$row->TOTAL_VALUE}><{/if}></span>
    
            <{$summable.TOTAL_VALUE = $summable.TOTAL_VALUE + $row->TOTAL_VALUE scope=parent}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('COUPON_CODE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COUPON_CODE']) && ((isset($aclviewablecolumns['COUPON_CODE']) && $aclviewablecolumns['COUPON_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_CODE']) || $aclviewablecolumns['COUPON_CODE']))) }>
                <td class="column column-coupon-code text " >
                                        	<span>	<{$row->COUPON_CODE|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('COUPON_DISCOUNT', $filtercolumns)) }>
            <{if !isset($excludedcolumns['COUPON_DISCOUNT']) && ((isset($aclviewablecolumns['COUPON_DISCOUNT']) && $aclviewablecolumns['COUPON_DISCOUNT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COUPON_DISCOUNT']) || $aclviewablecolumns['COUPON_DISCOUNT']))) }>
                <td class="column column-coupon-discount number " >
                                        	<span>
            <span class="number number-format"><{if $row->COUPON_DISCOUNT != 0}><{$row->COUPON_DISCOUNT}><{/if}></span>
    
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_PAYMENT_TYPE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_PAYMENT_TYPE']) && ((isset($aclviewablecolumns['ID_PAYMENT_TYPE']) && $aclviewablecolumns['ID_PAYMENT_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAYMENT_TYPE']) || $aclviewablecolumns['ID_PAYMENT_TYPE']))) }>
                <td class="column column-id-payment-type reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_PAYMENT_TYPE}>
        <{if $alreadyhaslink && isset($smarty.session.acl.paymenttype.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/paymenttype/view/<{$row->refuuid_ID_PAYMENT_TYPE}>"><{$row->reftext_ID_PAYMENT_TYPE|escape}></a>
        <{else}>
            <{$row->reftext_ID_PAYMENT_TYPE|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_PAYMENT_TYPE}><{$row->ID_PAYMENT_TYPE|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('CREATION_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['CREATION_DATE']) && ((isset($aclviewablecolumns['CREATION_DATE']) && $aclviewablecolumns['CREATION_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CREATION_DATE']) || $aclviewablecolumns['CREATION_DATE']))) }>
                <td class="column column-creation-date datetime " >
                                        	<span>
            <{$row->CREATION_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PAYMENT_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PAYMENT_DATE']) && ((isset($aclviewablecolumns['PAYMENT_DATE']) && $aclviewablecolumns['PAYMENT_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_DATE']) || $aclviewablecolumns['PAYMENT_DATE']))) }>
                <td class="column column-payment-date datetime " >
                                        	<span>
            <{$row->PAYMENT_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PAYMENT_REF', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PAYMENT_REF']) && ((isset($aclviewablecolumns['PAYMENT_REF']) && $aclviewablecolumns['PAYMENT_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PAYMENT_REF']) || $aclviewablecolumns['PAYMENT_REF']))) }>
                <td class="column column-payment-ref text " >
                                        	<span>	<{$row->PAYMENT_REF|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('REFUND_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['REFUND_DATE']) && ((isset($aclviewablecolumns['REFUND_DATE']) && $aclviewablecolumns['REFUND_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_DATE']) || $aclviewablecolumns['REFUND_DATE']))) }>
                <td class="column column-refund-date datetime " >
                                        	<span>
            <{$row->REFUND_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('REFUND_REF', $filtercolumns)) }>
            <{if !isset($excludedcolumns['REFUND_REF']) && ((isset($aclviewablecolumns['REFUND_REF']) && $aclviewablecolumns['REFUND_REF']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['REFUND_REF']) || $aclviewablecolumns['REFUND_REF']))) }>
                <td class="column column-refund-ref text " >
                                        	<span>	<{$row->REFUND_REF|escape}>
</span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('PROCESSED_DATE', $filtercolumns)) }>
            <{if !isset($excludedcolumns['PROCESSED_DATE']) && ((isset($aclviewablecolumns['PROCESSED_DATE']) && $aclviewablecolumns['PROCESSED_DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PROCESSED_DATE']) || $aclviewablecolumns['PROCESSED_DATE']))) }>
                <td class="column column-processed-date datetime " >
                                        	<span>
            <{$row->PROCESSED_DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
    </span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	        <{if (in_array('ID_ADMIN_ORDER_STATUS', $filtercolumns)) }>
            <{if !isset($excludedcolumns['ID_ADMIN_ORDER_STATUS']) && ((isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) && $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_ORDER_STATUS']) || $aclviewablecolumns['ID_ADMIN_ORDER_STATUS']))) }>
                <td class="column column-id-admin-order-status reftext " >
                                        	<span><{if isset($row->INDENT) && !$alreadyindent}><{$row->INDENT}><{assign var='alreadyindent' value=1}><{/if}><{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink }><a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/view/<{$row->UUID}>"><{/if}>    <{if $row->reftext_ID_ADMIN_ORDER_STATUS}>
        <{if $alreadyhaslink && isset($smarty.session.acl.adminorderstatus.view)}>
            <a class="refview scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderstatus/view/<{$row->refuuid_ID_ADMIN_ORDER_STATUS}>"><{$row->reftext_ID_ADMIN_ORDER_STATUS|escape}></a>
        <{else}>
            <{$row->reftext_ID_ADMIN_ORDER_STATUS|escape}>        <{/if}>
    <{else}>
    	<{if $row->ID_ADMIN_ORDER_STATUS}><{$row->ID_ADMIN_ORDER_STATUS|escape}><{/if}>
    <{/if}>
<{if isset($smarty.session.acl.adminorder.view) && !$alreadyhaslink}></a><{assign var='alreadyhaslink' value=1}><{/if}></span>
    				        		</td>
    	    <{/if}>
        <{/if}>
	    <{foreach from=$customfields item=item}>
        <td class="column column-<{$item->COLUMN}>">
            <{CustomFieldHelper::getCustomFieldValue($row, $item->COLUMN)}>
		</td>
	<{/foreach}>
	<{plugin key="adminorder_list_columns_data" args=$row}>
	<td class="actions">
	    <{if isset($smarty.session.acl.adminorder.edit) && WorkflowHelper::isEditable($row->WFID) && !$readonly}>
            <a class="edit scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorder/edit/<{$row->UUID}>"><i class="fa fa-pencil-square-o" title="<{_t('L_EDIT', true)}>"></i></a>
        <{/if}>

        
        <{foreach from=$admin_listitem_actions item=item}>
            <{if empty($item->ACL) || isset($smarty.session.acl.adminorder[$item->ACL])}>
                <{if empty($item->CONSTRING) || condstring_match($item->CONSTRING, $row)}>
	                <a <{if $item->IS_OPEN_IN_NEW_WINDOW}>target="_blank"<{else}>class="scope-main"<{/if}> href="<{if $item->LINK}><{framework_report_link format=$item->LINK data=$row}><{elseif $item->ACTION}><{$smarty.const.APPLICATION_URL}>/adminorder/<{$item->ACTION}>/<{$row->UUID}><{/if}>"><{if $item->FONT_AWESOME_ICON}><i class="fa <{$item->FONT_AWESOME_ICON}>" title="<{_t($item->TITLE, true)}>"></i><{else}><{_t($item->TITLE)}><{/if}></a>
                <{/if}>
            <{/if}>
        <{/foreach}>

        <{if $admin_view_options}>
    	    <span class="dropdown">
    	        <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="button-face"><i class="fa fa-cog"></i></span></a>

    	        <ul class="dropdown-menu pull-right">
    	            <{foreach from=$admin_view_options item=view}>
                        <li><a <{if $view->IS_PRINT_VIEW}>target="_blank"<{/if}> href="<{$smarty.const.APPLICATION_URL}>/booking/view/<{$row->UUID}>/<{$view->CODE}>"><{$view->TITLE}></a></li>
                    <{/foreach}>
                </ul>
    	    </span>
        <{/if}>
	</td>
</tr>