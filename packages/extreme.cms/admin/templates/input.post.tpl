<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-post">

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

<form name="postform" id="postform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                		<label><{label key="L_TITLE"}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-title">

                                                    <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>post_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'SLUG' }>
                	<div class="form-row <{if in_array('SLUG', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_SLUG"}><{if in_array('SLUG', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-slug">

                                                    <{if isset($formdata.SLUG) }>
                            <{assign var='tmp_value' value=$formdata.SLUG}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-slug" type="text" name="<{$prefix}>post_formdata_SLUG" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_POST_TYPE' }>
                	<div class="form-row <{if in_array('ID_POST_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_POST_TYPE"}><{if in_array('ID_POST_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post-type">

                                                    <{if isset($formdata.ID_POST_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-type" name="`$prefix`post_formdata_ID_POST_TYPE" value=$formdata.ID_POST_TYPE datasource="POST_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_POST_CATEGORY' }>
                	<div class="form-row <{if in_array('ID_POST_CATEGORY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_POST_CATEGORY"}><{if in_array('ID_POST_CATEGORY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post-category">

                                                    <{if isset($formdata.ID_POST_CATEGORY) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_CATEGORY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`post_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'IMAGE' }>
                	<div class="form-row <{if in_array('IMAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IMAGE"}><{if in_array('IMAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-image">

                                                    <{if isset($formdata.IMAGE) }>
                            <{assign var='tmp_value' value=$formdata.IMAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-image" type="text" name="<{$prefix}>post_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>post_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>post_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.postform.<{$prefix}>post_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>post_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>post_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'META_KEYWORDS' }>
                	<div class="form-row <{if in_array('META_KEYWORDS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_META_KEYWORDS"}><{if in_array('META_KEYWORDS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-meta-keywords">

                                                    <{if isset($formdata.META_KEYWORDS) }>
                            <{assign var='tmp_value' value=$formdata.META_KEYWORDS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>post_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'META_DESCRIPTION' }>
                	<div class="form-row <{if in_array('META_DESCRIPTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_META_DESCRIPTION"}><{if in_array('META_DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-meta-description">

                                                    <{if isset($formdata.META_DESCRIPTION) }>
                            <{assign var='tmp_value' value=$formdata.META_DESCRIPTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-meta-description" id="<{$prefix}>post_formdata_META_DESCRIPTION" name="<{$prefix}>post_formdata_META_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'EXCERPT' }>
                	<div class="form-row <{if in_array('EXCERPT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_EXCERPT"}><{if in_array('EXCERPT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-excerpt">

                                                    <{if isset($formdata.EXCERPT) }>
                            <{assign var='tmp_value' value=$formdata.EXCERPT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-excerpt" id="<{$prefix}>post_formdata_EXCERPT" name="<{$prefix}>post_formdata_EXCERPT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>post_formdata_EXCERPT')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CONTENT' }>
                	<div class="form-row <{if in_array('CONTENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CONTENT"}><{if in_array('CONTENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-content">

                                                    <{if isset($formdata.CONTENT) }>
                            <{assign var='tmp_value' value=$formdata.CONTENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-content" id="<{$prefix}>post_formdata_CONTENT" name="<{$prefix}>post_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>post_formdata_CONTENT')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TAGS' }>
                	<div class="form-row <{if in_array('TAGS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TAGS"}><{if in_array('TAGS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-tags">

                                                    <{if isset($formdata.TAGS) }>
                            <{assign var='tmp_value' value=$formdata.TAGS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tags" type="text" name="<{$prefix}>post_formdata_TAGS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'AUTHOR' }>
                	<div class="form-row <{if in_array('AUTHOR', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_AUTHOR"}><{if in_array('AUTHOR', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-author">

                                                    <{if isset($formdata.AUTHOR) }>
                            <{assign var='tmp_value' value=$formdata.AUTHOR}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-author" type="text" name="<{$prefix}>post_formdata_AUTHOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'EXTERNAL_LINK' }>
                	<div class="form-row <{if in_array('EXTERNAL_LINK', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_EXTERNAL_LINK"}><{if in_array('EXTERNAL_LINK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-external-link">

                                                    <{if isset($formdata.EXTERNAL_LINK) }>
                            <{assign var='tmp_value' value=$formdata.EXTERNAL_LINK}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-external-link" type="text" name="<{$prefix}>post_formdata_EXTERNAL_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_TEMPLATE' }>
                	<div class="form-row <{if in_array('ID_TEMPLATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_TEMPLATE"}><{if in_array('ID_TEMPLATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-template">

                                                    <{if isset($formdata.ID_TEMPLATE) }>
                            <{assign var='tmp_value' value=$formdata.ID_TEMPLATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`post_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'CREATION_DATE' }>
                	<div class="form-row <{if in_array('CREATION_DATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_CREATION_DATE"}><{if in_array('CREATION_DATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-creation-date">

                                                    <{if isset($formdata.CREATION_DATE) }>
                            <{assign var='tmp_value' value=$formdata.CREATION_DATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-creation-date" type="text" name="<{$prefix}>post_formdata_CREATION_DATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LATEST_UPDATE' }>
                	<div class="form-row <{if in_array('LATEST_UPDATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_LATEST_UPDATE"}><{if in_array('LATEST_UPDATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-latest-update">

                                                    <{if isset($formdata.LATEST_UPDATE) }>
                            <{assign var='tmp_value' value=$formdata.LATEST_UPDATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-latest-update" type="text" name="<{$prefix}>post_formdata_LATEST_UPDATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_FEATURED' }>
                	<div class="form-row <{if in_array('IS_FEATURED', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{label key="L_IS_FEATURED"}><{if in_array('IS_FEATURED', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-featured">

                                                    <{if isset($formdata.IS_FEATURED) }>
                            <{assign var='tmp_value' value=$formdata.IS_FEATURED}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-featured" name="<{$prefix}>post_formdata_IS_FEATURED" >
                                    <option value="1" <{if $formdata.IS_FEATURED}>selected="selected"<{/if}>><{label key="L_YES"}></option>
                                    <option value="0" <{if !$formdata.IS_FEATURED}>selected="selected"<{/if}>><{label key="L_NO"}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-featured" type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="1" <{if $formdata.IS_FEATURED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>post_formdata_IS_FEATURED" value="0" <{if !$formdata.IS_FEATURED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#postform').attr('action', '<{$actionurl}>');$('#postform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main" href="<{$smarty.const.APPLICATION_URL}>/post/cancel/?back=0"><span class="button-face"><{label key="L_CANCEL"}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#postform', 'f2', '.button-save');
    	bind_hotkey('#postform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#postform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>