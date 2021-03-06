<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="usermembershipform" id="usermembershipform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/usermembership/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="usermembership_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="usermembership_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="usermembership_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-id-user">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="usermembership_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="usermembership_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`usermembership_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" datasourcename="User" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>usermembership_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-user-group">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER_GROUP'])}>
    
        <{if $preset == 'ID_USER_GROUP'}>
            <input type="hidden" class="input-id-user-group" name="usermembership_formdata_ID_USER_GROUP" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_GROUP']) && !$acleditablecolumns['ID_USER_GROUP'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_GROUP'])}>
            <input type="hidden" class="input-id-user-group" name="usermembership_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User group')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`usermembership_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>usermembership_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER_GROUP}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_GROUP}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-id-user-role">
            
        
        
        
        <{if !isset($excludedcolumns['ID_USER_ROLE'])}>
    
        <{if $preset == 'ID_USER_ROLE'}>
            <input type="hidden" class="input-id-user-role" name="usermembership_formdata_ID_USER_ROLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER_ROLE']) && !$acleditablecolumns['ID_USER_ROLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER_ROLE'])}>
            <input type="hidden" class="input-id-user-role" name="usermembership_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User role')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-role" colspan="3">
                                    
            <{if Framework::hasModule('UserRole')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user-role" class="input-id-user-role" name="`$prefix`usermembership_formdata_ID_USER_ROLE" value=$details->ID_USER_ROLE text=$details->reftext_ID_USER_ROLE datasource="USER_ROLE" datasourcename="UserRole" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.userrole.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-role input-type-text" type="text" name="<{$prefix}>usermembership_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE|escape}>"  />
        <{/if}>
                        <{if $columntooltips.ID_USER_ROLE}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER_ROLE}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-from">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_FROM'])}>
    
        <{if $preset == 'VALID_FROM'}>
            <input type="hidden" class="input-valid-from" name="usermembership_formdata_VALID_FROM" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_FROM']) && !$acleditablecolumns['VALID_FROM'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_FROM'])}>
            <input type="hidden" class="input-valid-from" name="usermembership_formdata_VALID_FROM" value="<{$details->VALID_FROM}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid from')}></label>
            </td>
            <td class="form-field form-field-value column-valid-from" colspan="3">
                                    
    <input class="input-valid-from input-type-date field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_FROM" name="<{$prefix}>usermembership_formdata_VALID_FROM" value="<{$details->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                    <{if $columntooltips.VALID_FROM}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.VALID_FROM}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-valid-until">
            
        
        
        
        <{if !isset($excludedcolumns['VALID_UNTIL'])}>
    
        <{if $preset == 'VALID_UNTIL'}>
            <input type="hidden" class="input-valid-until" name="usermembership_formdata_VALID_UNTIL" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['VALID_UNTIL']) && !$acleditablecolumns['VALID_UNTIL'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['VALID_UNTIL'])}>
            <input type="hidden" class="input-valid-until" name="usermembership_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Valid until')}></label>
            </td>
            <td class="form-field form-field-value column-valid-until" colspan="3">
                                    
    <input class="input-valid-until input-type-date field-date" type="text" id="<{$prefix}>usermembership_formdata_VALID_UNTIL" name="<{$prefix}>usermembership_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
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
        
        <{plugin key="usermembership_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#usermembershipform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#usermembershipform :input').change(function() {
        $('#usermembershipform').data('changed', true);
    });

        function saveDraft() {
        if ($('#usermembershipform').length) {
            if ($('#usermembershipform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/usermembership/savedraft/",
                    data: $('#usermembershipform').serialize()
                });

                $('#usermembershipform').data('changed', false);
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
    usermembership_get_editing_model = function () {
        var model = {};

        var formdata = $('#usermembershipform').find('[name*=usermembership_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('usermembership_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    usermembership_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    usermembership_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            usermembership_apply_block_visibility(key, value);
        });
    }

    usermembership_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    usermembership_update_visibility_settings = function () {
        var model = usermembership_get_editing_model();

        var settings = usermembership_get_visibility_settings(model);

        usermembership_apply_visibility_settings(settings);
    }

    $(function() {
        $('#usermembershipform :input').change(function() {
            usermembership_update_visibility_settings();
        });

        usermembership_update_visibility_settings();
    });
</script>