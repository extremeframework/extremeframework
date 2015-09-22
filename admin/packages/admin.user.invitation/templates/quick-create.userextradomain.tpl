<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('User Extra Domain')|ucwords}></h3>
</div>


<div id="userextradomain-edit" class="edit_details">

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

    <form name="userextradomainform" id="userextradomainform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/userextradomain/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userextradomain_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="userextradomain_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="userextradomain_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-id-user">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="userextradomain_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="userextradomain_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`userextradomain_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" datasourcename="User" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>userextradomain_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-extra-udid">
            
        
        
        
        <{if !isset($excludedcolumns['EXTRA_UDID'])}>
    
        <{if $preset == 'EXTRA_UDID'}>
            <input type="hidden" class="input-extra-udid" name="userextradomain_formdata_EXTRA_UDID" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['EXTRA_UDID']) && !$acleditablecolumns['EXTRA_UDID'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['EXTRA_UDID'])}>
            <input type="hidden" class="input-extra-udid" name="userextradomain_formdata_EXTRA_UDID" value="<{$details->EXTRA_UDID}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Extra udid')}></label>
            </td>
            <td class="form-field form-field-value column-extra-udid" colspan="3">
                                    
        <input class="input-extra-udid input-type-number" type="text" name="<{$prefix}>userextradomain_formdata_EXTRA_UDID" value="<{if $details->EXTRA_UDID != 0}><{$details->EXTRA_UDID}><{/if}>"  />
                    <{if $columntooltips.EXTRA_UDID}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.EXTRA_UDID}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-from">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_FROM'])}>
    
        <{if $preset == 'VALID_FROM'}>
            <input type="hidden" class="input-valid-from" name="userextradomain_formdata_VALID_FROM" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_FROM']) && !$acleditablecolumns['VALID_FROM'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_FROM'])}>
            <input type="hidden" class="input-valid-from" name="userextradomain_formdata_VALID_FROM" value="<{$details->VALID_FROM}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid from')}></label>
            </td>
            <td class="form-field form-field-value column-valid-from" colspan="3">
                                    
    <input class="input-valid-from input-type-date field-date" type="text" id="<{$prefix}>userextradomain_formdata_VALID_FROM" name="<{$prefix}>userextradomain_formdata_VALID_FROM" value="<{$details->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.VALID_FROM}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VALID_FROM}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-until">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_UNTIL'])}>
    
        <{if $preset == 'VALID_UNTIL'}>
            <input type="hidden" class="input-valid-until" name="userextradomain_formdata_VALID_UNTIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_UNTIL']) && !$acleditablecolumns['VALID_UNTIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_UNTIL'])}>
            <input type="hidden" class="input-valid-until" name="userextradomain_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid until')}></label>
            </td>
            <td class="form-field form-field-value column-valid-until" colspan="3">
                                    
    <input class="input-valid-until input-type-date field-date" type="text" id="<{$prefix}>userextradomain_formdata_VALID_UNTIL" name="<{$prefix}>userextradomain_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.VALID_UNTIL}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VALID_UNTIL}>"></i>
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
        
        <{plugin key="userextradomain_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userextradomainform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userextradomainform :input').change(function() {
        $('#userextradomainform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userextradomainform').length) {
            if ($('#userextradomainform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userextradomain/savedraft/",
                    data: $('#userextradomainform').serialize()
                });

                $('#userextradomainform').data('changed', false);
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
    userextradomain_get_editing_model = function () {
        var model = {};

        var formdata = $('#userextradomainform').find('[name*=userextradomain_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('userextradomain_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    userextradomain_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    userextradomain_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            userextradomain_apply_block_visibility(key, value);
        });
    }

    userextradomain_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    userextradomain_update_visibility_settings = function () {
        var model = userextradomain_get_editing_model();

        var settings = userextradomain_get_visibility_settings(model);

        userextradomain_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userextradomainform :input').change(function() {
            userextradomain_update_visibility_settings();
        });

        userextradomain_update_visibility_settings();
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
    	bind_hotkey('#userextradomainform', 'f2', 'a.button-save');
    	bind_hotkey('#userextradomainform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#userextradomainform', 'f3', 'a.button-save-more');
    	bind_hotkey('#userextradomainform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#userextradomainform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>