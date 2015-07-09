<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminorderitem">

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

<{foreach from=$messages key=ignored item=message}>
    <li><{$message}></li>
<{/foreach}>

<{if !isset($prefix) }>
    <{assign var='prefix' value=''}>
<{/if}>

<form name="adminorderitemform" id="adminorderitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

<!-- Details -->
<div class="section">
    <div>
        <{foreach from=$columns item=column }>
                <{if $columnsettings.$column }>
                	<div class="form-row <{if in_array($column, $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{$columnsettings.$column->text}><{if in_array($column, $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-<{$columnsettings.$column->code}>">
                		    <{include file="input-item.tpl"}>
                		</div>
                	</div>
            
                <{elseif $column == 'ID_ADMIN_ORDER' }>
                	<div class="form-row <{if in_array('ID_ADMIN_ORDER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_ORDER')}><{if in_array('ID_ADMIN_ORDER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-order">

                                                    <{if isset($formdata.ID_ADMIN_ORDER) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_ORDER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-order" name="`$prefix`adminorderitem_formdata_ID_ADMIN_ORDER" value=$formdata.ID_ADMIN_ORDER datasource="ADMIN_ORDER" valuecol="ID" textcol="CUSTOMER_FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_PRODUCT' }>
                	<div class="form-row <{if in_array('ID_ADMIN_PRODUCT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_PRODUCT')}><{if in_array('ID_ADMIN_PRODUCT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-product">

                                                    <{if isset($formdata.ID_ADMIN_PRODUCT) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_PRODUCT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-product" name="`$prefix`adminorderitem_formdata_ID_ADMIN_PRODUCT" value=$formdata.ID_ADMIN_PRODUCT datasource="ADMIN_PRODUCT" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'QUANTITY' }>
                	<div class="form-row <{if in_array('QUANTITY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_QUANTITY')}><{if in_array('QUANTITY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-quantity">

                                                    <{if isset($formdata.QUANTITY) }>
                            <{assign var='tmp_value' value=$formdata.QUANTITY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-quantity number-format" type="text" name="<{$prefix}>adminorderitem_formdata_QUANTITY" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PRICE' }>
                	<div class="form-row <{if in_array('PRICE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PRICE')}><{if in_array('PRICE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-price">

                                                    <{if isset($formdata.PRICE) }>
                            <{assign var='tmp_value' value=$formdata.PRICE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-price currency-format" type="text" name="<{$prefix}>adminorderitem_formdata_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminorderitemform').attr('action', '<{$actionurl}>');$('#adminorderitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminorderitem/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminorderitemform', 'f2', '.button-save');
    	bind_hotkey('#adminorderitemform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminorderitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>