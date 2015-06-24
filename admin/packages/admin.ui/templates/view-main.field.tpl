<div class="view-main">
    <{plugin key="field_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{label key="L_FIELD_NAME"}></label>
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
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>field_formdata_NAME" value="<{$details->NAME|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
        <{if !isset($columns2hide) || !in_array('MODULE', $columns2hide) }>
    		<td class="form-field form-field-label column-module">
	                    		        	                <{if isset($smarty.session.acl.adminmodule.view)}>
    	                    <{if $details->MODULE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminmodule" data-id="<{$details->refuuid_MODULE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{label key="L_MODULE"}></label>
            </td>
            <td class="form-field form-field-value column-module" colspan="3">
            	<div class="attribute-line column-module type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['MODULE']) && $acleditablecolumns['MODULE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['MODULE']) || $acleditablecolumns['MODULE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`field_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>field_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['COLUMN']) && ((isset($aclviewablecolumns['COLUMN']) && $aclviewablecolumns['COLUMN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['COLUMN']) || $aclviewablecolumns['COLUMN']))) }>
        <{if !isset($columns2hide) || !in_array('COLUMN', $columns2hide) }>
    		<td class="form-field form-field-label column-column">
	            		        <label class="attribute-name"><{label key="L_COLUMN"}></label>
            </td>
            <td class="form-field form-field-value column-column" colspan="3">
            	<div class="attribute-line column-column type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['COLUMN']) && $acleditablecolumns['COLUMN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['COLUMN']) || $acleditablecolumns['COLUMN'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->COLUMN|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-column input-type-text" type="text" name="<{$prefix}>field_formdata_COLUMN" value="<{$details->COLUMN|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->COLUMN|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TOOLTIP']) && ((isset($aclviewablecolumns['TOOLTIP']) && $aclviewablecolumns['TOOLTIP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TOOLTIP']) || $aclviewablecolumns['TOOLTIP']))) }>
        <{if !isset($columns2hide) || !in_array('TOOLTIP', $columns2hide) }>
    		<td class="form-field form-field-label column-tooltip">
	            		        <label class="attribute-name"><{label key="L_TOOLTIP"}></label>
            </td>
            <td class="form-field form-field-value column-tooltip" colspan="3">
            	<div class="attribute-line column-tooltip type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TOOLTIP']) && $acleditablecolumns['TOOLTIP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TOOLTIP']) || $acleditablecolumns['TOOLTIP'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TOOLTIP|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-tooltip input-type-text" type="text" name="<{$prefix}>field_formdata_TOOLTIP" value="<{$details->TOOLTIP|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TOOLTIP|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_EXCLUDED']) && ((isset($aclviewablecolumns['IS_EXCLUDED']) && $aclviewablecolumns['IS_EXCLUDED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_EXCLUDED']) || $aclviewablecolumns['IS_EXCLUDED']))) }>
        <{if !isset($columns2hide) || !in_array('IS_EXCLUDED', $columns2hide) }>
    		<td class="form-field form-field-label column-is-excluded">
	            		        <label class="attribute-name"><{label key="L_IS_EXCLUDED"}></label>
            </td>
            <td class="form-field form-field-value column-is-excluded" colspan="3">
            	<div class="attribute-line column-is-excluded type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_EXCLUDED']) && $acleditablecolumns['IS_EXCLUDED']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_EXCLUDED']) || $acleditablecolumns['IS_EXCLUDED'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_EXCLUDED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-excluded" type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="1" <{if $details->IS_EXCLUDED}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>field_formdata_IS_EXCLUDED" value="0" <{if !$details->IS_EXCLUDED}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_EXCLUDED}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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
                    <span><{label text="L_ADDITIONAL_INFORMATION"}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{label text=$item->NAME}></label>
                                    </td>
                                    <td class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                    	<div class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>>
                                    		<div class="attribute-value">
                                                <{CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
                                    		</div>
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

    <{foreach from=$additional_view_fields item=item}>
    	<div class="attribute-line custom-field type-<{$item.type}>">
    		<label class="attribute-name"><{$item.label}></label>
    		<div class="attribute-value">
                <{$item.value}>
    		</div>
    	</div>
	<{/foreach}>

    <{plugin key="field_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        fieldview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        fieldview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                fieldview_apply_block_visibility(key, value);
            });
        }

        fieldview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        fieldview_update_visibility_settings = function () {
            var settings = fieldview_get_visibility_settings();

            fieldview_apply_visibility_settings(settings);
        }

        $(function() {
            fieldview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/field/fieldSave",
//                        data: td.find(':input').serialize() + "&field_formdata_UUID=<{$details->UUID}>"
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