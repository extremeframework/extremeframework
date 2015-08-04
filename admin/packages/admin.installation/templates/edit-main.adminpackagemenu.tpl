<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminpackagemenuform" id="adminpackagemenuform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminpackagemenu_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminpackagemenu_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminpackagemenu_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_PACKAGE'])}>
    
        <{if $preset == 'ID_ADMIN_PACKAGE'}>
            <input type="hidden" class="input-id-admin-package" name="adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_PACKAGE']) && !$acleditablecolumns['ID_ADMIN_PACKAGE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_PACKAGE'])}>
            <input type="hidden" class="input-id-admin-package" name="adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-package">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin package')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-package" colspan="3">
                <div class="form-field form-field-value column-id-admin-package">
                                            
            <{if Framework::hasModule('AdminPackage')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-package" class="input-id-admin-package" name="`$prefix`adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value=$details->ID_ADMIN_PACKAGE text=$details->reftext_ID_ADMIN_PACKAGE datasource="ADMIN_PACKAGE" valuecol="CODE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminpackage.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminpackage/new" title="Create a New Admin Package">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-package input-type-text" type="text" name="<{$prefix}>adminpackagemenu_formdata_ID_ADMIN_PACKAGE" value="<{$details->ID_ADMIN_PACKAGE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_PACKAGE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_PACKAGE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_MENU'])}>
    
        <{if $preset == 'ID_ADMIN_MENU'}>
            <input type="hidden" class="input-id-admin-menu" name="adminpackagemenu_formdata_ID_ADMIN_MENU" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_MENU']) && !$acleditablecolumns['ID_ADMIN_MENU'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_MENU'])}>
            <input type="hidden" class="input-id-admin-menu" name="adminpackagemenu_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-menu">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin menu')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-menu" colspan="3">
                <div class="form-field form-field-value column-id-admin-menu">
                                            
            <{if Framework::hasModule('AdminMenu')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-menu" class="input-id-admin-menu" name="`$prefix`adminpackagemenu_formdata_ID_ADMIN_MENU" value=$details->ID_ADMIN_MENU text=$details->reftext_ID_ADMIN_MENU datasource="ADMIN_MENU" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmenu.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmenu/new" title="Create a New Admin Menu">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-menu input-type-text" type="text" name="<{$prefix}>adminpackagemenu_formdata_ID_ADMIN_MENU" value="<{$details->ID_ADMIN_MENU|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_MENU}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_MENU}>"></i>
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

        <{plugin key="adminpackagemenu_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminpackagemenuform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminpackagemenuform :input').change(function() {
        $('#adminpackagemenuform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminpackagemenuform').length) {
            if ($('#adminpackagemenuform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminpackagemenu/savedraft/",
                    data: $('#adminpackagemenuform').serialize()
                });

                $('#adminpackagemenuform').data('changed', false);
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
    adminpackagemenu_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminpackagemenuform').find('[name*=adminpackagemenu_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminpackagemenu_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminpackagemenu_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminpackagemenu_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminpackagemenu_apply_block_visibility(key, value);
        });
    }

    adminpackagemenu_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminpackagemenu_update_visibility_settings = function () {
        var model = adminpackagemenu_get_editing_model();

        var settings = adminpackagemenu_get_visibility_settings(model);

        adminpackagemenu_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminpackagemenuform :input').change(function() {
            adminpackagemenu_update_visibility_settings();
        });

        adminpackagemenu_update_visibility_settings();
    });
</script>