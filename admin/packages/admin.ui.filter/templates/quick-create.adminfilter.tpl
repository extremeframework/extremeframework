<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('L_CLOSE', true)}>">x</button>
    <h3><{_t('L_QUICK_CREATE')|ucwords}> <{_t('L_ADMIN_FILTER')|ucwords}></h3>
</div>


<div id="adminfilter-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if isset($messages.adminfilter) }>
        <ul class="message">
            <{foreach from=$messages.adminfilter key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminfilterform" id="adminfilterform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminfilter/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminfilter_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminfilter_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminfilter_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminfilter_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminfilter_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_ADMIN_FILTER_NAME')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminfilter_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminfilter_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminfilter_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('L_MODULE')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminfilter_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminfilter_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['COLUMNS'])}>
    
        <{if $preset == 'COLUMNS'}>
            <input type="hidden" class="input-columns" name="adminfilter_formdata_COLUMNS" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['COLUMNS']) && !$acleditablecolumns['COLUMNS'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['COLUMNS'])}>
            <input type="hidden" class="input-columns" name="adminfilter_formdata_COLUMNS" value="<{$details->COLUMNS}>" />
        <{else}>
    		<td class="form-row form-row-columns">
                <div class="form-field form-field-label">
        		    <label><{_t('L_COLUMNS')}></label>
                </div>
            </td>
            <td class="form-row form-row-columns" colspan="3">
                <div class="form-field form-field-value column-columns">
                                            

    <input class="input-columns input-type-text" type="text" name="<{$prefix}>adminfilter_formdata_COLUMNS" value="<{$details->COLUMNS|escape}>"  />
                        <{if $columntooltips.COLUMNS}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.COLUMNS}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_DEFAULT'])}>
    
        <{if $preset == 'IS_DEFAULT'}>
            <input type="hidden" class="input-is-default" name="adminfilter_formdata_IS_DEFAULT" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_DEFAULT']) && !$acleditablecolumns['IS_DEFAULT'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_DEFAULT'])}>
            <input type="hidden" class="input-is-default" name="adminfilter_formdata_IS_DEFAULT" value="<{$details->IS_DEFAULT}>" />
        <{else}>
    		<td class="form-row form-row-is-default">
                <div class="form-field form-field-label">
        		    <label><{_t('L_IS_DEFAULT')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-default" colspan="3">
                <div class="form-field form-field-value column-is-default">
                                            

    <span class="input-type-radio"><input class="input-is-default" type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="1" <{if $details->IS_DEFAULT}>checked="checked"<{/if}>><{_t('L_YES')}> <input type="radio" name="<{$prefix}>adminfilter_formdata_IS_DEFAULT" value="0" <{if !$details->IS_DEFAULT}>checked="checked"<{/if}> /><{_t('L_NO')}></span>
                        <{if $columntooltips.IS_DEFAULT}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_DEFAULT}>"></i>
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

        <{plugin key="adminfilter_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminfilterform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminfilterform :input').change(function() {
        $('#adminfilterform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminfilterform').length) {
            if ($('#adminfilterform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminfilter/savedraft/",
                    data: $('#adminfilterform').serialize()
                });

                $('#adminfilterform').data('changed', false);
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
    adminfilter_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminfilterform').find('[name*=adminfilter_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminfilter_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminfilter_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminfilter_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminfilter_apply_block_visibility(key, value);
        });
    }

    adminfilter_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminfilter_update_visibility_settings = function () {
        var model = adminfilter_get_editing_model();

        var settings = adminfilter_get_visibility_settings(model);

        adminfilter_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminfilterform :input').change(function() {
            adminfilter_update_visibility_settings();
        });

        adminfilter_update_visibility_settings();
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
    	bind_hotkey('#adminfilterform', 'f2', 'a.button-save');
    	bind_hotkey('#adminfilterform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminfilterform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminfilterform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminfilterform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>