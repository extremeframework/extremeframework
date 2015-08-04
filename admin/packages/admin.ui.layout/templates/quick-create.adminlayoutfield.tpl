<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Admin Layout Field')|ucwords}></h3>
</div>


<div id="adminlayoutfield-edit" class="edit_details">

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

    <form name="adminlayoutfieldform" id="adminlayoutfieldform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminlayoutfield_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminlayoutfield_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminlayoutfield_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminlayoutfield_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminlayoutfield_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminlayoutfield_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_LAYOUT_SECTION'])}>
    
        <{if $preset == 'ID_ADMIN_LAYOUT_SECTION'}>
            <input type="hidden" class="input-id-admin-layout-section" name="adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_LAYOUT_SECTION']) && !$acleditablecolumns['ID_ADMIN_LAYOUT_SECTION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_LAYOUT_SECTION'])}>
            <input type="hidden" class="input-id-admin-layout-section" name="adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value="<{$details->ID_ADMIN_LAYOUT_SECTION}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-layout-section">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin layout section')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-layout-section" colspan="3">
                <div class="form-field form-field-value column-id-admin-layout-section">
                                            
            <{if Framework::hasModule('AdminLayoutSection')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-layout-section" class="input-id-admin-layout-section" name="`$prefix`adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value=$details->ID_ADMIN_LAYOUT_SECTION text=$details->reftext_ID_ADMIN_LAYOUT_SECTION datasource="ADMIN_LAYOUT_SECTION" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminlayoutsection.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/new" title="Create a New Admin Layout Section">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-layout-section input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value="<{$details->ID_ADMIN_LAYOUT_SECTION|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_ADMIN_LAYOUT_SECTION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_LAYOUT_SECTION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['COLUMN'])}>
    
        <{if $preset == 'COLUMN'}>
            <input type="hidden" class="input-column" name="adminlayoutfield_formdata_COLUMN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COLUMN']) && !$acleditablecolumns['COLUMN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COLUMN'])}>
            <input type="hidden" class="input-column" name="adminlayoutfield_formdata_COLUMN" value="<{$details->COLUMN}>" />
        <{else}>
    		<td class="form-row form-row-column form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Column')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-column form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-column">
                                            

    <input class="input-column input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_COLUMN" value="<{$details->COLUMN|escape}>"  />
                        <{if $columntooltips.COLUMN}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.COLUMN}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['POSITION'])}>
    
        <{if $preset == 'POSITION'}>
            <input type="hidden" class="input-position" name="adminlayoutfield_formdata_POSITION" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['POSITION']) && !$acleditablecolumns['POSITION'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['POSITION'])}>
            <input type="hidden" class="input-position" name="adminlayoutfield_formdata_POSITION" value="<{$details->POSITION}>" />
        <{else}>
    		<td class="form-row form-row-position">
                <div class="form-field form-field-label">
        		    <label><{_t('Position')}></label>
                </div>
            </td>
            <td class="form-row form-row-position" colspan="3">
                <div class="form-field form-field-value column-position">
                                            

    <input class="input-position input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_POSITION" value="<{$details->POSITION|escape}>"  />
                        <{if $columntooltips.POSITION}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.POSITION}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="adminlayoutfield_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="adminlayoutfield_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>adminlayoutfield_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
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

        <{plugin key="adminlayoutfield_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminlayoutfieldform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminlayoutfieldform :input').change(function() {
        $('#adminlayoutfieldform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminlayoutfieldform').length) {
            if ($('#adminlayoutfieldform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/savedraft/",
                    data: $('#adminlayoutfieldform').serialize()
                });

                $('#adminlayoutfieldform').data('changed', false);
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
    adminlayoutfield_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminlayoutfieldform').find('[name*=adminlayoutfield_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminlayoutfield_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminlayoutfield_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminlayoutfield_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminlayoutfield_apply_block_visibility(key, value);
        });
    }

    adminlayoutfield_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminlayoutfield_update_visibility_settings = function () {
        var model = adminlayoutfield_get_editing_model();

        var settings = adminlayoutfield_get_visibility_settings(model);

        adminlayoutfield_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminlayoutfieldform :input').change(function() {
            adminlayoutfield_update_visibility_settings();
        });

        adminlayoutfield_update_visibility_settings();
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
    	bind_hotkey('#adminlayoutfieldform', 'f2', 'a.button-save');
    	bind_hotkey('#adminlayoutfieldform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminlayoutfieldform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminlayoutfieldform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminlayoutfieldform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>