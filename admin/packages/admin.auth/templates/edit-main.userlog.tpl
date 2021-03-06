<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="userlogform" id="userlogform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/userlog/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userlog_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="userlog_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="userlog_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-id-user">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="userlog_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="userlog_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`userlog_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" datasourcename="User" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>userlog_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-date-time">
            
        
        
        
        <{if !isset($excludedcolumns['DATE_TIME'])}>
    
        <{if $preset == 'DATE_TIME'}>
            <input type="hidden" class="input-date-time" name="userlog_formdata_DATE_TIME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DATE_TIME']) && !$acleditablecolumns['DATE_TIME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DATE_TIME'])}>
            <input type="hidden" class="input-date-time" name="userlog_formdata_DATE_TIME" value="<{$details->DATE_TIME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Date time')}></label>
            </td>
            <td class="form-field form-field-value column-date-time" colspan="3">
                                    
    <input class="input-date-time input-type-date field-date" type="text" id="<{$prefix}>userlog_formdata_DATE_TIME" name="<{$prefix}>userlog_formdata_DATE_TIME" value="<{$details->DATE_TIME|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.DATE_TIME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.DATE_TIME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-ip">
            
        
        
        
        <{if !isset($excludedcolumns['IP'])}>
    
        <{if $preset == 'IP'}>
            <input type="hidden" class="input-ip" name="userlog_formdata_IP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IP']) && !$acleditablecolumns['IP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IP'])}>
            <input type="hidden" class="input-ip" name="userlog_formdata_IP" value="<{$details->IP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('IP')}></label>
            </td>
            <td class="form-field form-field-value column-ip" colspan="3">
                                    

    <input class="input-ip input-type-text" type="text" name="<{$prefix}>userlog_formdata_IP" value="<{$details->IP|escape}>"  />
                    <{if $columntooltips.IP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.IP}>"></i>
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
        
        <{plugin key="userlog_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userlogform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userlogform :input').change(function() {
        $('#userlogform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userlogform').length) {
            if ($('#userlogform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userlog/savedraft/",
                    data: $('#userlogform').serialize()
                });

                $('#userlogform').data('changed', false);
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
    userlog_get_editing_model = function () {
        var model = {};

        var formdata = $('#userlogform').find('[name*=userlog_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('userlog_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    userlog_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    userlog_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            userlog_apply_block_visibility(key, value);
        });
    }

    userlog_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    userlog_update_visibility_settings = function () {
        var model = userlog_get_editing_model();

        var settings = userlog_get_visibility_settings(model);

        userlog_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userlogform :input').change(function() {
            userlog_update_visibility_settings();
        });

        userlog_update_visibility_settings();
    });
</script>