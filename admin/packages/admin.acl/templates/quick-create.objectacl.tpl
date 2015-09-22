<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Object Acl')|ucwords}></h3>
</div>


<div id="objectacl-edit" class="edit_details">

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

    <form name="objectaclform" id="objectaclform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/objectacl/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="objectacl_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="objectacl_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="objectacl_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                                                                                                                                    
<tr class="form-row form-row-id-user-group">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="objectacl_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="objectacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User group')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`objectacl_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER_GROUP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                
<tr class="form-row form-row-arg-id-user-group">
            
        
        
        
        <{if !isset($excludedcolumns['ARG_ID_USER_GROUP'])}>
    
        <{if $preset == 'ARG_ID_USER_GROUP'}>
            <input type="hidden" class="input-arg-id-user-group" name="objectacl_formdata_ARG_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ARG_ID_USER_GROUP']) && !$acleditablecolumns['ARG_ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ARG_ID_USER_GROUP'])}>
            <input type="hidden" class="input-arg-id-user-group" name="objectacl_formdata_ARG_ID_USER_GROUP" value="<{$details->ARG_ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Arg user group')}></label>
            </td>
            <td class="form-field form-field-value column-arg-id-user-group" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-arg-id-user-group" class="input-arg-id-user-group" name="`$prefix`objectacl_formdata_ARG_ID_USER_GROUP" value=$details->ARG_ID_USER_GROUP text=$details->reftext_ARG_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-arg-id-user-group input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ARG_ID_USER_GROUP" value="<{$details->ARG_ID_USER_GROUP|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ARG_ID_USER_GROUP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ARG_ID_USER_GROUP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                
<tr class="form-row form-row-id-acl-type form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['ID_ACL_TYPE'])}>
    
        <{if $preset == 'ID_ACL_TYPE'}>
            <input type="hidden" class="input-id-acl-type" name="objectacl_formdata_ID_ACL_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ACL_TYPE']) && !$acleditablecolumns['ID_ACL_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ACL_TYPE'])}>
            <input type="hidden" class="input-id-acl-type" name="objectacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Acl type')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-id-acl-type" colspan="3">
                                    
            <{if Framework::hasModule('AclType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-acl-type" class="input-id-acl-type" name="`$prefix`objectacl_formdata_ID_ACL_TYPE" value=$details->ID_ACL_TYPE text=$details->reftext_ID_ACL_TYPE datasource="ACL_TYPE" datasourcename="AclType" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.acltype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-acl-type input-type-text" type="text" name="<{$prefix}>objectacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_ACL_TYPE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_ACL_TYPE}>"></i>
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
        
        <{plugin key="objectacl_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#objectaclform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#objectaclform :input').change(function() {
        $('#objectaclform').data('changed', true);
    });

        function saveDraft() {
        if ($('#objectaclform').length) {
            if ($('#objectaclform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/objectacl/savedraft/",
                    data: $('#objectaclform').serialize()
                });

                $('#objectaclform').data('changed', false);
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
    objectacl_get_editing_model = function () {
        var model = {};

        var formdata = $('#objectaclform').find('[name*=objectacl_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('objectacl_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    objectacl_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    objectacl_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            objectacl_apply_block_visibility(key, value);
        });
    }

    objectacl_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    objectacl_update_visibility_settings = function () {
        var model = objectacl_get_editing_model();

        var settings = objectacl_get_visibility_settings(model);

        objectacl_apply_visibility_settings(settings);
    }

    $(function() {
        $('#objectaclform :input').change(function() {
            objectacl_update_visibility_settings();
        });

        objectacl_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/objectacl/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#objectaclform', 'f2', 'a.button-save');
    	bind_hotkey('#objectaclform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#objectaclform', 'f3', 'a.button-save-more');
    	bind_hotkey('#objectaclform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#objectaclform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>