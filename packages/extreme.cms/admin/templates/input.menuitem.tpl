<{include file="header.tpl"}>
</head>
<body class="module module-<{$module}> additional-menuitem">

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

<form name="menuitemform" id="menuitemform" class="form-edit scope-main" action="" method="post" enctype="multipart/form-data">

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
            
                <{elseif $column == 'TITLE' }>
                	<div class="form-row <{if in_array('TITLE', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_TITLE')}><{if in_array('TITLE', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-title">

                                                    <{if isset($formdata.TITLE) }>
                            <{assign var='tmp_value' value=$formdata.TITLE}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-title" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CLASS' }>
                	<div class="form-row <{if in_array('CLASS', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CLASS')}><{if in_array('CLASS', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-class">

                                                    <{if isset($formdata.CLASS) }>
                            <{assign var='tmp_value' value=$formdata.CLASS}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-class" type="text" name="<{$prefix}>menuitem_formdata_CLASS" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
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
                        
                            <input class="input-tag-line" type="text" name="<{$prefix}>menuitem_formdata_TAG_LINE" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_MENU' }>
                	<div class="form-row <{if in_array('ID_MENU', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_MENU')}><{if in_array('ID_MENU', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-menu">

                                                    <{if isset($formdata.ID_MENU) }>
                            <{assign var='tmp_value' value=$formdata.ID_MENU}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-menu" name="`$prefix`menuitem_formdata_ID_MENU" value=$formdata.ID_MENU datasource="MENU" valuecol="CODE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-parent" name="`$prefix`menuitem_formdata_PARENT" value=$formdata.PARENT datasource="MENU_ITEM" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-page" name="`$prefix`menuitem_formdata_ID_PAGE" value=$formdata.ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
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
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post" name="`$prefix`menuitem_formdata_ID_POST" value=$formdata.ID_POST datasource="POST" valuecol="ID" textcol="TITLE" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'ID_POST_CATEGORY' }>
                	<div class="form-row <{if in_array('ID_POST_CATEGORY', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_POST_CATEGORY')}><{if in_array('ID_POST_CATEGORY', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-id-post-category">

                                                    <{if isset($formdata.ID_POST_CATEGORY) }>
                            <{assign var='tmp_value' value=$formdata.ID_POST_CATEGORY}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$formdata.ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
                <{elseif $column == 'PATH' }>
                	<div class="form-row <{if in_array('PATH', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_PATH')}><{if in_array('PATH', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-path">

                                                    <{if isset($formdata.PATH) }>
                            <{assign var='tmp_value' value=$formdata.PATH}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <input class="input-path" type="text" name="<{$prefix}>menuitem_formdata_PATH" value="<{$tmp_value|escape}>" <{if !$row_edit}>size="40"<{/if}> />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'CUSTOM_CONTENT' }>
                	<div class="form-row <{if in_array('CUSTOM_CONTENT', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_CUSTOM_CONTENT')}><{if in_array('CUSTOM_CONTENT', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-custom-content">

                                                    <{if isset($formdata.CUSTOM_CONTENT) }>
                            <{assign var='tmp_value' value=$formdata.CUSTOM_CONTENT}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                        
                            <textarea class="input-custom-content" id="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" name="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" rows="5" ><{$tmp_value}></textarea>
                            <script type="text/javascript">htmlEditor('<{$prefix}>menuitem_formdata_CUSTOM_CONTENT')</script>                        
                		</div>
                	</div>
        	
                <{elseif $column == 'HAS_BREAK_AFTER' }>
                	<div class="form-row <{if in_array('HAS_BREAK_AFTER', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_HAS_BREAK_AFTER')}><{if in_array('HAS_BREAK_AFTER', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-has-break-after">

                                                    <{if isset($formdata.HAS_BREAK_AFTER) }>
                            <{assign var='tmp_value' value=$formdata.HAS_BREAK_AFTER}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    <{if $force_boolean_dropdown}>
                                <select class="input-has-break-after" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" >
                                    <option value="1" <{if $formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('L_YES')}></option>
                                    <option value="0" <{if !$formdata.HAS_BREAK_AFTER}>selected="selected"<{/if}>><{_t('L_NO')}></option>
                                </select>
                            <{else}>
                                <span class="input-type-radio"><input class="input-has-break-after" type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="1" <{if $formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="0" <{if !$formdata.HAS_BREAK_AFTER}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
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
                                                    
                            <input class="input-ordering number-format" type="text" name="<{$prefix}>menuitem_formdata_ORDERING" value="<{if $tmp_value != 0}><{$tmp_value}><{/if}>" size="16" />
                        
                		</div>
                	</div>
        	
                <{elseif $column == 'ACL_ID_USER_GROUP' }>
                	<div class="form-row <{if in_array('ACL_ID_USER_GROUP', $mandatories) }>form-row-mandatory<{/if}>">
                		<label><{_t('L_ACL_USER_GROUP')}><{if in_array('ACL_ID_USER_GROUP', $mandatories) }><span class="mandatory">*</span><{/if}></label>
                		<div class="form-field column-acl-id-user-group">

                                                    <{if isset($formdata.ACL_ID_USER_GROUP) }>
                            <{assign var='tmp_value' value=$formdata.ACL_ID_USER_GROUP}>
                        <{else}>
                            <{assign var='tmp_value' value=''}>
                        <{/if}>
                                                    
                                <{html_ref_select autocomplete="1" ajax="0" method="" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$formdata.ACL_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                                                                                    
                		</div>
                	</div>
        	
            	<{/if}>
        <{/foreach}>
        <div class="view-buttons" style="float:none;top:0px;">
            <{foreach from=$formactions key=actiontitle item=actionurl}>
                <div class="button-general button-additional">
                    <a onclick="$('#menuitemform').attr('action', '<{$actionurl}>');$('#menuitemform').submit();return false;"><span class="button-face"><{$actiontitle}></span></a>
                </div>
            <{/foreach}>
            <a class="button-cancel scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/cancel/?return=<{ContextStack::getCurrentContext()}>"><span class="button-face"><{_t('L_CANCEL')}></span></a>
            <div class="clearer"></div>
        </div>
	</div>
    <div class="clearer"></div>
</div>

</form>


<script type="text/javascript">
    $(function() {
    	bind_hotkey('#menuitemform', 'f2', '.button-save');
    	bind_hotkey('#menuitemform', 'esc', '.button-cancel');
    });

    $(function() {
        if (document.activeElement == document.body) {
        	$('#menuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<{include file="footer.tpl"}>