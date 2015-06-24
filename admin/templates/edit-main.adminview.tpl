<div class="edit-main edit_details">
    <{if isset($messages.adminview) }>
        <ul class="message">
            <{foreach from=$messages.adminview key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminviewform" id="adminviewform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminview/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminview_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="edit" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminview_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminview_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TITLE'])}>
    
        <{if $preset == 'TITLE'}>
            <input type="hidden" class="input-title" name="adminview_formdata_TITLE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TITLE']) && !$acleditablecolumns['TITLE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TITLE'])}>
            <input type="hidden" class="input-title" name="adminview_formdata_TITLE" value="<{$details->TITLE}>" />
        <{else}>
    		<td class="form-row form-row-title form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_TITLE"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-title form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-title">
                                            

    <input class="input-title input-type-text" type="text" name="<{$prefix}>adminview_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                        <{if $columntooltips.TITLE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TITLE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CODE'])}>
    
        <{if $preset == 'CODE'}>
            <input type="hidden" class="input-code" name="adminview_formdata_CODE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CODE']) && !$acleditablecolumns['CODE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CODE'])}>
            <input type="hidden" class="input-code" name="adminview_formdata_CODE" value="<{$details->CODE}>" />
        <{else}>
    		<td class="form-row form-row-code form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_CODE"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-code form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-code">
                                            <{if $details->ID && $details->CODE != ''}>
                            <input type="hidden" class="input-code" name="adminview_formdata_CODE" value="<{$details->CODE}>" />
                            
    <{$details->CODE|escape}>
                        <{else}>
                            

    <input class="input-code input-type-text" type="text" name="<{$prefix}>adminview_formdata_CODE" value="<{$details->CODE|escape}>"  />
                            <{if $columntooltips.CODE}>
                                <i class="fa fa-info-circle" title="<{$columntooltips.CODE}>"></i>
                            <{/if}>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['MODULE'])}>
    
        <{if $preset == 'MODULE'}>
            <input type="hidden" class="input-module" name="adminview_formdata_MODULE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['MODULE']) && !$acleditablecolumns['MODULE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['MODULE'])}>
            <input type="hidden" class="input-module" name="adminview_formdata_MODULE" value="<{$details->MODULE}>" />
        <{else}>
    		<td class="form-row form-row-module form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{label key="L_MODULE"}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-module form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-module">
                                            
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminview_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="" groupcol="" blankitem=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminview_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                            <{if $columntooltips.MODULE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.MODULE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['SCREEN'])}>
    
        <{if $preset == 'SCREEN'}>
            <input type="hidden" class="input-screen" name="adminview_formdata_SCREEN" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['SCREEN']) && !$acleditablecolumns['SCREEN'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['SCREEN'])}>
            <input type="hidden" class="input-screen" name="adminview_formdata_SCREEN" value="<{$details->SCREEN}>" />
        <{else}>
    		<td class="form-row form-row-screen">
                <div class="form-field form-field-label">
        		    <label><{label key="L_SCREEN"}></label>
                </div>
            </td>
            <td class="form-row form-row-screen" colspan="3">
                <div class="form-field form-field-value column-screen">
                                            

    <input class="input-screen input-type-text" type="text" name="<{$prefix}>adminview_formdata_SCREEN" value="<{$details->SCREEN|escape}>"  />
                        <{if $columntooltips.SCREEN}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.SCREEN}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONDITION_FIELD'])}>
    
        <{if $preset == 'CONDITION_FIELD'}>
            <input type="hidden" class="input-condition-field" name="adminview_formdata_CONDITION_FIELD" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONDITION_FIELD']) && !$acleditablecolumns['CONDITION_FIELD'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONDITION_FIELD'])}>
            <input type="hidden" class="input-condition-field" name="adminview_formdata_CONDITION_FIELD" value="<{$details->CONDITION_FIELD}>" />
        <{else}>
    		<td class="form-row form-row-condition-field">
                <div class="form-field form-field-label">
        		    <label><{label key="L_CONDITION_FIELD"}></label>
                </div>
            </td>
            <td class="form-row form-row-condition-field" colspan="3">
                <div class="form-field form-field-value column-condition-field">
                                            

    <input class="input-condition-field input-type-text" type="text" name="<{$prefix}>adminview_formdata_CONDITION_FIELD" value="<{$details->CONDITION_FIELD|escape}>"  />
                        <{if $columntooltips.CONDITION_FIELD}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONDITION_FIELD}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['CONDITION_VALUE'])}>
    
        <{if $preset == 'CONDITION_VALUE'}>
            <input type="hidden" class="input-condition-value" name="adminview_formdata_CONDITION_VALUE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['CONDITION_VALUE']) && !$acleditablecolumns['CONDITION_VALUE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['CONDITION_VALUE'])}>
            <input type="hidden" class="input-condition-value" name="adminview_formdata_CONDITION_VALUE" value="<{$details->CONDITION_VALUE}>" />
        <{else}>
    		<td class="form-row form-row-condition-value">
                <div class="form-field form-field-label">
        		    <label><{label key="L_CONDITION_VALUE"}></label>
                </div>
            </td>
            <td class="form-row form-row-condition-value" colspan="3">
                <div class="form-field form-field-value column-condition-value">
                                            

    <input class="input-condition-value input-type-text" type="text" name="<{$prefix}>adminview_formdata_CONDITION_VALUE" value="<{$details->CONDITION_VALUE|escape}>"  />
                        <{if $columntooltips.CONDITION_VALUE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.CONDITION_VALUE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['TEMPLATE'])}>
    
        <{if $preset == 'TEMPLATE'}>
            <input type="hidden" class="input-template" name="adminview_formdata_TEMPLATE" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['TEMPLATE']) && !$acleditablecolumns['TEMPLATE'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['TEMPLATE'])}>
            <input type="hidden" class="input-template" name="adminview_formdata_TEMPLATE" value="<{$details->TEMPLATE}>" />
        <{else}>
    		<td class="form-row form-row-template">
                <div class="form-field form-field-label">
        		    <label><{label key="L_TEMPLATE"}></label>
                </div>
            </td>
            <td class="form-row form-row-template" colspan="3">
                <div class="form-field form-field-value column-template">
                                            

    <input class="input-template input-type-text" type="text" name="<{$prefix}>adminview_formdata_TEMPLATE" value="<{$details->TEMPLATE|escape}>"  />
                        <{if $columntooltips.TEMPLATE}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.TEMPLATE}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_PRINT_VIEW'])}>
    
        <{if $preset == 'IS_PRINT_VIEW'}>
            <input type="hidden" class="input-is-print-view" name="adminview_formdata_IS_PRINT_VIEW" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_PRINT_VIEW']) && !$acleditablecolumns['IS_PRINT_VIEW'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_PRINT_VIEW'])}>
            <input type="hidden" class="input-is-print-view" name="adminview_formdata_IS_PRINT_VIEW" value="<{$details->IS_PRINT_VIEW}>" />
        <{else}>
    		<td class="form-row form-row-is-print-view">
                <div class="form-field form-field-label">
        		    <label><{label key="L_IS_PRINT_VIEW"}></label>
                </div>
            </td>
            <td class="form-row form-row-is-print-view" colspan="3">
                <div class="form-field form-field-value column-is-print-view">
                                            

    <span class="input-type-radio"><input class="input-is-print-view" type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="1" <{if $details->IS_PRINT_VIEW}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="0" <{if !$details->IS_PRINT_VIEW}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                        <{if $columntooltips.IS_PRINT_VIEW}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_PRINT_VIEW}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="adminview_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="adminview_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{label key="L_ORDERING"}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>adminview_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
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
                        <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
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
                                    		    <label><{label text=$item->NAME}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
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

        <{plugin key="adminview_form_bottom" args=$details}>
    </form>
</div>

    <{if $details->UUID == 0}>
        <script type="text/javascript">
            $(document).ready(function() {
                                                            alias_hint('adminview_formdata_TITLE', 'adminview_formdata_CODE');
                                                });
        </script>
    <{/if}>


<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminviewform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminviewform :input').change(function() {
        $('#adminviewform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminviewform').length) {
            if ($('#adminviewform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminview/savedraft/",
                    data: $('#adminviewform').serialize()
                });

                $('#adminviewform').data('changed', false);
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
    adminview_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminviewform').find('[name*=adminview_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminview_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminview_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminview_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminview_apply_block_visibility(key, value);
        });
    }

    adminview_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminview_update_visibility_settings = function () {
        var model = adminview_get_editing_model();

        var settings = adminview_get_visibility_settings(model);

        adminview_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminviewform :input').change(function() {
            adminview_update_visibility_settings();
        });

        adminview_update_visibility_settings();
    });
</script>