<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_USER_PREFERENCE')|ucwords}></h3>
</div>


<div id="userpreference-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.userpreference) }>
        <ul class="message">
            <{foreach from=$messages.userpreference key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="userpreferenceform" id="userpreferenceform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/userpreference/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userpreference_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="userpreference_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="userpreference_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="userpreference_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="userpreference_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-row form-row-id-user">
                <div class="form-field form-field-label">
        		    <label><{_t('L_USER')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user" colspan="3">
                <div class="form-field form-field-value column-id-user">
                                            
            <{if Framework::hasModule('User')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`userpreference_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                </span>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_DASHBOARD'])}>
    
        <{if $preset == 'ID_DASHBOARD'}>
            <input type="hidden" class="input-id-dashboard" name="userpreference_formdata_ID_DASHBOARD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_DASHBOARD']) && !$acleditablecolumns['ID_DASHBOARD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_DASHBOARD'])}>
            <input type="hidden" class="input-id-dashboard" name="userpreference_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD}>" />
        <{else}>
    		<td class="form-row form-row-id-dashboard">
                <div class="form-field form-field-label">
        		    <label><{_t('L_DASHBOARD')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-dashboard" colspan="3">
                <div class="form-field form-field-value column-id-dashboard">
                                            
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-dashboard" class="input-id-dashboard" name="`$prefix`userpreference_formdata_ID_DASHBOARD" value=$details->ID_DASHBOARD text=$details->reftext_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                </span>
                    <{else}>
            <input class="input-id-dashboard input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_DASHBOARD}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_DASHBOARD}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_WALLPAPER'])}>
    
        <{if $preset == 'ID_WALLPAPER'}>
            <input type="hidden" class="input-id-wallpaper" name="userpreference_formdata_ID_WALLPAPER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_WALLPAPER']) && !$acleditablecolumns['ID_WALLPAPER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_WALLPAPER'])}>
            <input type="hidden" class="input-id-wallpaper" name="userpreference_formdata_ID_WALLPAPER" value="<{$details->ID_WALLPAPER}>" />
        <{else}>
    		<td class="form-row form-row-id-wallpaper">
                <div class="form-field form-field-label">
        		    <label><{_t('L_WALLPAPER')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-wallpaper" colspan="3">
                <div class="form-field form-field-value column-id-wallpaper">
                                            

    <input class="input-id-wallpaper input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_WALLPAPER" value="<{$details->ID_WALLPAPER|escape}>"  />
                        <{if $columntooltips.ID_WALLPAPER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_WALLPAPER}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_ADMIN_STYLE'])}>
    
        <{if $preset == 'ID_ADMIN_STYLE'}>
            <input type="hidden" class="input-id-admin-style" name="userpreference_formdata_ID_ADMIN_STYLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_ADMIN_STYLE']) && !$acleditablecolumns['ID_ADMIN_STYLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_ADMIN_STYLE'])}>
            <input type="hidden" class="input-id-admin-style" name="userpreference_formdata_ID_ADMIN_STYLE" value="<{$details->ID_ADMIN_STYLE}>" />
        <{else}>
    		<td class="form-row form-row-id-admin-style">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_STYLE')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-admin-style" colspan="3">
                <div class="form-field form-field-value column-id-admin-style">
                                            

    <input class="input-id-admin-style input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_ADMIN_STYLE" value="<{$details->ID_ADMIN_STYLE|escape}>"  />
                        <{if $columntooltips.ID_ADMIN_STYLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_ADMIN_STYLE}>"></i>
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

        <{plugin key="userpreference_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#userpreferenceform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#userpreferenceform :input').change(function() {
        $('#userpreferenceform').data('changed', true);
    });

        function saveDraft() {
        if ($('#userpreferenceform').length) {
            if ($('#userpreferenceform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/userpreference/savedraft/",
                    data: $('#userpreferenceform').serialize()
                });

                $('#userpreferenceform').data('changed', false);
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
    userpreference_get_editing_model = function () {
        var model = {};

        var formdata = $('#userpreferenceform').find('[name*=userpreference_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('userpreference_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    userpreference_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    userpreference_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            userpreference_apply_block_visibility(key, value);
        });
    }

    userpreference_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    userpreference_update_visibility_settings = function () {
        var model = userpreference_get_editing_model();

        var settings = userpreference_get_visibility_settings(model);

        userpreference_apply_visibility_settings(settings);
    }

    $(function() {
        $('#userpreferenceform :input').change(function() {
            userpreference_update_visibility_settings();
        });

        userpreference_update_visibility_settings();
    });
</script>                    </div>
    </div>

    
    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('L_CANCEL')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('L_SAVE')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#userpreferenceform', 'f2', 'a.button-save');
    	bind_hotkey('#userpreferenceform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#userpreferenceform', 'f3', 'a.button-save-more');
    	bind_hotkey('#userpreferenceform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#userpreferenceform', 'esc', 'a.button-cancel');
    });
</script>

<script type="text/javascript">
    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });
</script>