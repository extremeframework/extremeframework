<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{$smarty.const.L_CLOSE}>">x</button>
    <h3><{label key="L_QUICK_CREATE" format="ucwords"}> <{$smarty.const.L_ADMIN_MENU_ITEM|ucwords}></h3>
</div>


<div id="adminmenuitem-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.adminmenuitem) }>
        <ul class="message">
            <{foreach from=$messages.adminmenuitem key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminmenuitemform" id="adminmenuitemform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmenuitem_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmenuitem_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmenuitem_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmenuitem_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ADMIN_MENU_ITEM_NAME"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmenuitem_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_LEFT'])}>
    
        <{if $preset == 'ENABLE_LEFT'}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_LEFT']) && !$acleditablecolumns['ENABLE_LEFT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_LEFT'])}>
            <input type="hidden" class="input-enable-left" name="adminmenuitem_formdata_ENABLE_LEFT" value="<{$details->ENABLE_LEFT}>" />
        <{else}>
    		<td class="form-row form-row-enable-left">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ENABLE_LEFT"}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-left" colspan="3">
                <div class="form-field form-field-value column-enable-left">
                                            

    <span class="input-type-radio"><input class="input-enable-left" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="1" <{if $details->ENABLE_LEFT}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_LEFT" value="0" <{if !$details->ENABLE_LEFT}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.ENABLE_LEFT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_LEFT}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_TOP'])}>
    
        <{if $preset == 'ENABLE_TOP'}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_TOP']) && !$acleditablecolumns['ENABLE_TOP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_TOP'])}>
            <input type="hidden" class="input-enable-top" name="adminmenuitem_formdata_ENABLE_TOP" value="<{$details->ENABLE_TOP}>" />
        <{else}>
    		<td class="form-row form-row-enable-top">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ENABLE_TOP"}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-top" colspan="3">
                <div class="form-field form-field-value column-enable-top">
                                            

    <span class="input-type-radio"><input class="input-enable-top" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="1" <{if $details->ENABLE_TOP}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_TOP" value="0" <{if !$details->ENABLE_TOP}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.ENABLE_TOP}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_TOP}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_QUICK'])}>
    
        <{if $preset == 'ENABLE_QUICK'}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_QUICK']) && !$acleditablecolumns['ENABLE_QUICK'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_QUICK'])}>
            <input type="hidden" class="input-enable-quick" name="adminmenuitem_formdata_ENABLE_QUICK" value="<{$details->ENABLE_QUICK}>" />
        <{else}>
    		<td class="form-row form-row-enable-quick">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ENABLE_QUICK"}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-quick" colspan="3">
                <div class="form-field form-field-value column-enable-quick">
                                            

    <span class="input-type-radio"><input class="input-enable-quick" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="1" <{if $details->ENABLE_QUICK}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_QUICK" value="0" <{if !$details->ENABLE_QUICK}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.ENABLE_QUICK}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_QUICK}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_ALL'])}>
    
        <{if $preset == 'ENABLE_ALL'}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_ALL']) && !$acleditablecolumns['ENABLE_ALL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_ALL'])}>
            <input type="hidden" class="input-enable-all" name="adminmenuitem_formdata_ENABLE_ALL" value="<{$details->ENABLE_ALL}>" />
        <{else}>
    		<td class="form-row form-row-enable-all">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ENABLE_ALL"}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-all" colspan="3">
                <div class="form-field form-field-value column-enable-all">
                                            

    <span class="input-type-radio"><input class="input-enable-all" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="1" <{if $details->ENABLE_ALL}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_ALL" value="0" <{if !$details->ENABLE_ALL}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.ENABLE_ALL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_ALL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ENABLE_SETTINGS'])}>
    
        <{if $preset == 'ENABLE_SETTINGS'}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ENABLE_SETTINGS']) && !$acleditablecolumns['ENABLE_SETTINGS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ENABLE_SETTINGS'])}>
            <input type="hidden" class="input-enable-settings" name="adminmenuitem_formdata_ENABLE_SETTINGS" value="<{$details->ENABLE_SETTINGS}>" />
        <{else}>
    		<td class="form-row form-row-enable-settings">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ENABLE_SETTINGS"}></label>
                </div>
            </td>
            <td class="form-row form-row-enable-settings" colspan="3">
                <div class="form-field form-field-value column-enable-settings">
                                            

    <span class="input-type-radio"><input class="input-enable-settings" type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="1" <{if $details->ENABLE_SETTINGS}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminmenuitem_formdata_ENABLE_SETTINGS" value="0" <{if !$details->ENABLE_SETTINGS}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.ENABLE_SETTINGS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ENABLE_SETTINGS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                </tbody>
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

        <{plugin key="adminmenuitem_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuitemform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmenuitemform :input').change(function() {
        $('#adminmenuitemform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmenuitemform').length) {
            if ($('#adminmenuitemform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenuitem/savedraft/",
                    data: $('#adminmenuitemform').serialize()
                });

                $('#adminmenuitemform').data('changed', false);
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
    adminmenuitem_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmenuitemform').find('[name*=adminmenuitem_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmenuitem_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmenuitem_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmenuitem_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmenuitem_apply_block_visibility(key, value);
        });
    }

    adminmenuitem_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmenuitem_update_visibility_settings = function () {
        var model = adminmenuitem_get_editing_model();

        var settings = adminmenuitem_get_visibility_settings(model);

        adminmenuitem_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmenuitemform :input').change(function() {
            adminmenuitem_update_visibility_settings();
        });

        adminmenuitem_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{label key="L_CANCEL"}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{label key="L_SAVE"}></strong>
            </button>
                            <a class="btn btn-full-form scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmenuitem/new">
                    <strong><{label key="L_GO_TO_FULL_FORM"}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuitemform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmenuitemform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmenuitemform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>