<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_MENU_ITEM')|ucwords}></h3>
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
    <{if isset($messages.menuitem) }>
        <ul class="message">
            <{foreach from=$messages.menuitem key=field item=message}>
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
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="menuitem_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="menuitem_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TITLE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>menuitem_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_POST_CATEGORY'])}>
    
        <{if $preset == 'ID_POST_CATEGORY'}>
            <input type="hidden" class="input-id-post-category" name="menuitem_formdata_ID_POST_CATEGORY" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_POST_CATEGORY']) && !$acleditablecolumns['ID_POST_CATEGORY'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_POST_CATEGORY'])}>
            <input type="hidden" class="input-id-post-category" name="menuitem_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY}>" />
        <{else}>
    		<td class="form-row form-row-id-post-category">
                <div class="form-field form-field-label">
        		    <label><{_t('L_POST_CATEGORY')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-post-category" colspan="3">
                <div class="form-field form-field-value column-id-post-category">
                                            
            <{if Framework::hasModule('PostCategory')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-post-category" class="input-id-post-category" name="`$prefix`menuitem_formdata_ID_POST_CATEGORY" value=$details->ID_POST_CATEGORY text=$details->reftext_ID_POST_CATEGORY datasource="POST_CATEGORY" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/postcategory/new" title="Create a New Post Category">+</a>
                </span>
                    <{else}>
            <input class="input-id-post-category input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ID_POST_CATEGORY" value="<{$details->ID_POST_CATEGORY|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_POST_CATEGORY}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_POST_CATEGORY}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ACL_ID_USER_GROUP'])}>
    
        <{if $preset == 'ACL_ID_USER_GROUP'}>
            <input type="hidden" class="input-acl-id-user-group" name="menuitem_formdata_ACL_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACL_ID_USER_GROUP']) && !$acleditablecolumns['ACL_ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACL_ID_USER_GROUP'])}>
            <input type="hidden" class="input-acl-id-user-group" name="menuitem_formdata_ACL_ID_USER_GROUP" value="<{$details->ACL_ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-row form-row-acl-id-user-group">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ACL_USER_GROUP')}></label>
                </div>
            </td>
            <td class="form-row form-row-acl-id-user-group" colspan="3">
                <div class="form-field form-field-value column-acl-id-user-group">
                                            
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-acl-id-user-group" class="input-acl-id-user-group" name="`$prefix`menuitem_formdata_ACL_ID_USER_GROUP" value=$details->ACL_ID_USER_GROUP text=$details->reftext_ACL_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                </span>
                    <{else}>
            <input class="input-acl-id-user-group input-type-text" type="text" name="<{$prefix}>menuitem_formdata_ACL_ID_USER_GROUP" value="<{$details->ACL_ID_USER_GROUP|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ACL_ID_USER_GROUP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ACL_ID_USER_GROUP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
                                <{foreach from=$customfields item=item}>
                                    <tr>
                                		<td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                            <div class="form-field form-field-label">
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>" colspan="3">
                                            <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                                <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                            </div>
                                        </td>
                            		</tr>
                            	<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <{/if}>

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
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main" href="<{$smarty.const.APPLICATION_URL}>/menuitem/new">
                    <strong><{_t('L_GO_TO_FULL_FORM')}></strong>
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
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>