<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-adminlayoutfield">

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

<form name="adminlayoutfieldform" id="adminlayoutfieldform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'MODULE' }>
                	<div class="form-row <{if in_array('MODULE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_MODULE')}><{if in_array('MODULE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-module">

                                                    <{if isset($formdata.MODULE) }>
                            <{assign var='tmp_value' value=$formdata.MODULE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-module" name="`$prefix`adminlayoutfield_formdata_MODULE" value=$formdata.MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_ADMIN_LAYOUT_SECTION' }>
                	<div class="form-row <{if in_array('ID_ADMIN_LAYOUT_SECTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADMIN_LAYOUT_SECTION')}><{if in_array('ID_ADMIN_LAYOUT_SECTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-admin-layout-section">

                                                    <{if isset($formdata.ID_ADMIN_LAYOUT_SECTION) }>
                            <{assign var='tmp_value' value=$formdata.ID_ADMIN_LAYOUT_SECTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-admin-layout-section" name="`$prefix`adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value=$formdata.ID_ADMIN_LAYOUT_SECTION datasource="ADMIN_LAYOUT_SECTION" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'COLUMN' }>
                	<div class="form-row <{if in_array('COLUMN', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_COLUMN')}><{if in_array('COLUMN', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-column">

                                                    <{if isset($formdata.COLUMN) }>
                            <{assign var='tmp_value' value=$formdata.COLUMN}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-column" type="text" name="<{$prefix}>adminlayoutfield_formdata_COLUMN" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'POSITION' }>
                	<div class="form-row <{if in_array('POSITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_POSITION')}><{if in_array('POSITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-position">

                                                    <{if isset($formdata.POSITION) }>
                            <{assign var='tmp_value' value=$formdata.POSITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-position" type="text" name="<{$prefix}>adminlayoutfield_formdata_POSITION" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ORDERING' }>
                	<div class="form-row <{if in_array('ORDERING', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ORDERING')}><{if in_array('ORDERING', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-ordering">

                                                    <{if isset($formdata.ORDERING) }>
                            <{assign var='tmp_value' value=$formdata.ORDERING}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>adminlayoutfield_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#adminlayoutfieldform').attr('action', '<{$actionurl}>');$('#adminlayoutfieldform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlayoutfieldform', 'f2', '.button-save');
    	bind_hotkey('#adminlayoutfieldform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlayoutfieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>