<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="fieldaclform" id="fieldaclform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/fieldacl/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="fieldacl_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
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
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="fieldacl_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="fieldacl_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`fieldacl_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ACTION'])}>
    
        <{if $preset == 'ACTION'}>
            <input type="hidden" class="input-action" name="fieldacl_formdata_ACTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACTION']) && !$acleditablecolumns['ACTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACTION'])}>
            <input type="hidden" class="input-action" name="fieldacl_formdata_ACTION" value="<{$details->ACTION}>" />
        <{else}>
    		<td class="form-row form-row-action">
                <div class="form-field form-field-label">
        		    <label><{_t('Action')}></label>
                </div>
            </td>
            <td class="form-row form-row-action" colspan="3">
                <div class="form-field form-field-value column-action">
                                            

    <input class="input-action input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ACTION" value="<{$details->ACTION|escape}>"  />
                        <{if $columntooltips.ACTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ACTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="fieldacl_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="fieldacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-row form-row-id-user-group">
                <div class="form-field form-field-label">
        		    <label><{_t('User group')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user-group" colspan="3">
                <div class="form-field form-field-value column-id-user-group">
                                            
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`fieldacl_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER_GROUP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="fieldacl_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="fieldacl_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-row form-row-id-user">
                <div class="form-field form-field-label">
        		    <label><{_t('User')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user" colspan="3">
                <div class="form-field form-field-value column-id-user">
                                            
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`fieldacl_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['FIELDS'])}>
    
        <{if $preset == 'FIELDS'}>
            <input type="hidden" class="input-fields" name="fieldacl_formdata_FIELDS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FIELDS']) && !$acleditablecolumns['FIELDS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FIELDS'])}>
            <input type="hidden" class="input-fields" name="fieldacl_formdata_FIELDS" value="<{$details->FIELDS}>" />
        <{else}>
    		<td class="form-row form-row-fields">
                <div class="form-field form-field-label">
        		    <label><{_t('Fields')}></label>
                </div>
            </td>
            <td class="form-row form-row-fields" colspan="3">
                <div class="form-field form-field-value column-fields">
                                            
    <{$tmpid = uniqid()}>

    <textarea class="input-fields enable-html" id="<{$prefix}>fieldacl_formdata_FIELDS_<{$tmpid}>" name="<{$prefix}>fieldacl_formdata_FIELDS" rows="5" ><{$details->FIELDS}></textarea>
                        <{if $columntooltips.FIELDS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.FIELDS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ACL_TYPE'])}>
    
        <{if $preset == 'ID_ACL_TYPE'}>
            <input type="hidden" class="input-id-acl-type" name="fieldacl_formdata_ID_ACL_TYPE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ACL_TYPE']) && !$acleditablecolumns['ID_ACL_TYPE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ACL_TYPE'])}>
            <input type="hidden" class="input-id-acl-type" name="fieldacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE}>" />
        <{else}>
    		<td class="form-row form-row-id-acl-type form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Acl type')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-id-acl-type form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-id-acl-type">
                                            
            <{if Framework::hasModule('AclType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-acl-type" class="input-id-acl-type" name="`$prefix`fieldacl_formdata_ID_ACL_TYPE" value=$details->ID_ACL_TYPE text=$details->reftext_ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.acltype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                    </span>
                <{/if}>
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
                        <span><{_t('Additional information')}></span>
                        <div class="header-arrow"></div>
                        <div class="clearer"></div>
                    </div>
                    <div class="layout-section-content">
                        <table class="table table-bordered table-custom-layout equal-split">
                            <tbody>
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
</script>