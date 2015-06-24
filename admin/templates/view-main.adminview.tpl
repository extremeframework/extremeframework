<div class="view-main">
    <{plugin key="adminview_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{label key="L_TITLE"}></label>
            </td>
            <td class="form-field form-field-value column-title" colspan="3">
            	<div class="attribute-line column-title type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TITLE']) && $acleditablecolumns['TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TITLE']) || $acleditablecolumns['TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TITLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>adminview_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TITLE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-code">
	            		        <label class="attribute-name"><{label key="L_CODE"}></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
            	<div class="attribute-line column-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CODE']) && $acleditablecolumns['CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CODE']) || $acleditablecolumns['CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>adminview_formdata_CODE" value="<{$details->CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CODE|escape}>
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
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminview_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminview_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['SCREEN']) && ((isset($aclviewablecolumns['SCREEN']) && $aclviewablecolumns['SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SCREEN']) || $aclviewablecolumns['SCREEN']))) }>
        <{if !isset($columns2hide) || !in_array('SCREEN', $columns2hide) }>
    		<td class="form-field form-field-label column-screen">
	            		        <label class="attribute-name"><{label key="L_SCREEN"}></label>
            </td>
            <td class="form-field form-field-value column-screen" colspan="3">
            	<div class="attribute-line column-screen type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['SCREEN']) && $acleditablecolumns['SCREEN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['SCREEN']) || $acleditablecolumns['SCREEN'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->SCREEN|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-screen input-type-text" type="text" name="<{$prefix}>adminview_formdata_SCREEN" value="<{$details->SCREEN|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->SCREEN|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONDITION_FIELD']) && ((isset($aclviewablecolumns['CONDITION_FIELD']) && $aclviewablecolumns['CONDITION_FIELD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_FIELD']) || $aclviewablecolumns['CONDITION_FIELD']))) }>
        <{if !isset($columns2hide) || !in_array('CONDITION_FIELD', $columns2hide) }>
    		<td class="form-field form-field-label column-condition-field">
	            		        <label class="attribute-name"><{label key="L_CONDITION_FIELD"}></label>
            </td>
            <td class="form-field form-field-value column-condition-field" colspan="3">
            	<div class="attribute-line column-condition-field type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONDITION_FIELD']) && $acleditablecolumns['CONDITION_FIELD']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONDITION_FIELD']) || $acleditablecolumns['CONDITION_FIELD'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CONDITION_FIELD|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-condition-field input-type-text" type="text" name="<{$prefix}>adminview_formdata_CONDITION_FIELD" value="<{$details->CONDITION_FIELD|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CONDITION_FIELD|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONDITION_VALUE']) && ((isset($aclviewablecolumns['CONDITION_VALUE']) && $aclviewablecolumns['CONDITION_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION_VALUE']) || $aclviewablecolumns['CONDITION_VALUE']))) }>
        <{if !isset($columns2hide) || !in_array('CONDITION_VALUE', $columns2hide) }>
    		<td class="form-field form-field-label column-condition-value">
	            		        <label class="attribute-name"><{label key="L_CONDITION_VALUE"}></label>
            </td>
            <td class="form-field form-field-value column-condition-value" colspan="3">
            	<div class="attribute-line column-condition-value type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONDITION_VALUE']) && $acleditablecolumns['CONDITION_VALUE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONDITION_VALUE']) || $acleditablecolumns['CONDITION_VALUE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CONDITION_VALUE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-condition-value input-type-text" type="text" name="<{$prefix}>adminview_formdata_CONDITION_VALUE" value="<{$details->CONDITION_VALUE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CONDITION_VALUE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TEMPLATE']) && ((isset($aclviewablecolumns['TEMPLATE']) && $aclviewablecolumns['TEMPLATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEMPLATE']) || $aclviewablecolumns['TEMPLATE']))) }>
        <{if !isset($columns2hide) || !in_array('TEMPLATE', $columns2hide) }>
    		<td class="form-field form-field-label column-template">
	            		        <label class="attribute-name"><{label key="L_TEMPLATE"}></label>
            </td>
            <td class="form-field form-field-value column-template" colspan="3">
            	<div class="attribute-line column-template type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TEMPLATE']) && $acleditablecolumns['TEMPLATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TEMPLATE']) || $acleditablecolumns['TEMPLATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TEMPLATE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-template input-type-text" type="text" name="<{$prefix}>adminview_formdata_TEMPLATE" value="<{$details->TEMPLATE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TEMPLATE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_PRINT_VIEW']) && ((isset($aclviewablecolumns['IS_PRINT_VIEW']) && $aclviewablecolumns['IS_PRINT_VIEW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_PRINT_VIEW']) || $aclviewablecolumns['IS_PRINT_VIEW']))) }>
        <{if !isset($columns2hide) || !in_array('IS_PRINT_VIEW', $columns2hide) }>
    		<td class="form-field form-field-label column-is-print-view">
	            		        <label class="attribute-name"><{label key="L_IS_PRINT_VIEW"}></label>
            </td>
            <td class="form-field form-field-value column-is-print-view" colspan="3">
            	<div class="attribute-line column-is-print-view type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_PRINT_VIEW']) && $acleditablecolumns['IS_PRINT_VIEW']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_PRINT_VIEW']) || $acleditablecolumns['IS_PRINT_VIEW'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_PRINT_VIEW}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-print-view" type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="1" <{if $details->IS_PRINT_VIEW}>checked="checked"<{/if}>><{label key="L_YES"}> <input type="radio" name="<{$prefix}>adminview_formdata_IS_PRINT_VIEW" value="0" <{if !$details->IS_PRINT_VIEW}>checked="checked"<{/if}> /><{label key="L_NO"}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_PRINT_VIEW}><{label key="L_YES"}><{else}><{label key="L_NO"}><{/if}>
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

    <{plugin key="adminview_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminviewview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminviewview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminviewview_apply_block_visibility(key, value);
            });
        }

        adminviewview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminviewview_update_visibility_settings = function () {
            var settings = adminviewview_get_visibility_settings();

            adminviewview_apply_visibility_settings(settings);
        }

        $(function() {
            adminviewview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminview/fieldSave",
//                        data: td.find(':input').serialize() + "&adminview_formdata_UUID=<{$details->UUID}>"
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