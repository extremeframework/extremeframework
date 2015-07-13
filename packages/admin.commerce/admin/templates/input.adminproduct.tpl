<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminproduct">

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

<form name="adminproductform" id="adminproductform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'TITLE' }>
                	<div class="form-row <{if in_array('TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TITLE')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-title">

                                                    <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>adminproduct_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TAG_LINE' }>
                	<div class="form-row <{if in_array('TAG_LINE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TAG_LINE')}><{if in_array('TAG_LINE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-tag-line">

                                                    <{if isset($formdata.TAG_LINE) }>
                            <{assign var='tmp_value' value=$formdata.TAG_LINE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>adminproduct_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IMAGE' }>
                	<div class="form-row <{if in_array('IMAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IMAGE')}><{if in_array('IMAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-image">

                                                    <{if isset($formdata.IMAGE) }>
                            <{assign var='tmp_value' value=$formdata.IMAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-image" type="text" name="<{$prefix}>adminproduct_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>adminproduct_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>adminproduct_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.adminproductform.<{$prefix}>adminproduct_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>adminproduct_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>adminproduct_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LIST_PRICE' }>
                	<div class="form-row <{if in_array('LIST_PRICE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LIST_PRICE')}><{if in_array('LIST_PRICE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-list-price">

                                                    <{if isset($formdata.LIST_PRICE) }>
                            <{assign var='tmp_value' value=$formdata.LIST_PRICE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-list-price currency-format" type="text" name="<{$prefix}>adminproduct_formdata_LIST_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
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
                                                    
                            <input class="input-price currency-format" type="text" name="<{$prefix}>adminproduct_formdata_PRICE" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'DESCRIPTION' }>
                	<div class="form-row <{if in_array('DESCRIPTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_DESCRIPTION')}><{if in_array('DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-description">

                                                    <{if isset($formdata.DESCRIPTION) }>
                            <{assign var='tmp_value' value=$formdata.DESCRIPTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-description" id="<{$prefix}>adminproduct_formdata_DESCRIPTION" name="<{$prefix}>adminproduct_formdata_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>adminproduct_formdata_DESCRIPTION')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PRODUCT_ID_PAGE' }>
                	<div class="form-row <{if in_array('PRODUCT_ID_PAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PRODUCT_PAGE')}><{if in_array('PRODUCT_ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-product-id-page">

                                                    <{if isset($formdata.PRODUCT_ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.PRODUCT_ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-product-id-page" name="`$prefix`adminproduct_formdata_PRODUCT_ID_PAGE" value=$formdata.PRODUCT_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminproductform').attr('action', '<{$actionurl}>');$('#adminproductform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminproduct/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminproductform', 'f2', '.button-save');
    	bind_hotkey('#adminproductform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminproductform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>