<div class="view-main">
    <{plugin key="parametertype_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('L_PARAMETER_TYPE_NAME')}></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
            	<div class="attribute-line column-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['NAME']) && $acleditablecolumns['NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['NAME']) || $acleditablecolumns['NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>parametertype_formdata_NAME" value="<{$details->NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['BASE_TYPE_CODE']) && ((isset($aclviewablecolumns['BASE_TYPE_CODE']) && $aclviewablecolumns['BASE_TYPE_CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['BASE_TYPE_CODE']) || $aclviewablecolumns['BASE_TYPE_CODE']))) }>
        <{if !isset($columns2hide) || !in_array('BASE_TYPE_CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-base-type-code">
	            		        <label class="attribute-name"><{_t('L_BASE_TYPE_CODE')}></label>
            </td>
            <td class="form-field form-field-value column-base-type-code" colspan="3">
            	<div class="attribute-line column-base-type-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['BASE_TYPE_CODE']) && $acleditablecolumns['BASE_TYPE_CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['BASE_TYPE_CODE']) || $acleditablecolumns['BASE_TYPE_CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->BASE_TYPE_CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-base-type-code input-type-text" type="text" name="<{$prefix}>parametertype_formdata_BASE_TYPE_CODE" value="<{$details->BASE_TYPE_CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->BASE_TYPE_CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['EXTRA']) && ((isset($aclviewablecolumns['EXTRA']) && $aclviewablecolumns['EXTRA']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['EXTRA']) || $aclviewablecolumns['EXTRA']))) }>
        <{if !isset($columns2hide) || !in_array('EXTRA', $columns2hide) }>
    		<td class="form-field form-field-label column-extra">
	            		        <label class="attribute-name"><{_t('L_EXTRA')}></label>
            </td>
            <td class="form-field form-field-value column-extra" colspan="3">
            	<div class="attribute-line column-extra type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['EXTRA']) && $acleditablecolumns['EXTRA']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['EXTRA']) || $acleditablecolumns['EXTRA'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->EXTRA|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-extra input-type-text" type="text" name="<{$prefix}>parametertype_formdata_EXTRA" value="<{$details->EXTRA|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->EXTRA|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
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
                                <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                		<div class="attribute-value">
                                            <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
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

    <div class="layout-block layout-block-section">
        <div class="layout-section">
            <div class="layout-section-content">
                <table class="table table-bordered table-custom-layout equal-split">
                    <tbody>
                        <{foreach from=$additional_view_fields item=item}>
                            <tr class="attribute-line">
                        		<td class="form-field form-field-label">
                    		        <label class="attribute-name"><{$item.label}></label>
                                </td>
                                <td class="form-field form-field-value">
                            		<div class="attribute-value">
                                        <{$item.value}>
                            		</div>
                                </td>
                    		</tr>
                    	<{/foreach}>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <{plugin key="parametertype_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        parametertypeview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        parametertypeview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                parametertypeview_apply_block_visibility(key, value);
            });
        }

        parametertypeview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        parametertypeview_update_visibility_settings = function () {
            var settings = parametertypeview_get_visibility_settings();

            parametertypeview_apply_visibility_settings(settings);
        }

        $(function() {
            parametertypeview_update_visibility_settings();
        });

        $(function() {
            // x. Row expanders
            $('.view-main .view-row-expander').die('click').live('click', function(event) {
                event.preventDefault();

                var expander = $(this);
                var tr = expander.closest('tr');
                var table = tr.closest('table');

                var module = expander.data('module');
                var id = expander.data('id');

                // Hide others
                table.find('tr').not(tr).find('.view-row-expander').addClass('fa-caret-right').removeClass('fa-caret-down');
                table.find('tr.view-embedded-view').not('tr.' + module + '-view-embedded-view-' + id).hide();

                expander.toggleClass('fa-caret-right');
                expander.toggleClass('fa-caret-down');

                var tr_expandable = tr.next('tr.' + module + '-view-embedded-view-' + id);

                if (tr_expandable.length == 0) {
                    $.ajax({
                        type: "get",
                        url: "<{$smarty.const.APPLICATION_URL}>/" + module + "/rowExpandedView/" + id + "?source=view&colcount=4"
                    }).done(function(html) {
                        tr.after(html);
                    });
                }

                tr_expandable.toggle();
            });

//            // x. Onfly view edit
//            $('td.form-field-value').die('click').live('click', function(){
//                var td = $(this);
//
//                var view = $(this).find('.value-mode');
//                var edit = $(this).find('.edit-mode');
//                var input = $(this).find('.edit-mode>:input');
//
//                if (view.length == 0 || edit.length == 0) {
//                    return;
//                }
//
//                if (edit.is(":visible")) {
//                    return;
//                }
//
//                view.hide();
//                edit.show();
//
//                input.css('max-width', td.width() - 10);
//                input.focus();
//
//                var saved = false;
//
//                input.off('blur').on('blur', function(event) {
//                    event.preventDefault();
//
//                    // Workaround in case of an unexpected blur event from an auto-complete selection box
//                    if (input.is("select") && event.type == 'blur') {
//                        return;
//                    }
//
//                    var saved = false;
//                    input.change();
//                    saved = true;
//                });
//
//                input.off('change').on('change', function(event) {
//                    event.preventDefault();
//
//                    if (saved) {
//                        return;
//                    }
//
//                    var message = edit.find('.message');
//
//                    if (message.length == 0) {
//                        message = $('<div class="message"></div>').insertBefore(input);
//                    }
//
//                    $.ajax({
//                        type: "post",
//                        dataType: "json",
//                        url: "<{$smarty.const.APPLICATION_URL}>/parametertype/fieldSave",
//                        data: td.find(':input').serialize() + "&parametertype_formdata_UUID=<{$details->UUID}>"
//                    }).done(function(data) {
//                        if (data.success) {
//                            if (input.is("select")) {
//                                var txt = input.find('option:selected').map(function () {
//                                    return $(this).text().trim();
//                                }).get().join(', ');
//
//                                view.html(txt);
//                            } else {
//                                view.html(input.val());
//                            }
//
//                            view.show();
//                            edit.hide();
//
//                            message.remove();
//                        } else {
//                            input.focus();
//
//                            message.html('<span>' + data.message + '</span>');
//                        }
//                    });
//                });
//            });
        });

    </script>
</div>