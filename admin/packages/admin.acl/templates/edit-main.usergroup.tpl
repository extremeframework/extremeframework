<div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="usergroupform" id="usergroupform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/usergroup/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="usergroup_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="usergroup_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="usergroup_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="usergroup_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="usergroup_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_USER_GROUP_NAME')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>usergroup_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DEFAULT_ID_DASHBOARD'])}>
    
        <{if $preset == 'DEFAULT_ID_DASHBOARD'}>
            <input type="hidden" class="input-default-id-dashboard" name="usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DEFAULT_ID_DASHBOARD']) && !$acleditablecolumns['DEFAULT_ID_DASHBOARD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DEFAULT_ID_DASHBOARD'])}>
            <input type="hidden" class="input-default-id-dashboard" name="usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$details->DEFAULT_ID_DASHBOARD}>" />
        <{else}>
    		<td class="form-row form-row-default-id-dashboard">
                <div class="form-field form-field-label">
        		    <label><{_t('L_DEFAULT_DASHBOARD')}></label>
                </div>
            </td>
            <td class="form-row form-row-default-id-dashboard" colspan="3">
                <div class="form-field form-field-value column-default-id-dashboard">
                                            
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-default-id-dashboard" class="input-default-id-dashboard" name="`$prefix`usergroup_formdata_DEFAULT_ID_DASHBOARD" value=$details->DEFAULT_ID_DASHBOARD text=$details->reftext_DEFAULT_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                </span>
                    <{else}>
            <input class="input-default-id-dashboard input-type-text" type="text" name="<{$prefix}>usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$details->DEFAULT_ID_DASHBOARD|escape}>"  />
        <{/if}>
                            <{if $columntooltips.DEFAULT_ID_DASHBOARD}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DEFAULT_ID_DASHBOARD}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="usergroup_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="usergroup_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-row form-row-parent">
                <div class="form-field form-field-label">
        		    <label><{_t('L_PARENT')}></label>
                </div>
            </td>
            <td class="form-row form-row-parent" colspan="3">
                <div class="form-field form-field-value column-parent">
                                            
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`usergroup_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                </span>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>usergroup_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                            <{if $columntooltips.PARENT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
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

        <{plugin key="usergroup_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#usergroupform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#usergroupform :input').change(function() {
        $('#usergroupform').data('changed', true);
    });

        function saveDraft() {
        if ($('#usergroupform').length) {
            if ($('#usergroupform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/usergroup/savedraft/",
                    data: $('#usergroupform').serialize()
                });

                $('#usergroupform').data('changed', false);
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
    usergroup_get_editing_model = function () {
        var model = {};

        var formdata = $('#usergroupform').find('[name*=usergroup_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('usergroup_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    usergroup_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    usergroup_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            usergroup_apply_block_visibility(key, value);
        });
    }

    usergroup_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    usergroup_update_visibility_settings = function () {
        var model = usergroup_get_editing_model();

        var settings = usergroup_get_visibility_settings(model);

        usergroup_apply_visibility_settings(settings);
    }

    $(function() {
        $('#usergroupform :input').change(function() {
            usergroup_update_visibility_settings();
        });

        usergroup_update_visibility_settings();
    });
</script>