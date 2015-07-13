<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagegallery">

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

<form name="pagegalleryform" id="pagegalleryform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                        
                            <input class="input-title" type="text" name="<{$prefix}>pagegallery_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagegallery_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                <input class="input-image" type="text" name="<{$prefix}>pagegallery_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>pagegallery_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagegallery_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pagegalleryform.<{$prefix}>pagegallery_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagegallery_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagegallery_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-link-id-page" name="`$prefix`pagegallery_formdata_LINK_ID_PAGE" value=$formdata.LINK_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-link-path" type="text" name="<{$prefix}>pagegallery_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <textarea class="input-description" id="<{$prefix}>pagegallery_formdata_DESCRIPTION" name="<{$prefix}>pagegallery_formdata_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>pagegallery_formdata_DESCRIPTION')</script>                        
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagegallery_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#pagegalleryform').attr('action', '<{$actionurl}>');$('#pagegalleryform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagegallery/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagegalleryform', 'f2', '.button-save');
    	bind_hotkey('#pagegalleryform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagegalleryform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>