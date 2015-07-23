<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Recycle Bin')|ucwords}></h3>
</div>


<div id="recyclebin-edit" class="edit_details">

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

    <form name="recyclebinform" id="recyclebinform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/recyclebin/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="recyclebin_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="recyclebin_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="recyclebin_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ITEM'])}>
    
        <{if $preset == 'ITEM'}>
            <input type="hidden" class="input-item" name="recyclebin_formdata_ITEM" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ITEM']) && !$acleditablecolumns['ITEM'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ITEM'])}>
            <input type="hidden" class="input-item" name="recyclebin_formdata_ITEM" value="<{$details->ITEM}>" />
        <{else}>
    		<td class="form-row form-row-item">
                <div class="form-field form-field-label">
        		    <label><{_t('Item')}></label>
                </div>
            </td>
            <td class="form-row form-row-item" colspan="3">
                <div class="form-field form-field-value column-item">
                                            

    <input class="input-item input-type-text" type="text" name="<{$prefix}>recyclebin_formdata_ITEM" value="<{$details->ITEM|escape}>"  />
                        <{if $columntooltips.ITEM}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ITEM}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="recyclebin_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="recyclebin_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Module')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`recyclebin_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>recyclebin_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['DATE_TIME'])}>
    
        <{if $preset == 'DATE_TIME'}>
            <input type="hidden" class="input-date-time" name="recyclebin_formdata_DATE_TIME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['DATE_TIME']) && !$acleditablecolumns['DATE_TIME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['DATE_TIME'])}>
            <input type="hidden" class="input-date-time" name="recyclebin_formdata_DATE_TIME" value="<{$details->DATE_TIME}>" />
        <{else}>
    		<td class="form-row form-row-date-time">
                <div class="form-field form-field-label">
        		    <label><{_t('Date time')}></label>
                </div>
            </td>
            <td class="form-row form-row-date-time" colspan="3">
                <div class="form-field form-field-value column-date-time">
                                            
    <input class="input-date-time input-type-date field-date" type="text" id="<{$prefix}>recyclebin_formdata_DATE_TIME" name="<{$prefix}>recyclebin_formdata_DATE_TIME" value="<{$details->DATE_TIME|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                        <{if $columntooltips.DATE_TIME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.DATE_TIME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ID_USER'])}>
    
        <{if $preset == 'ID_USER'}>
            <input type="hidden" class="input-id-user" name="recyclebin_formdata_ID_USER" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ID_USER']) && !$acleditablecolumns['ID_USER'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ID_USER'])}>
            <input type="hidden" class="input-id-user" name="recyclebin_formdata_ID_USER" value="<{$details->ID_USER}>" />
        <{else}>
    		<td class="form-row form-row-id-user">
                <div class="form-field form-field-label">
        		    <label><{_t('User')}></label>
                </div>
            </td>
            <td class="form-row form-row-id-user" colspan="3">
                <div class="form-field form-field-value column-id-user">
                                            
            <{if Framework::hasModule('User')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`recyclebin_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="" groupcol="" blankitem=""}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>recyclebin_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                            <{if $columntooltips.ID_USER}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ID_USER}>"></i>
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

        <{plugin key="recyclebin_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#recyclebinform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#recyclebinform :input').change(function() {
        $('#recyclebinform').data('changed', true);
    });

        function saveDraft() {
        if ($('#recyclebinform').length) {
            if ($('#recyclebinform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/recyclebin/savedraft/",
                    data: $('#recyclebinform').serialize()
                });

                $('#recyclebinform').data('changed', false);
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
    recyclebin_get_editing_model = function () {
        var model = {};

        var formdata = $('#recyclebinform').find('[name*=recyclebin_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('recyclebin_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    recyclebin_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    recyclebin_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            recyclebin_apply_block_visibility(key, value);
        });
    }

    recyclebin_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    recyclebin_update_visibility_settings = function () {
        var model = recyclebin_get_editing_model();

        var settings = recyclebin_get_visibility_settings(model);

        recyclebin_apply_visibility_settings(settings);
    }

    $(function() {
        $('#recyclebinform :input').change(function() {
            recyclebin_update_visibility_settings();
        });

        recyclebin_update_visibility_settings();
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
    	bind_hotkey('#recyclebinform', 'f2', 'a.button-save');
    	bind_hotkey('#recyclebinform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#recyclebinform', 'f3', 'a.button-save-more');
    	bind_hotkey('#recyclebinform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#recyclebinform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>