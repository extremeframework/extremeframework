<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-postsection">

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

<form name="postsectionform" id="postsectionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                        
                            <input class="input-title" type="text" name="<{$prefix}>postsection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_POST' }>
                	<div class="form-row <{if in_array('ID_POST', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_POST')}><{if in_array('ID_POST', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post">

                                                    <{if isset($formdata.ID_POST) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`postsection_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>postsection_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                <input class="input-image" type="text" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>postsection_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>postsection_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'BACKGROUND_IMAGE' }>
                	<div class="form-row <{if in_array('BACKGROUND_IMAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_BACKGROUND_IMAGE')}><{if in_array('BACKGROUND_IMAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-background-image">

                                                    <{if isset($formdata.BACKGROUND_IMAGE) }>
                            <{assign var='tmp_value' value=$formdata.BACKGROUND_IMAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-background-image" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>postsection_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>postsection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'BACKGROUND_COLOR' }>
                	<div class="form-row <{if in_array('BACKGROUND_COLOR', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_BACKGROUND_COLOR')}><{if in_array('BACKGROUND_COLOR', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-background-color">

                                                    <{if isset($formdata.BACKGROUND_COLOR) }>
                            <{assign var='tmp_value' value=$formdata.BACKGROUND_COLOR}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-background-color" type="text" name="<{$prefix}>postsection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VIDEO' }>
                	<div class="form-row <{if in_array('VIDEO', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VIDEO')}><{if in_array('VIDEO', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-video">

                                                    <{if isset($formdata.VIDEO) }>
                            <{assign var='tmp_value' value=$formdata.VIDEO}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-video" type="text" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>postsection_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>postsection_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.postsectionform.<{$prefix}>postsection_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>postsection_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>postsection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONTENT' }>
                	<div class="form-row <{if in_array('CONTENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CONTENT')}><{if in_array('CONTENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-content">

                                                    <{if isset($formdata.CONTENT) }>
                            <{assign var='tmp_value' value=$formdata.CONTENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-content" id="<{$prefix}>postsection_formdata_CONTENT" name="<{$prefix}>postsection_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>postsection_formdata_CONTENT')</script>                        
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
                        
                            <input class="input-link-path" type="text" name="<{$prefix}>postsection_formdata_LINK_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>postsection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#postsectionform').attr('action', '<{$actionurl}>');$('#postsectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/postsection/cancel/?back=0"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postsectionform', 'f2', '.button-save');
    	bind_hotkey('#postsectionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#postsectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>