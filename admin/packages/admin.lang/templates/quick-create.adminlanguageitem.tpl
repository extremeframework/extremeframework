<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_ADMIN_LANGUAGE_ITEM')|ucwords}></h3>
</div>


<div id="adminlanguageitem-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.adminlanguageitem) }>
        <ul class="message">
            <{foreach from=$messages.adminlanguageitem key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminlanguageitemform" id="adminlanguageitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminlanguageitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminlanguageitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminlanguageitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_LANGUAGE'])}>
    
        <{if $preset == 'ID_ADMIN_LANGUAGE'}>
            <input type="hidden" class="input-id-admin-language" name="adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_LANGUAGE']) && !$acleditablecolumns['ID_ADMIN_LANGUAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_LANGUAGE'])}>
            <input type="hidden" class="input-id-admin-language" name="adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value="<{$details->ID_ADMIN_LANGUAGE}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-language">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_LANGUAGE')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-language" colspan="3">
                <div class="form-field form-field-value column-id-admin-language">
                                            
            <{if Framework::hasModule('AdminLanguage')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-language" class="input-id-admin-language" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value=$details->ID_ADMIN_LANGUAGE text=$details->reftext_ID_ADMIN_LANGUAGE datasource="ADMIN_LANGUAGE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlanguage/new" title="Create a New Admin Language">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-language input-type-text" type="text" name="<{$prefix}>adminlanguageitem_formdata_ID_ADMIN_LANGUAGE" value="<{$details->ID_ADMIN_LANGUAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_LANGUAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_LANGUAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_LABEL'])}>
    
        <{if $preset == 'ID_ADMIN_LABEL'}>
            <input type="hidden" class="input-id-admin-label" name="adminlanguageitem_formdata_ID_ADMIN_LABEL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_LABEL']) && !$acleditablecolumns['ID_ADMIN_LABEL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_LABEL'])}>
            <input type="hidden" class="input-id-admin-label" name="adminlanguageitem_formdata_ID_ADMIN_LABEL" value="<{$details->ID_ADMIN_LABEL}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-label">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_LABEL')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-label" colspan="3">
                <div class="form-field form-field-value column-id-admin-label">
                                            
            <{if Framework::hasModule('AdminLabel')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-admin-label" class="input-id-admin-label" name="`$prefix`adminlanguageitem_formdata_ID_ADMIN_LABEL" value=$details->ID_ADMIN_LABEL text=$details->reftext_ID_ADMIN_LABEL datasource="ADMIN_LABEL" valuecol="ID" textcol="LABEL" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminlabel/new" title="Create a New Admin Label">+</a>
                </span>
                    <{else}>
            <input class="input-id-admin-label input-type-text" type="text" name="<{$prefix}>adminlanguageitem_formdata_ID_ADMIN_LABEL" value="<{$details->ID_ADMIN_LABEL|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_LABEL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_LABEL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TRANSLATION'])}>
    
        <{if $preset == 'TRANSLATION'}>
            <input type="hidden" class="input-translation" name="adminlanguageitem_formdata_TRANSLATION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TRANSLATION']) && !$acleditablecolumns['TRANSLATION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TRANSLATION'])}>
            <input type="hidden" class="input-translation" name="adminlanguageitem_formdata_TRANSLATION" value="<{$details->TRANSLATION}>" />
        <{else}>
    		<td class="form-row form-row-translation">
                <div class="form-field form-field-label">
        		    <label><{_t('L_TRANSLATION')}></label>
                </div>
            </td>
            <td class="form-row form-row-translation" colspan="3">
                <div class="form-field form-field-value column-translation">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-translation enable-html" id="<{$prefix}>adminlanguageitem_formdata_TRANSLATION_<{$tmpid}>" name="<{$prefix}>adminlanguageitem_formdata_TRANSLATION" rows="5" ><{$details->TRANSLATION}></textarea>
                        <{if $columntooltips.TRANSLATION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TRANSLATION}>"></i>
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

        <{plugin key="adminlanguageitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlanguageitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminlanguageitemform :input').change(function() {
        $('#adminlanguageitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminlanguageitemform').length) {
            if ($('#adminlanguageitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlanguageitem/savedraft/",
                    data: $('#adminlanguageitemform').serialize()
                });

                $('#adminlanguageitemform').data('changed', false);
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
    adminlanguageitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminlanguageitemform').find('[name*=adminlanguageitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminlanguageitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminlanguageitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminlanguageitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminlanguageitem_apply_block_visibility(key, value);
        });
    }

    adminlanguageitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminlanguageitem_update_visibility_settings = function () {
        var model = adminlanguageitem_get_editing_model();

        var settings = adminlanguageitem_get_visibility_settings(model);

        adminlanguageitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminlanguageitemform :input').change(function() {
            adminlanguageitem_update_visibility_settings();
        });

        adminlanguageitem_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminlanguageitemform', 'f2', 'a.button-save');
    	bind_hotkey('#adminlanguageitemform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminlanguageitemform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminlanguageitemform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminlanguageitemform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>