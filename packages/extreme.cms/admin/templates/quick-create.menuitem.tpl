<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Menu Item')|ucwords}></h3>
</div>


<div id="menuitem-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
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
        <input type="hidden" name="view-type" value="quick-create" />
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
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-acl-id-user-group" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$details->ACL_ID_USER_GROUP text=$details->reftext_ACL_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

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
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/menuitem/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#menuitemform', 'f2', 'a.button-save');
    	bind_hotkey('#menuitemform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#menuitemform', 'f3', 'a.button-save-more');
    	bind_hotkey('#menuitemform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#menuitemform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>