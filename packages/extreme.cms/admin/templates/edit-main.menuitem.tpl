<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="menuitemform" id="menuitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/menuitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="menuitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="menuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="menuitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-title form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="menuitem_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="menuitem_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Menu item title')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                    <{if $columntooltips.TITLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-class">
            
        
        
        
        <{if !isset($excludedcolumns['CLASS'])}>
    
        <{if $preset == 'CLASS'}>
            <input type="hidden" class="input-class" name="menuitem_formdata_CLASS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CLASS']) && !$acleditablecolumns['CLASS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CLASS'])}>
            <input type="hidden" class="input-class" name="menuitem_formdata_CLASS" value="<{$details->CLASS}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Class')}></label>
            </td>
            <td class="form-field form-field-value column-class" colspan="3">
                                    

    <input class="input-class input-type-text" type="text" name="<{$prefix}>menuitem_formdata_CLASS" value="<{$details->CLASS|escape}>"  />
                    <{if $columntooltips.CLASS}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CLASS}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-tag-line">
            
        
        
        
        <{if !isset($excludedcolumns['TAG_LINE'])}>
    
        <{if $preset == 'TAG_LINE'}>
            <input type="hidden" class="input-tag-line" name="menuitem_formdata_TAG_LINE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TAG_LINE']) && !$acleditablecolumns['TAG_LINE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TAG_LINE'])}>
            <input type="hidden" class="input-tag-line" name="menuitem_formdata_TAG_LINE" value="<{$details->TAG_LINE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Tag line')}></label>
            </td>
            <td class="form-field form-field-value column-tag-line" colspan="3">
                                    

    <input class="input-tag-line input-type-text" type="text" name="<{$prefix}>menuitem_formdata_TAG_LINE" value="<{$details->TAG_LINE|escape}>"  />
                    <{if $columntooltips.TAG_LINE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.TAG_LINE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-menu">
            
        
        
        
        <{if !isset($excludedcolumns['ID_MENU'])}>
    
        <{if $preset == 'ID_MENU'}>
            <input type="hidden" class="input-id-menu" name="menuitem_formdata_ID_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_MENU']) && !$acleditablecolumns['ID_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_MENU'])}>
            <input type="hidden" class="input-id-menu" name="menuitem_formdata_ID_MENU" value="<{$details->ID_MENU}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Menu')}></label>
            </td>
            <td class="form-field form-field-value column-id-menu" colspan="3">
                                    
            <{if Framework::hasModule('Menu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-menu" class="input-id-menu" name="`$prefix`menuitem_formdata_ID_MENU" value=$details->ID_MENU text=$details->reftext_ID_MENU datasource="MENU" datasourcename="Menu" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.menu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menu/new" title="Create a New Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-menu input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_MENU" value="<{$details->ID_MENU|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_MENU}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_MENU}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-parent">
            
        
        
        
        <{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="menuitem_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="menuitem_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Parent')}></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
                                    
            <{if Framework::hasModule('MenuItem')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`menuitem_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="MENU_ITEM" datasourcename="MenuItem" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="ID_MENU" blankitem=""}>

                            <{if isset($smarty.session.acl.menuitem.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/new" title="Create a New Menu Item">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>menuitem_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                        <{if $columntooltips.PARENT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-page">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PAGE'])}>
    
        <{if $preset == 'ID_PAGE'}>
            <input type="hidden" class="input-id-page" name="menuitem_formdata_ID_PAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PAGE']) && !$acleditablecolumns['ID_PAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PAGE'])}>
            <input type="hidden" class="input-id-page" name="menuitem_formdata_ID_PAGE" value="<{$details->ID_PAGE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Page')}></label>
            </td>
            <td class="form-field form-field-value column-id-page" colspan="3">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`menuitem_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" datasourcename="Page" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.page.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_PAGE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_PAGE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-post">
            
        
        
        
        <{if !isset($excludedcolumns['ID_POST'])}>
    
        <{if $preset == 'ID_POST'}>
            <input type="hidden" class="input-id-post" name="menuitem_formdata_ID_POST" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST']) && !$acleditablecolumns['ID_POST'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST'])}>
            <input type="hidden" class="input-id-post" name="menuitem_formdata_ID_POST" value="<{$details->ID_POST}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post')}></label>
            </td>
            <td class="form-field form-field-value column-id-post" colspan="3">
                                    
            <{if Framework::hasModule('Post')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-post" class="input-id-post" name="`$prefix`menuitem_formdata_ID_POST" value=$details->ID_POST text=$details->reftext_ID_POST datasource="POST" datasourcename="Post" valuecol="ID" textcol="TITLE" sortcol="TITLE" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.post.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/post/new" title="Create a New Post">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_POST" value="<{$details->ID_POST|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_POST}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-post-category">
            
        
        
        
        <{if !isset($excludedcolumns['ID_POST_CATEGORY'])}>
    
        <{if $preset == 'ID_POST_CATEGORY'}>
            <input type="hidden" class="input-id-post-category" name="menuitem_formdata_ID_POST_CATEGORY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST_CATEGORY']) && !$acleditablecolumns['ID_POST_CATEGORY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST_CATEGORY'])}>
            <input type="hidden" class="input-id-post-category" name="menuitem_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Post category')}></label>
            </td>
            <td class="form-field form-field-value column-id-post-category" colspan="3">
                                    
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" datasourcename="PostCategory" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.postcategory.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-post-category input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_POST_CATEGORY}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST_CATEGORY}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-path">
            
        
        
        
        <{if !isset($excludedcolumns['PATH'])}>
    
        <{if $preset == 'PATH'}>
            <input type="hidden" class="input-path" name="menuitem_formdata_PATH" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PATH']) && !$acleditablecolumns['PATH'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PATH'])}>
            <input type="hidden" class="input-path" name="menuitem_formdata_PATH" value="<{$details->PATH}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Path')}></label>
            </td>
            <td class="form-field form-field-value column-path" colspan="3">
                                    

    <input class="input-path input-type-text" type="text" name="<{$prefix}>menuitem_formdata_PATH" value="<{$details->PATH|escape}>"  />
                    <{if $columntooltips.PATH}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PATH}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-custom-content">
            
        
        
        
        <{if !isset($excludedcolumns['CUSTOM_CONTENT'])}>
    
        <{if $preset == 'CUSTOM_CONTENT'}>
            <input type="hidden" class="input-custom-content" name="menuitem_formdata_CUSTOM_CONTENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CUSTOM_CONTENT']) && !$acleditablecolumns['CUSTOM_CONTENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CUSTOM_CONTENT'])}>
            <input type="hidden" class="input-custom-content" name="menuitem_formdata_CUSTOM_CONTENT" value="<{$details->CUSTOM_CONTENT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Custom content')}></label>
            </td>
            <td class="form-field form-field-value column-custom-content" colspan="3">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-custom-content enable-html" id="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT_<{$tmpid}>" name="<{$prefix}>menuitem_formdata_CUSTOM_CONTENT" rows="5" ><{$details->CUSTOM_CONTENT}></textarea>
                    <{if $columntooltips.CUSTOM_CONTENT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.CUSTOM_CONTENT}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-has-break-after">
            
        
        
        
        <{if !isset($excludedcolumns['HAS_BREAK_AFTER'])}>
    
        <{if $preset == 'HAS_BREAK_AFTER'}>
            <input type="hidden" class="input-has-break-after" name="menuitem_formdata_HAS_BREAK_AFTER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['HAS_BREAK_AFTER']) && !$acleditablecolumns['HAS_BREAK_AFTER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['HAS_BREAK_AFTER'])}>
            <input type="hidden" class="input-has-break-after" name="menuitem_formdata_HAS_BREAK_AFTER" value="<{$details->HAS_BREAK_AFTER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Has break after?')}></label>
            </td>
            <td class="form-field form-field-value column-has-break-after" colspan="3">
                                    

    <span class="input-type-radio"><input class="input-has-break-after" type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="1" <{if $details->HAS_BREAK_AFTER}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>menuitem_formdata_HAS_BREAK_AFTER" value="0" <{if !$details->HAS_BREAK_AFTER}>checked="checked"<{/if}> /><{_t('No')}></span>
                    <{if $columntooltips.HAS_BREAK_AFTER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.HAS_BREAK_AFTER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ordering">
            
        
        
        
        <{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="menuitem_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="menuitem_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Ordering')}></label>
            </td>
            <td class="form-field form-field-value column-ordering" colspan="3">
                                    
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>menuitem_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                    <{if $columntooltips.ORDERING}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-acl-id-user-group">
            
        
        
        
        <{if !isset($excludedcolumns['ACL_ID_USER_GROUP'])}>
    
        <{if $preset == 'ACL_ID_USER_GROUP'}>
            <input type="hidden" class="input-acl-id-user-group" name="menuitem_formdata_ACL_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACL_ID_USER_GROUP']) && !$acleditablecolumns['ACL_ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACL_ID_USER_GROUP'])}>
            <input type="hidden" class="input-acl-id-user-group" name="menuitem_formdata_ACL_ID_USER_GROUP" value="<{$details->ACL_ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Acl user group')}></label>
            </td>
            <td class="form-field form-field-value column-acl-id-user-group" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-acl-id-user-group" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$details->ACL_ID_USER_GROUP text=$details->reftext_ACL_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-acl-id-user-group input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ACL_ID_USER_GROUP" value="<{$details->ACL_ID_USER_GROUP|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ACL_ID_USER_GROUP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ACL_ID_USER_GROUP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
    		<td>
                <div class="form-field form-field-label">
        		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                </div>
            </td>
            <td colspan="3">
                <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                    <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="menuitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#menuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#menuitemform :input').change(function() {
        $('#menuitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#menuitemform').length) {
            if ($('#menuitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/menuitem/savedraft/",
                    data: $('#menuitemform').serialize()
                });

                $('#menuitemform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    menuitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#menuitemform').find('[name*=menuitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('menuitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    menuitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    menuitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            menuitem_apply_block_visibility(key, value);
        });
    }

    menuitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    menuitem_update_visibility_settings = function () {
        var model = menuitem_get_editing_model();

        var settings = menuitem_get_visibility_settings(model);

        menuitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#menuitemform :input').change(function() {
            menuitem_update_visibility_settings();
        });

        menuitem_update_visibility_settings();
    });
</script>