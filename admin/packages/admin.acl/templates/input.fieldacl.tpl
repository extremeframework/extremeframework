<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-fieldacl">

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

<form name="fieldaclform" id="fieldaclform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'MODULE' }>
                	<div class="form-row <{if in_array('MODULE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_MODULE')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-module">

                                                    <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`fieldacl_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ACTION' }>
                	<div class="form-row <{if in_array('ACTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ACTION')}><{if in_array('ACTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-action">

                                                    <{if isset($formdata.ACTION) }>
                            <{assign var='tmp_value' value=$formdata.ACTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-action" type="text" name="<{$prefix}>fieldacl_formdata_ACTION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER_GROUP' }>
                	<div class="form-row <{if in_array('ID_USER_GROUP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_USER_GROUP')}><{if in_array('ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user-group">

                                                    <{if isset($formdata.ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user-group" name="`$prefix`fieldacl_formdata_ID_USER_GROUP" value=$formdata.ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_USER' }>
                	<div class="form-row <{if in_array('ID_USER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_USER')}><{if in_array('ID_USER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-user">

                                                    <{if isset($formdata.ID_USER) }>
                            <{assign var='tmp_value' value=$formdata.ID_USER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-user" name="`$prefix`fieldacl_formdata_ID_USER" value=$formdata.ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'FIELDS' }>
                	<div class="form-row <{if in_array('FIELDS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FIELDS')}><{if in_array('FIELDS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-fields">

                                                    <{if isset($formdata.FIELDS) }>
                            <{assign var='tmp_value' value=$formdata.FIELDS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-fields" id="<{$prefix}>fieldacl_formdata_FIELDS" name="<{$prefix}>fieldacl_formdata_FIELDS" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>fieldacl_formdata_FIELDS')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ACL_TYPE' }>
                	<div class="form-row <{if in_array('ID_ACL_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ACL_TYPE')}><{if in_array('ID_ACL_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-acl-type">

                                                    <{if isset($formdata.ID_ACL_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_ACL_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-acl-type" name="`$prefix`fieldacl_formdata_ID_ACL_TYPE" value=$formdata.ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#fieldaclform').attr('action', '<{$actionurl}>');$('#fieldaclform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/fieldacl/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#fieldaclform', 'f2', '.button-save');
    	bind_hotkey('#fieldaclform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#fieldaclform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>