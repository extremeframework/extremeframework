<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-page">

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

<form name="pageform" id="pageform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'NAME' }>
                	<div class="form-row <{if in_array('NAME', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAGE_NAME')}><{if in_array('NAME', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-name">

                                                    <{if isset($formdata.NAME) }>
                            <{assign var='tmp_value' value=$formdata.NAME}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-name" type="text" name="<{$prefix}>page_formdata_NAME" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-title" type="text" name="<{$prefix}>page_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`page_formdata_PARENT" value=$formdata.PARENT datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'SLUG' }>
                	<div class="form-row <{if in_array('SLUG', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_SLUG')}><{if in_array('SLUG', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-slug">

                                                    <{if isset($formdata.SLUG) }>
                            <{assign var='tmp_value' value=$formdata.SLUG}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-slug" type="text" name="<{$prefix}>page_formdata_SLUG" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>page_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'THUMB' }>
                	<div class="form-row <{if in_array('THUMB', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_THUMB')}><{if in_array('THUMB', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-thumb">

                                                    <{if isset($formdata.THUMB) }>
                            <{assign var='tmp_value' value=$formdata.THUMB}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_image_input}>
                                <input class="input-thumb" type="text" name="<{$prefix}>page_formdata_THUMB" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-thumb" type="file" name="<{$prefix}>page_formdata_THUMB" />
                                <span class="input-sizes-width-height"><input type="text" name="THUMB[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="THUMB[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.THUMB}><div style="clear:both"></div><span id="<{$prefix}>page_THUMB"><{media src=$formdata.THUMB}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_THUMB, '<{$tmp_value}>', '<{$prefix}>page_THUMB')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_THUMB" value="<{$tmp_value}>" />
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
                                <input class="input-background-image" type="text" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-background-image" type="file" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="BACKGROUND_IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="BACKGROUND_IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.BACKGROUND_IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_BACKGROUND_IMAGE"><{media src=$formdata.BACKGROUND_IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_BACKGROUND_IMAGE, '<{$tmp_value}>', '<{$prefix}>page_BACKGROUND_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_BACKGROUND_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
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
                                <input class="input-image" type="text" name="<{$prefix}>page_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>page_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>page_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>page_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
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
                                <input class="input-video" type="text" name="<{$prefix}>page_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-video" type="file" name="<{$prefix}>page_formdata_VIDEO" />
                                <span class="input-sizes-width-height"><input type="text" name="VIDEO[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="VIDEO[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.VIDEO}><div style="clear:both"></div><span id="<{$prefix}>page_VIDEO"><{media src=$formdata.VIDEO}> <a onclick="remove_attachment(document.pageform.<{$prefix}>page_formdata_VIDEO, '<{$tmp_value}>', '<{$prefix}>page_VIDEO')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>page_formdata_VIDEO" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'META_KEYWORDS' }>
                	<div class="form-row <{if in_array('META_KEYWORDS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_META_KEYWORDS')}><{if in_array('META_KEYWORDS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-meta-keywords">

                                                    <{if isset($formdata.META_KEYWORDS) }>
                            <{assign var='tmp_value' value=$formdata.META_KEYWORDS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-meta-keywords" type="text" name="<{$prefix}>page_formdata_META_KEYWORDS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'META_DESCRIPTION' }>
                	<div class="form-row <{if in_array('META_DESCRIPTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_META_DESCRIPTION')}><{if in_array('META_DESCRIPTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-meta-description">

                                                    <{if isset($formdata.META_DESCRIPTION) }>
                            <{assign var='tmp_value' value=$formdata.META_DESCRIPTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-meta-description" id="<{$prefix}>page_formdata_META_DESCRIPTION" name="<{$prefix}>page_formdata_META_DESCRIPTION" rows="5" ><{$tmp_value}></textarea>
                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'INTRODUCTION' }>
                	<div class="form-row <{if in_array('INTRODUCTION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_INTRODUCTION')}><{if in_array('INTRODUCTION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-introduction">

                                                    <{if isset($formdata.INTRODUCTION) }>
                            <{assign var='tmp_value' value=$formdata.INTRODUCTION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-introduction" id="<{$prefix}>page_formdata_INTRODUCTION" name="<{$prefix}>page_formdata_INTRODUCTION" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_INTRODUCTION')</script>                        
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
                        
                            <textarea class="input-content" id="<{$prefix}>page_formdata_CONTENT" name="<{$prefix}>page_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_CONTENT')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'FOOTER' }>
                	<div class="form-row <{if in_array('FOOTER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_FOOTER')}><{if in_array('FOOTER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-footer">

                                                    <{if isset($formdata.FOOTER) }>
                            <{assign var='tmp_value' value=$formdata.FOOTER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-footer" id="<{$prefix}>page_formdata_FOOTER" name="<{$prefix}>page_formdata_FOOTER" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>page_formdata_FOOTER')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_TEMPLATE' }>
                	<div class="form-row <{if in_array('ID_TEMPLATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TEMPLATE')}><{if in_array('ID_TEMPLATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-template">

                                                    <{if isset($formdata.ID_TEMPLATE) }>
                            <{assign var='tmp_value' value=$formdata.ID_TEMPLATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-template" name="`$prefix`page_formdata_ID_TEMPLATE" value=$formdata.ID_TEMPLATE datasource="TEMPLATE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ADDITIONAL_CSS' }>
                	<div class="form-row <{if in_array('ADDITIONAL_CSS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ADDITIONAL_CSS')}><{if in_array('ADDITIONAL_CSS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-additional-css">

                                                    <{if isset($formdata.ADDITIONAL_CSS) }>
                            <{assign var='tmp_value' value=$formdata.ADDITIONAL_CSS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-additional-css" id="<{$prefix}>page_formdata_ADDITIONAL_CSS" name="<{$prefix}>page_formdata_ADDITIONAL_CSS" rows="5" ><{$tmp_value}></textarea>
                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOM_TOP_ID_MENU' }>
                	<div class="form-row <{if in_array('CUSTOM_TOP_ID_MENU', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOM_TOP_MENU')}><{if in_array('CUSTOM_TOP_ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-custom-top-id-menu">

                                                    <{if isset($formdata.CUSTOM_TOP_ID_MENU) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOM_TOP_ID_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-custom-top-id-menu" name="`$prefix`page_formdata_CUSTOM_TOP_ID_MENU" value=$formdata.CUSTOM_TOP_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOM_SIDE_ID_MENU' }>
                	<div class="form-row <{if in_array('CUSTOM_SIDE_ID_MENU', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOM_SIDE_MENU')}><{if in_array('CUSTOM_SIDE_ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-custom-side-id-menu">

                                                    <{if isset($formdata.CUSTOM_SIDE_ID_MENU) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOM_SIDE_ID_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-custom-side-id-menu" name="`$prefix`page_formdata_CUSTOM_SIDE_ID_MENU" value=$formdata.CUSTOM_SIDE_ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-view-more-title" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-view-more-id-page" name="`$prefix`page_formdata_VIEW_MORE_ID_PAGE" value=$formdata.VIEW_MORE_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-view-more-link" type="text" name="<{$prefix}>page_formdata_VIEW_MORE_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LATEST_UPDATE' }>
                	<div class="form-row <{if in_array('LATEST_UPDATE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LATEST_UPDATE')}><{if in_array('LATEST_UPDATE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-latest-update">

                                                    <{if isset($formdata.LATEST_UPDATE) }>
                            <{assign var='tmp_value' value=$formdata.LATEST_UPDATE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-latest-update" type="text" name="<{$prefix}>page_formdata_LATEST_UPDATE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="80"<{/if}> />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#pageform').attr('action', '<{$actionurl}>');$('#pageform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pageform', 'f2', '.button-save');
    	bind_hotkey('#pageform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pageform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>