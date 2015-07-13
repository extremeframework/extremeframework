<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagesection">

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

<form name="pagesectionform" id="pagesectionform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
                        
                            <input class="input-title" type="text" name="<{$prefix}>pagesection_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagesection_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'CODE' }>
                	<div class="form-row <{if in_array('CODE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CODE')}><{if in_array('CODE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-code">

                                                    <{if isset($formdata.CODE) }>
                            <{assign var='tmp_value' value=$formdata.CODE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-code" type="text" name="<{$prefix}>pagesection_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'PARENT' }>
                	<div class="form-row <{if in_array('PARENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PARENT')}><{if in_array('PARENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-parent">

                                                    <{if isset($formdata.PARENT) }>
                            <{assign var='tmp_value' value=$formdata.PARENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`pagesection_formdata_PARENT" value=$formdata.PARENT datasource="PAGE_SECTION" valuecol="CODE" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>pagesection_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                <input class="input-image" type="text" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>pagesection_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagesection_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
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
                        
                            <input class="input-font-awesome-icon" type="text" name="<{$prefix}>pagesection_formdata_FONT_AWESOME_ICON" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                <input class="input-background-image" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagesection_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagesection_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
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
                        
                            <input class="input-background-color" type="text" name="<{$prefix}>pagesection_formdata_BACKGROUND_COLOR" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="100"<{/if}> />
                        
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
                                <input class="input-video" type="text" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>pagesection_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>pagesection_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.pagesectionform.<{$prefix}>pagesection_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>pagesection_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagesection_formdata_VIDEO" value="<{$tmp_value}>" />
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
                        
                            <textarea class="input-content" id="<{$prefix}>pagesection_formdata_CONTENT" name="<{$prefix}>pagesection_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>pagesection_formdata_CONTENT')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TAGS' }>
                	<div class="form-row <{if in_array('TAGS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TAGS')}><{if in_array('TAGS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-tags">

                                                    <{if isset($formdata.TAGS) }>
                            <{assign var='tmp_value' value=$formdata.TAGS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tags" type="text" name="<{$prefix}>pagesection_formdata_TAGS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VIEW_MORE_TITLE' }>
                	<div class="form-row <{if in_array('VIEW_MORE_TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VIEW_MORE_TITLE')}><{if in_array('VIEW_MORE_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-view-more-title">

                                                    <{if isset($formdata.VIEW_MORE_TITLE) }>
                            <{assign var='tmp_value' value=$formdata.VIEW_MORE_TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'VIEW_MORE_ID_PAGE' }>
                	<div class="form-row <{if in_array('VIEW_MORE_ID_PAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VIEW_MORE_PAGE')}><{if in_array('VIEW_MORE_ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-view-more-id-page">

                                                    <{if isset($formdata.VIEW_MORE_ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.VIEW_MORE_ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`pagesection_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'VIEW_MORE_LINK' }>
                	<div class="form-row <{if in_array('VIEW_MORE_LINK', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_VIEW_MORE_LINK')}><{if in_array('VIEW_MORE_LINK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-view-more-link">

                                                    <{if isset($formdata.VIEW_MORE_LINK) }>
                            <{assign var='tmp_value' value=$formdata.VIEW_MORE_LINK}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-view-more-link" type="text" name="<{$prefix}>pagesection_formdata_VIEW_MORE_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'HIDE_TITLE' }>
                	<div class="form-row <{if in_array('HIDE_TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_HIDE_TITLE')}><{if in_array('HIDE_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-hide-title">

                                                    <{if isset($formdata.HIDE_TITLE) }>
                            <{assign var='tmp_value' value=$formdata.HIDE_TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-hide-title" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" >
                                    <option value="1" <{if $formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="1" <{if $formdata.HIDE_TITLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>pagesection_formdata_HIDE_TITLE" value="0" <{if !$formdata.HIDE_TITLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'IS_TAB_ANCHOR_SECTION' }>
                	<div class="form-row <{if in_array('IS_TAB_ANCHOR_SECTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_IS_TAB_ANCHOR_SECTION')}><{if in_array('IS_TAB_ANCHOR_SECTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-is-tab-anchor-section">

                                                    <{if isset($formdata.IS_TAB_ANCHOR_SECTION) }>
                            <{assign var='tmp_value' value=$formdata.IS_TAB_ANCHOR_SECTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-is-tab-anchor-section" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" >
                                    <option value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-is-tab-anchor-section" type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="1" <{if $formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>pagesection_formdata_IS_TAB_ANCHOR_SECTION" value="0" <{if !$formdata.IS_TAB_ANCHOR_SECTION}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'TAB_ANCHOR_TITLE' }>
                	<div class="form-row <{if in_array('TAB_ANCHOR_TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TAB_ANCHOR_TITLE')}><{if in_array('TAB_ANCHOR_TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-tab-anchor-title">

                                                    <{if isset($formdata.TAB_ANCHOR_TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TAB_ANCHOR_TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-tab-anchor-title" type="text" name="<{$prefix}>pagesection_formdata_TAB_ANCHOR_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagesection_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#pagesectionform').attr('action', '<{$actionurl}>');$('#pagesectionform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagesection/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagesectionform', 'f2', '.button-save');
    	bind_hotkey('#pagesectionform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagesectionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>