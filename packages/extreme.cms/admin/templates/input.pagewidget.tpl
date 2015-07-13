<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-pagewidget">

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

<form name="pagewidgetform" id="pagewidgetform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'ID_PAGE' }>
                	<div class="form-row <{if in_array('ID_PAGE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PAGE')}><{if in_array('ID_PAGE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-page">

                                                    <{if isset($formdata.ID_PAGE) }>
                            <{assign var='tmp_value' value=$formdata.ID_PAGE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`pagewidget_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <input class="input-title" type="text" name="<{$prefix}>pagewidget_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-code" type="text" name="<{$prefix}>pagewidget_formdata_CODE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'LINK' }>
                	<div class="form-row <{if in_array('LINK', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_LINK')}><{if in_array('LINK', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-link">

                                                    <{if isset($formdata.LINK) }>
                            <{assign var='tmp_value' value=$formdata.LINK}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-link" type="text" name="<{$prefix}>pagewidget_formdata_LINK" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                                <input class="input-image" type="text" name="<{$prefix}>pagewidget_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{else}>
                            	<input class="input-image" type="file" name="<{$prefix}>pagewidget_formdata_IMAGE" />
                                <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
                            	<{if $formdata.IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagewidget_IMAGE"><{media src=$formdata.IMAGE}> <a onclick="remove_attachment(document.pagewidgetform.<{$prefix}>pagewidget_formdata_IMAGE, '<{$tmp_value}>', '<{$prefix}>pagewidget_IMAGE')">Remove</a></span><{/if}>
                                <input type="hidden" name="<{$prefix}>pagewidget_formdata_IMAGE" value="<{$tmp_value}>" />
                            <{/if}>
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_WIDGET_TYPE' }>
                	<div class="form-row <{if in_array('ID_WIDGET_TYPE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WIDGET_TYPE')}><{if in_array('ID_WIDGET_TYPE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-widget-type">

                                                    <{if isset($formdata.ID_WIDGET_TYPE) }>
                            <{assign var='tmp_value' value=$formdata.ID_WIDGET_TYPE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-widget-type" name="`$prefix`pagewidget_formdata_ID_WIDGET_TYPE" value=$formdata.ID_WIDGET_TYPE datasource="WIDGET_TYPE" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_WIDGET_POSITION' }>
                	<div class="form-row <{if in_array('ID_WIDGET_POSITION', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_WIDGET_POSITION')}><{if in_array('ID_WIDGET_POSITION', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-widget-position">

                                                    <{if isset($formdata.ID_WIDGET_POSITION) }>
                            <{assign var='tmp_value' value=$formdata.ID_WIDGET_POSITION}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-widget-position" name="`$prefix`pagewidget_formdata_ID_WIDGET_POSITION" value=$formdata.ID_WIDGET_POSITION datasource="WIDGET_POSITION" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                        
                            <textarea class="input-content" id="<{$prefix}>pagewidget_formdata_CONTENT" name="<{$prefix}>pagewidget_formdata_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>pagewidget_formdata_CONTENT')</script>                        
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
                                <select class="input-hide-title" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" >
                                    <option value="1" <{if $formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.HIDE_TITLE}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="1" <{if $formdata.HIDE_TITLE}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="0" <{if !$formdata.HIDE_TITLE}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                            <{/if}>
                        
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>pagewidget_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#pagewidgetform').attr('action', '<{$actionurl}>');$('#pagewidgetform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/pagewidget/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#pagewidgetform', 'f2', '.button-save');
    	bind_hotkey('#pagewidgetform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#pagewidgetform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>