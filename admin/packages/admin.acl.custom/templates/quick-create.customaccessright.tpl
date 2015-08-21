<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Custom Access Right')|ucwords}></h3>
</div>


<div id="customaccessright-edit" class="edit_details">

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

    <form name="customaccessrightform" id="customaccessrightform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/customaccessright/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="customaccessright_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="customaccessright_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="customaccessright_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-id-user">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="customaccessright_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="customaccessright_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`customaccessright_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>customaccessright_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-permission-set">
            
        
        
        
        <{if !isset($excludedcolumns['ID_PERMISSION_SET'])}>
    
        <{if $preset == 'ID_PERMISSION_SET'}>
            <input type="hidden" class="input-id-permission-set" name="customaccessright_formdata_ID_PERMISSION_SET" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PERMISSION_SET']) && !$acleditablecolumns['ID_PERMISSION_SET'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PERMISSION_SET'])}>
            <input type="hidden" class="input-id-permission-set" name="customaccessright_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Permission set')}></label>
            </td>
            <td class="form-field form-field-value column-id-permission-set" colspan="3">
                                    
            <{if Framework::hasModule('PermissionSet')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-permission-set" class="input-id-permission-set" name="`$prefix`customaccessright_formdata_ID_PERMISSION_SET" value=$details->ID_PERMISSION_SET text=$details->reftext_ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.permissionset.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-permission-set input-type-text" type="text" name="<{$prefix}>customaccessright_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_PERMISSION_SET}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_PERMISSION_SET}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-from">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_FROM'])}>
    
        <{if $preset == 'VALID_FROM'}>
            <input type="hidden" class="input-valid-from" name="customaccessright_formdata_VALID_FROM" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_FROM']) && !$acleditablecolumns['VALID_FROM'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_FROM'])}>
            <input type="hidden" class="input-valid-from" name="customaccessright_formdata_VALID_FROM" value="<{$details->VALID_FROM}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid from')}></label>
            </td>
            <td class="form-field form-field-value column-valid-from" colspan="3">
                                    
    <input class="input-valid-from input-type-date field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_FROM" name="<{$prefix}>customaccessright_formdata_VALID_FROM" value="<{$details->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.VALID_FROM}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VALID_FROM}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-until">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_UNTIL'])}>
    
        <{if $preset == 'VALID_UNTIL'}>
            <input type="hidden" class="input-valid-until" name="customaccessright_formdata_VALID_UNTIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_UNTIL']) && !$acleditablecolumns['VALID_UNTIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_UNTIL'])}>
            <input type="hidden" class="input-valid-until" name="customaccessright_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid until')}></label>
            </td>
            <td class="form-field form-field-value column-valid-until" colspan="3">
                                    
    <input class="input-valid-until input-type-date field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_UNTIL" name="<{$prefix}>customaccessright_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.VALID_UNTIL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VALID_UNTIL}>"></i>
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
        
        <{plugin key="customaccessright_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#customaccessrightform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#customaccessrightform :input').change(function() {
        $('#customaccessrightform').data('changed', true);
    });

        function saveDraft() {
        if ($('#customaccessrightform').length) {
            if ($('#customaccessrightform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/customaccessright/savedraft/",
                    data: $('#customaccessrightform').serialize()
                });

                $('#customaccessrightform').data('changed', false);
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
    customaccessright_get_editing_model = function () {
        var model = {};

        var formdata = $('#customaccessrightform').find('[name*=customaccessright_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('customaccessright_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    customaccessright_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    customaccessright_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            customaccessright_apply_block_visibility(key, value);
        });
    }

    customaccessright_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    customaccessright_update_visibility_settings = function () {
        var model = customaccessright_get_editing_model();

        var settings = customaccessright_get_visibility_settings(model);

        customaccessright_apply_visibility_settings(settings);
    }

    $(function() {
        $('#customaccessrightform :input').change(function() {
            customaccessright_update_visibility_settings();
        });

        customaccessright_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#customaccessrightform', 'f2', 'a.button-save');
    	bind_hotkey('#customaccessrightform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#customaccessrightform', 'f3', 'a.button-save-more');
    	bind_hotkey('#customaccessrightform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#customaccessrightform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>