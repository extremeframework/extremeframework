<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="permissionsetitemform" id="permissionsetitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/permissionsetitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="permissionsetitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="permissionsetitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="permissionsetitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_PERMISSION_SET'])}>
    
        <{if $preset == 'ID_PERMISSION_SET'}>
            <input type="hidden" class="input-id-permission-set" name="permissionsetitem_formdata_ID_PERMISSION_SET" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_PERMISSION_SET']) && !$acleditablecolumns['ID_PERMISSION_SET'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_PERMISSION_SET'])}>
            <input type="hidden" class="input-id-permission-set" name="permissionsetitem_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET}>" />
        <{else}>
    		<td class="form-row form-row-id-permission-set">
                <div class="form-field form-field-label">
        		    <label><{_t('Permission set')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-permission-set" colspan="3">
                <div class="form-field form-field-value column-id-permission-set">
                                            
            <{if Framework::hasModule('PermissionSet')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-permission-set" class="input-id-permission-set" name="`$prefix`permissionsetitem_formdata_ID_PERMISSION_SET" value=$details->ID_PERMISSION_SET text=$details->reftext_ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.permissionset.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-permission-set input-type-text" type="text" name="<{$prefix}>permissionsetitem_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_PERMISSION_SET}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_PERMISSION_SET}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="permissionsetitem_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="permissionsetitem_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`permissionsetitem_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>permissionsetitem_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ACTIONS'])}>
    
        <{if $preset == 'ACTIONS'}>
            <input type="hidden" class="input-actions" name="permissionsetitem_formdata_ACTIONS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ACTIONS']) && !$acleditablecolumns['ACTIONS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ACTIONS'])}>
            <input type="hidden" class="input-actions" name="permissionsetitem_formdata_ACTIONS" value="<{$details->ACTIONS}>" />
        <{else}>
    		<td class="form-row form-row-actions">
                <div class="form-field form-field-label">
        		    <label><{_t('Actions')}></label>
                </div>
            </td>
            <td class="form-row form-row-actions" colspan="3">
                <div class="form-field form-field-value column-actions">
                                            

    <input class="input-actions input-type-text" type="text" name="<{$prefix}>permissionsetitem_formdata_ACTIONS" value="<{$details->ACTIONS|escape}>"  />
                        <{if $columntooltips.ACTIONS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ACTIONS}>"></i>
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

        <{plugin key="permissionsetitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#permissionsetitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#permissionsetitemform :input').change(function() {
        $('#permissionsetitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#permissionsetitemform').length) {
            if ($('#permissionsetitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionsetitem/savedraft/",
                    data: $('#permissionsetitemform').serialize()
                });

                $('#permissionsetitemform').data('changed', false);
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
    permissionsetitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#permissionsetitemform').find('[name*=permissionsetitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('permissionsetitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    permissionsetitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    permissionsetitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            permissionsetitem_apply_block_visibility(key, value);
        });
    }

    permissionsetitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    permissionsetitem_update_visibility_settings = function () {
        var model = permissionsetitem_get_editing_model();

        var settings = permissionsetitem_get_visibility_settings(model);

        permissionsetitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#permissionsetitemform :input').change(function() {
            permissionsetitem_update_visibility_settings();
        });

        permissionsetitem_update_visibility_settings();
    });
</script>