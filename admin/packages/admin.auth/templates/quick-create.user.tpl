<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_USER')|ucwords}></h3>
</div>


<div id="user-edit" class="edit_details">

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

    <form name="userform" id="userform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/user/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="user_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="user_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['FIRST_NAME'])}>
    
        <{if $preset == 'FIRST_NAME'}>
            <input type="hidden" class="input-first-name" name="user_formdata_FIRST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['FIRST_NAME']) && !$acleditablecolumns['FIRST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['FIRST_NAME'])}>
            <input type="hidden" class="input-first-name" name="user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME}>" />
        <{else}>
    		<td class="form-row form-row-first-name">
                <div class="form-field form-field-label">
        		    <label><{_t('L_FIRST_NAME')}></label>
                </div>
            </td>
            <td class="form-row form-row-first-name" colspan="3">
                <div class="form-field form-field-value column-first-name">
                                            

    <input class="input-first-name input-type-text" type="text" name="<{$prefix}>user_formdata_FIRST_NAME" value="<{$details->FIRST_NAME|escape}>"  />
                        <{if $columntooltips.FIRST_NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.FIRST_NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['LAST_NAME'])}>
    
        <{if $preset == 'LAST_NAME'}>
            <input type="hidden" class="input-last-name" name="user_formdata_LAST_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['LAST_NAME']) && !$acleditablecolumns['LAST_NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['LAST_NAME'])}>
            <input type="hidden" class="input-last-name" name="user_formdata_LAST_NAME" value="<{$details->LAST_NAME}>" />
        <{else}>
    		<td class="form-row form-row-last-name">
                <div class="form-field form-field-label">
        		    <label><{_t('L_LAST_NAME')}></label>
                </div>
            </td>
            <td class="form-row form-row-last-name" colspan="3">
                <div class="form-field form-field-value column-last-name">
                                            

    <input class="input-last-name input-type-text" type="text" name="<{$prefix}>user_formdata_LAST_NAME" value="<{$details->LAST_NAME|escape}>"  />
                        <{if $columntooltips.LAST_NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.LAST_NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['EMAIL'])}>
    
        <{if $preset == 'EMAIL'}>
            <input type="hidden" class="input-email" name="user_formdata_EMAIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EMAIL']) && !$acleditablecolumns['EMAIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EMAIL'])}>
            <input type="hidden" class="input-email" name="user_formdata_EMAIL" value="<{$details->EMAIL}>" />
        <{else}>
    		<td class="form-row form-row-email">
                <div class="form-field form-field-label">
        		    <label><{_t('L_EMAIL')}></label>
                </div>
            </td>
            <td class="form-row form-row-email" colspan="3">
                <div class="form-field form-field-value column-email">
                                            

    <input class="input-email input-type-text" type="text" name="<{$prefix}>user_formdata_EMAIL" value="<{$details->EMAIL|escape}>"  />
                        <{if $columntooltips.EMAIL}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.EMAIL}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PHONE'])}>
    
        <{if $preset == 'PHONE'}>
            <input type="hidden" class="input-phone" name="user_formdata_PHONE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PHONE']) && !$acleditablecolumns['PHONE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PHONE'])}>
            <input type="hidden" class="input-phone" name="user_formdata_PHONE" value="<{$details->PHONE}>" />
        <{else}>
    		<td class="form-row form-row-phone">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PHONE')}></label>
                </div>
            </td>
            <td class="form-row form-row-phone" colspan="3">
                <div class="form-field form-field-value column-phone">
                                            

    <input class="input-phone input-type-text" type="text" name="<{$prefix}>user_formdata_PHONE" value="<{$details->PHONE|escape}>"  />
                        <{if $columntooltips.PHONE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PHONE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                        <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_EMAIL_VERIFIED'])}>
    
        <{if $preset == 'IS_EMAIL_VERIFIED'}>
            <input type="hidden" class="input-is-email-verified" name="user_formdata_IS_EMAIL_VERIFIED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_EMAIL_VERIFIED']) && !$acleditablecolumns['IS_EMAIL_VERIFIED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_EMAIL_VERIFIED'])}>
            <input type="hidden" class="input-is-email-verified" name="user_formdata_IS_EMAIL_VERIFIED" value="<{$details->IS_EMAIL_VERIFIED}>" />
        <{else}>
    		<td class="form-row form-row-is-email-verified">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_EMAIL_VERIFIED')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-email-verified" colspan="3">
                <div class="form-field form-field-value column-is-email-verified">
                                            

    <span class="input-type-radio"><input class="input-is-email-verified" type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="1" <{if $details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>user_formdata_IS_EMAIL_VERIFIED" value="0" <{if !$details->IS_EMAIL_VERIFIED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_EMAIL_VERIFIED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_EMAIL_VERIFIED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                                                                                                                                                                                                                                                                                                    <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_ENABLED'])}>
    
        <{if $preset == 'IS_ENABLED'}>
            <input type="hidden" class="input-is-enabled" name="user_formdata_IS_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_ENABLED']) && !$acleditablecolumns['IS_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_ENABLED'])}>
            <input type="hidden" class="input-is-enabled" name="user_formdata_IS_ENABLED" value="<{$details->IS_ENABLED}>" />
        <{else}>
    		<td class="form-row form-row-is-enabled">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_ENABLED')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-enabled" colspan="3">
                <div class="form-field form-field-value column-is-enabled">
                                            

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>user_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_ENABLED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_ENABLED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                                                                            </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{if $customfields}>
            <div class="layout-block layout-block-section">
                <div class="layout-section">
                    <div class="layout-section-header">
                        <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
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
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
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

        <{plugin key="user_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userform :input').change(function() {
        $('#userform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userform').length) {
            if ($('#userform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/user/savedraft/",
                    data: $('#userform').serialize()
                });

                $('#userform').data('changed', false);
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
    user_get_editing_model = function () {
        var model = {};

        var formdata = $('#userform').find('[name*=user_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('user_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    user_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    user_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            user_apply_block_visibility(key, value);
        });
    }

    user_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    user_update_visibility_settings = function () {
        var model = user_get_editing_model();

        var settings = user_get_visibility_settings(model);

        user_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userform :input').change(function() {
            user_update_visibility_settings();
        });

        user_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                            <a class="btn btn-full-form scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new">
                    <strong><{_t('L_GO_TO_FULL_FORM')}></strong>
                </a>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userform', 'f2', 'a.button-save');
    	bind_hotkey('#userform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#userform', 'f3', 'a.button-save-more');
    	bind_hotkey('#userform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#userform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>