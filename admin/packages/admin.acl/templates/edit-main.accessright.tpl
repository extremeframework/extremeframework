<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="accessrightform" id="accessrightform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/accessright/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="accessright_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="accessright_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="accessright_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-id-user-group">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="accessright_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="accessright_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User group')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`accessright_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>accessright_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER_GROUP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-user-role">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER_ROLE'])}>
    
        <{if $preset == 'ID_USER_ROLE'}>
            <input type="hidden" class="input-id-user-role" name="accessright_formdata_ID_USER_ROLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_ROLE']) && !$acleditablecolumns['ID_USER_ROLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_ROLE'])}>
            <input type="hidden" class="input-id-user-role" name="accessright_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User role')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-role" colspan="3">
                                    
            <{if Framework::hasModule('UserRole')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user-role" class="input-id-user-role" name="`$prefix`accessright_formdata_ID_USER_ROLE" value=$details->ID_USER_ROLE text=$details->reftext_ID_USER_ROLE datasource="USER_ROLE" datasourcename="UserRole" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.userrole.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-role input-type-text" type="text" name="<{$prefix}>accessright_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER_ROLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_ROLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-module form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="accessright_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="accessright_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Module')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-module" colspan="3">
                                    
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`accessright_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" datasourcename="AdminModule" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>accessright_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.MODULE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-actions">
            
        
        
        
        <{if !isset($excludedcolumns['ACTIONS'])}>
    
        <{if $preset == 'ACTIONS'}>
            <input type="hidden" class="input-actions" name="accessright_formdata_ACTIONS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACTIONS']) && !$acleditablecolumns['ACTIONS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACTIONS'])}>
            <input type="hidden" class="input-actions" name="accessright_formdata_ACTIONS" value="<{$details->ACTIONS}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Actions')}></label>
            </td>
            <td class="form-field form-field-value column-actions" colspan="3">
                                    

    <input class="input-actions input-type-text" type="text" name="<{$prefix}>accessright_formdata_ACTIONS" value="<{$details->ACTIONS|escape}>"  />
                    <{if $columntooltips.ACTIONS}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ACTIONS}>"></i>
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
        
        <{plugin key="accessright_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#accessrightform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#accessrightform :input').change(function() {
        $('#accessrightform').data('changed', true);
    });

        function saveDraft() {
        if ($('#accessrightform').length) {
            if ($('#accessrightform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/accessright/savedraft/",
                    data: $('#accessrightform').serialize()
                });

                $('#accessrightform').data('changed', false);
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
    accessright_get_editing_model = function () {
        var model = {};

        var formdata = $('#accessrightform').find('[name*=accessright_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('accessright_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    accessright_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    accessright_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            accessright_apply_block_visibility(key, value);
        });
    }

    accessright_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    accessright_update_visibility_settings = function () {
        var model = accessright_get_editing_model();

        var settings = accessright_get_visibility_settings(model);

        accessright_apply_visibility_settings(settings);
    }

    $(function() {
        $('#accessrightform :input').change(function() {
            accessright_update_visibility_settings();
        });

        accessright_update_visibility_settings();
    });
</script>