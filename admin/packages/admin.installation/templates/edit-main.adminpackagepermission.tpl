<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminpackagepermissionform" id="adminpackagepermissionform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminpackagepermission_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminpackagepermission_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminpackagepermission_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminpackagepermission_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminpackagepermission_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin package permission name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminpackagepermission_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_PACKAGE'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE'}>
            <input type="hidden" class="input-id-admin-package" name="adminpackagepermission_formdata_ID_ADMIN_PACKAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE']) && !$acleditablecolumns['ID_ADMIN_PACKAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE'])}>
            <input type="hidden" class="input-id-admin-package" name="adminpackagepermission_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-package">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin package')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-package" colspan="3">
                <div class="form-field form-field-value column-id-admin-package">
                                            
            <{if Framework::hasModule('AdminPackage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package" class="input-id-admin-package" name="`$prefix`adminpackagepermission_formdata_ID_ADMIN_PACKAGE" value=$details->ID_ADMIN_PACKAGE text=$details->reftext_ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package input-type-text" type="text" name="<{$prefix}>adminpackagepermission_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_PACKAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PERMISSION_SET'])}>
    
        <{if $preset == 'ID_PERMISSION_SET'}>
            <input type="hidden" class="input-id-permission-set" name="adminpackagepermission_formdata_ID_PERMISSION_SET" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PERMISSION_SET']) && !$acleditablecolumns['ID_PERMISSION_SET'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PERMISSION_SET'])}>
            <input type="hidden" class="input-id-permission-set" name="adminpackagepermission_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET}>" />
        <{else}>
    		<td class="form-row form-row-id-permission-set">
                <div class="form-field form-field-label">
        		    <label><{_t('Permission set')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-permission-set" colspan="3">
                <div class="form-field form-field-value column-id-permission-set">
                                            
            <{if Framework::hasModule('PermissionSet')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-permission-set" class="input-id-permission-set" name="`$prefix`adminpackagepermission_formdata_ID_PERMISSION_SET" value=$details->ID_PERMISSION_SET text=$details->reftext_ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.permissionset.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-permission-set input-type-text" type="text" name="<{$prefix}>adminpackagepermission_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PERMISSION_SET}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PERMISSION_SET}>"></i>
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

        <{plugin key="adminpackagepermission_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminpackagepermissionform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminpackagepermissionform :input').change(function() {
        $('#adminpackagepermissionform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminpackagepermissionform').length) {
            if ($('#adminpackagepermissionform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminpackagepermission/savedraft/",
                    data: $('#adminpackagepermissionform').serialize()
                });

                $('#adminpackagepermissionform').data('changed', false);
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
    adminpackagepermission_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminpackagepermissionform').find('[name*=adminpackagepermission_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminpackagepermission_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminpackagepermission_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminpackagepermission_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminpackagepermission_apply_block_visibility(key, value);
        });
    }

    adminpackagepermission_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminpackagepermission_update_visibility_settings = function () {
        var model = adminpackagepermission_get_editing_model();

        var settings = adminpackagepermission_get_visibility_settings(model);

        adminpackagepermission_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminpackagepermissionform :input').change(function() {
            adminpackagepermission_update_visibility_settings();
        });

        adminpackagepermission_update_visibility_settings();
    });
</script>