<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_QUICK_CREATE|ucwords"}> <{$smarty.const.L_FIELD_ACL|ucwords}></h3>
</div>


<div id="fieldacl-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.fieldacl) }>
        <ul class="message">
            <{foreach from=$messages.fieldacl key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="fieldaclform" id="fieldaclform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/fieldacl/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="fieldacl_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="fieldacl_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="fieldacl_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="fieldacl_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="fieldacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-row form-row-id-user-group">
                <div class="form-field form-field-label">
        		    <label><{label key="L_USER_GROUP"}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user-group" colspan="3">
                <div class="form-field form-field-value column-id-user-group">
                                            
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`fieldacl_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                </span>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER_GROUP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ACL_TYPE'])}>
    
        <{if $preset == 'ID_ACL_TYPE'}>
            <input type="hidden" class="input-id-acl-type" name="fieldacl_formdata_ID_ACL_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ACL_TYPE']) && !$acleditablecolumns['ID_ACL_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ACL_TYPE'])}>
            <input type="hidden" class="input-id-acl-type" name="fieldacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-acl-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ACL_TYPE"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-acl-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-acl-type">
                                            
            <{if Framework::hasModule('AclType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-acl-type" class="input-id-acl-type" name="`$prefix`fieldacl_formdata_ID_ACL_TYPE" value=$details->ID_ACL_TYPE text=$details->reftext_ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-acl-type input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ACL_TYPE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ACL_TYPE}>"></i>
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
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
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
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
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

        <{plugin key="fieldacl_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#fieldaclform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#fieldaclform :input').change(function() {
        $('#fieldaclform').data('changed', true);
    });

        function saveDraft() {
        if ($('#fieldaclform').length) {
            if ($('#fieldaclform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/fieldacl/savedraft/",
                    data: $('#fieldaclform').serialize()
                });

                $('#fieldaclform').data('changed', false);
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
    fieldacl_get_editing_model = function () {
        var model = {};

        var formdata = $('#fieldaclform').find('[name*=fieldacl_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('fieldacl_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    fieldacl_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    fieldacl_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            fieldacl_apply_block_visibility(key, value);
        });
    }

    fieldacl_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    fieldacl_update_visibility_settings = function () {
        var model = fieldacl_get_editing_model();

        var settings = fieldacl_get_visibility_settings(model);

        fieldacl_apply_visibility_settings(settings);
    }

    $(function() {
        $('#fieldaclform :input').change(function() {
            fieldacl_update_visibility_settings();
        });

        fieldacl_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
            </button>
                            <a class="btn btn-full-form scope-main" href="<{$smarty.const.APPLICATION_URL}>/fieldacl/new">
                    <strong><{label key="L_GO_TO_FULL_FORM"}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#fieldaclform', 'f2', 'a.button-save');
    	bind_hotkey('#fieldaclform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#fieldaclform', 'f3', 'a.button-save-more');
    	bind_hotkey('#fieldaclform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#fieldaclform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>