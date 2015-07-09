<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagelink">

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

<form name="pagelinkform" id="pagelinkform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                        
                            <input class="input-title" type="text" name="<{$prefix}>pagelink_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_PAGE' }>
                	<div class="form-row <{if in_array('ID_PAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAGE')}><{if in_array('ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-page">

                                                    <{if isset($formdata.ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagelink_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'FONT_AWESOME_ICON' }>
                	<div class="form-row <{if in_array('FONT_AWESOME_ICON', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FONT_AWESOME_ICON')}><{if in_array('FONT_AWESOME_ICON', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-font-awesome-icon">

                                                    <{if isset($formdata.FONT_AWESOME_ICON) }>
                            <{assign var='tmp_value' value=$formdata.FONT_AWESOME_ICON}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>pagelink_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LINK_ID_PAGE' }>
                	<div class="form-row <{if in_array('LINK_ID_PAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LINK_PAGE')}><{if in_array('LINK_ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-link-id-page">

                                                    <{if isset($formdata.LINK_ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.LINK_ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-link-id-page" name="`$prefix`pagelink_formdata_LINK_ID_PAGE" value=$formdata.LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'LINK_PATH' }>
                	<div class="form-row <{if in_array('LINK_PATH', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LINK_PATH')}><{if in_array('LINK_PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-link-path">

                                                    <{if isset($formdata.LINK_PATH) }>
                            <{assign var='tmp_value' value=$formdata.LINK_PATH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-link-path" type="text" name="<{$prefix}>pagelink_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_PAGE_LINK_TYPE' }>
                	<div class="form-row <{if in_array('ID_PAGE_LINK_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAGE_LINK_TYPE')}><{if in_array('ID_PAGE_LINK_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-page-link-type">

                                                    <{if isset($formdata.ID_PAGE_LINK_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAGE_LINK_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page-link-type" name="`$prefix`pagelink_formdata_ID_PAGE_LINK_TYPE" value=$formdata.ID_PAGE_LINK_TYPE datasource="PAGE_LINK_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagelink_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#pagelinkform').attr('action', '<{$actionurl}>');$('#pagelinkform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/pagelink/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagelinkform', 'f2', '.button-save');
    	bind_hotkey('#pagelinkform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagelinkform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>