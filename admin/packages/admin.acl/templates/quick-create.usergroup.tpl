<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('User Group')|ucwords}></h3>
</div>


<div id="usergroup-edit" class="edit_details">

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

    <form name="usergroupform" id="usergroupform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/usergroup/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="usergroup_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
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
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="usergroup_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="usergroup_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('User group name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>usergroup_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-default-id-dashboard">
            
        
        
        
        <{if !isset($excludedcolumns['DEFAULT_ID_DASHBOARD'])}>
    
        <{if $preset == 'DEFAULT_ID_DASHBOARD'}>
            <input type="hidden" class="input-default-id-dashboard" name="usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DEFAULT_ID_DASHBOARD']) && !$acleditablecolumns['DEFAULT_ID_DASHBOARD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DEFAULT_ID_DASHBOARD'])}>
            <input type="hidden" class="input-default-id-dashboard" name="usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$details->DEFAULT_ID_DASHBOARD}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Default dashboard')}></label>
            </td>
            <td class="form-field form-field-value column-default-id-dashboard" colspan="3">
                                    
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-default-id-dashboard" class="input-default-id-dashboard" name="`$prefix`usergroup_formdata_DEFAULT_ID_DASHBOARD" value=$details->DEFAULT_ID_DASHBOARD text=$details->reftext_DEFAULT_ID_DASHBOARD datasource="DASHBOARD" datasourcename="Dashboard" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.dashboard.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-default-id-dashboard input-type-text" type="text" name="<{$prefix}>usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$details->DEFAULT_ID_DASHBOARD|escape}>"  />
        <{/if}>
                        <{if $columntooltips.DEFAULT_ID_DASHBOARD}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.DEFAULT_ID_DASHBOARD}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            
<tr class="form-row form-row-parent">
            
        
        
        
        <{if !isset($excludedcolumns['PARENT'])}>
    
        <{if $preset == 'PARENT'}>
            <input type="hidden" class="input-parent" name="usergroup_formdata_PARENT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['PARENT']) && !$acleditablecolumns['PARENT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['PARENT'])}>
            <input type="hidden" class="input-parent" name="usergroup_formdata_PARENT" value="<{$details->PARENT}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Parent')}></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`usergroup_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="USER_GROUP" datasourcename="UserGroup" valuecol="ID" textcol="NAME" sortcol="NAME" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>usergroup_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                        <{if $columntooltips.PARENT}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.PARENT}>"></i>
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
    	bind_hotkey('#usergroupform', 'f2', 'a.button-save');
    	bind_hotkey('#usergroupform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#usergroupform', 'f3', 'a.button-save-more');
    	bind_hotkey('#usergroupform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#usergroupform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>