<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Admin Module')|ucwords}></h3>
</div>


<div id="adminmodule-edit" class="edit_details">

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

    <form name="adminmoduleform" id="adminmoduleform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmodule/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmodule_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmodule_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmodule_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmodule_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmodule_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Admin module name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmodule_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_COMMENT_ENABLED'])}>
    
        <{if $preset == 'IS_COMMENT_ENABLED'}>
            <input type="hidden" class="input-is-comment-enabled" name="adminmodule_formdata_IS_COMMENT_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_COMMENT_ENABLED']) && !$acleditablecolumns['IS_COMMENT_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_COMMENT_ENABLED'])}>
            <input type="hidden" class="input-is-comment-enabled" name="adminmodule_formdata_IS_COMMENT_ENABLED" value="<{$details->IS_COMMENT_ENABLED}>" />
        <{else}>
    		<td class="form-row form-row-is-comment-enabled">
                <div class="form-field form-field-label">
        		    <label><{_t('Comment enabled?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-comment-enabled" colspan="3">
                <div class="form-field form-field-value column-is-comment-enabled">
                                            

    <span class="input-type-radio"><input class="input-is-comment-enabled" type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="1" <{if $details->IS_COMMENT_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmodule_formdata_IS_COMMENT_ENABLED" value="0" <{if !$details->IS_COMMENT_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_COMMENT_ENABLED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_COMMENT_ENABLED}>"></i>
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

        <{plugin key="adminmodule_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmoduleform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmoduleform :input').change(function() {
        $('#adminmoduleform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmoduleform').length) {
            if ($('#adminmoduleform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmodule/savedraft/",
                    data: $('#adminmoduleform').serialize()
                });

                $('#adminmoduleform').data('changed', false);
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
    adminmodule_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmoduleform').find('[name*=adminmodule_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmodule_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmodule_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmodule_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmodule_apply_block_visibility(key, value);
        });
    }

    adminmodule_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmodule_update_visibility_settings = function () {
        var model = adminmodule_get_editing_model();

        var settings = adminmodule_get_visibility_settings(model);

        adminmodule_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmoduleform :input').change(function() {
            adminmodule_update_visibility_settings();
        });

        adminmodule_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new">
                    <strong><{_t('Go to full form')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmoduleform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmoduleform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmoduleform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmoduleform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmoduleform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>