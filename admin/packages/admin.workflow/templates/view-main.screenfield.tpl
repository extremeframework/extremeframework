<div class="view-main">
    <{plugin key="screenfield_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_SCREEN']) && ((isset($aclviewablecolumns['ID_SCREEN']) && $aclviewablecolumns['ID_SCREEN']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_SCREEN']) || $aclviewablecolumns['ID_SCREEN']))) }>
        <{if !isset($columns2hide) || !in_array('ID_SCREEN', $columns2hide) }>
    		<td class="form-field form-field-label column-id-screen">
	                    		                    		        <label class="attribute-name"><{_t('Screen')}></label>
            </td>
            <td class="form-field form-field-value column-id-screen" colspan="3">
            	<div class="attribute-line column-id-screen type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_SCREEN']) && $acleditablecolumns['ID_SCREEN']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_SCREEN']) || $acleditablecolumns['ID_SCREEN'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_SCREEN}>
        <{if isset($smarty.session.acl.screen.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->refuuid_ID_SCREEN}>"><{$details->reftext_ID_SCREEN|escape}></a>
        <{else}>
            <{$details->reftext_ID_SCREEN|escape}>        <{/if}>
    <{else}>
		<{$details->ID_SCREEN}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Screen')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-screen" class="input-id-screen" name="`$prefix`screenfield_formdata_ID_SCREEN" value=$details->ID_SCREEN text=$details->reftext_ID_SCREEN datasource="SCREEN" valuecol="CODE" textcol="TITLE" sortcol=""}>

                            <{if isset($smarty.session.acl.screen.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/new" title="Create a New Screen">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-screen input-type-text" type="text" name="<{$prefix}>screenfield_formdata_ID_SCREEN" value="<{$details->ID_SCREEN|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_SCREEN}>
        <{if isset($smarty.session.acl.screen.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/screen/view/<{$details->refuuid_ID_SCREEN}>"><{$details->reftext_ID_SCREEN|escape}></a>
        <{else}>
            <{$details->reftext_ID_SCREEN|escape}>        <{/if}>
    <{else}>
		<{$details->ID_SCREEN}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>screenfield_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
	            		        <label class="attribute-name"><{_t('Code')}></label>
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
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>screenfield_formdata_CODE" value="<{$details->CODE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_VALUE_TYPE']) && ((isset($aclviewablecolumns['ID_VALUE_TYPE']) && $aclviewablecolumns['ID_VALUE_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_VALUE_TYPE']) || $aclviewablecolumns['ID_VALUE_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_VALUE_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-value-type">
	                    		                    		        <label class="attribute-name"><{_t('Value type')}></label>
            </td>
            <td class="form-field form-field-value column-id-value-type" colspan="3">
            	<div class="attribute-line column-id-value-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_VALUE_TYPE']) && $acleditablecolumns['ID_VALUE_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_VALUE_TYPE']) || $acleditablecolumns['ID_VALUE_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_VALUE_TYPE}>
        <{if isset($smarty.session.acl.valuetype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/view/<{$details->refuuid_ID_VALUE_TYPE}>"><{$details->reftext_ID_VALUE_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_VALUE_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_VALUE_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('ValueType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-value-type" class="input-id-value-type" name="`$prefix`screenfield_formdata_ID_VALUE_TYPE" value=$details->ID_VALUE_TYPE text=$details->reftext_ID_VALUE_TYPE datasource="VALUE_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <{if isset($smarty.session.acl.valuetype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/new" title="Create a New Value Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-value-type input-type-text" type="text" name="<{$prefix}>screenfield_formdata_ID_VALUE_TYPE" value="<{$details->ID_VALUE_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_VALUE_TYPE}>
        <{if isset($smarty.session.acl.valuetype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/valuetype/view/<{$details->refuuid_ID_VALUE_TYPE}>"><{$details->reftext_ID_VALUE_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_VALUE_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_VALUE_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DATASOURCE']) && ((isset($aclviewablecolumns['DATASOURCE']) && $aclviewablecolumns['DATASOURCE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATASOURCE']) || $aclviewablecolumns['DATASOURCE']))) }>
        <{if !isset($columns2hide) || !in_array('DATASOURCE', $columns2hide) }>
    		<td class="form-field form-field-label column-datasource">
	            		        <label class="attribute-name"><{_t('Datasource')}></label>
            </td>
            <td class="form-field form-field-value column-datasource" colspan="3">
            	<div class="attribute-line column-datasource type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DATASOURCE']) && $acleditablecolumns['DATASOURCE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DATASOURCE']) || $acleditablecolumns['DATASOURCE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->DATASOURCE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-datasource input-type-text" type="text" name="<{$prefix}>screenfield_formdata_DATASOURCE" value="<{$details->DATASOURCE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->DATASOURCE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONDITION']) && ((isset($aclviewablecolumns['CONDITION']) && $aclviewablecolumns['CONDITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONDITION']) || $aclviewablecolumns['CONDITION']))) }>
        <{if !isset($columns2hide) || !in_array('CONDITION', $columns2hide) }>
    		<td class="form-field form-field-label column-condition">
	            		        <label class="attribute-name"><{_t('Condition')}></label>
            </td>
            <td class="form-field form-field-value column-condition" colspan="3">
            	<div class="attribute-line column-condition type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONDITION']) && $acleditablecolumns['CONDITION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONDITION']) || $acleditablecolumns['CONDITION'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CONDITION|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-condition input-type-text" type="text" name="<{$prefix}>screenfield_formdata_CONDITION" value="<{$details->CONDITION|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CONDITION|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VALUECOL']) && ((isset($aclviewablecolumns['VALUECOL']) && $aclviewablecolumns['VALUECOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUECOL']) || $aclviewablecolumns['VALUECOL']))) }>
        <{if !isset($columns2hide) || !in_array('VALUECOL', $columns2hide) }>
    		<td class="form-field form-field-label column-valuecol">
	            		        <label class="attribute-name"><{_t('Valuecol')}></label>
            </td>
            <td class="form-field form-field-value column-valuecol" colspan="3">
            	<div class="attribute-line column-valuecol type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VALUECOL']) && $acleditablecolumns['VALUECOL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VALUECOL']) || $acleditablecolumns['VALUECOL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VALUECOL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-valuecol input-type-text" type="text" name="<{$prefix}>screenfield_formdata_VALUECOL" value="<{$details->VALUECOL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VALUECOL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TEXTCOL']) && ((isset($aclviewablecolumns['TEXTCOL']) && $aclviewablecolumns['TEXTCOL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TEXTCOL']) || $aclviewablecolumns['TEXTCOL']))) }>
        <{if !isset($columns2hide) || !in_array('TEXTCOL', $columns2hide) }>
    		<td class="form-field form-field-label column-textcol">
	            		        <label class="attribute-name"><{_t('Textcol')}></label>
            </td>
            <td class="form-field form-field-value column-textcol" colspan="3">
            	<div class="attribute-line column-textcol type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['TEXTCOL']) && $acleditablecolumns['TEXTCOL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['TEXTCOL']) || $acleditablecolumns['TEXTCOL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->TEXTCOL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-textcol input-type-text" type="text" name="<{$prefix}>screenfield_formdata_TEXTCOL" value="<{$details->TEXTCOL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->TEXTCOL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IS_MANDATORY']) && ((isset($aclviewablecolumns['IS_MANDATORY']) && $aclviewablecolumns['IS_MANDATORY']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IS_MANDATORY']) || $aclviewablecolumns['IS_MANDATORY']))) }>
        <{if !isset($columns2hide) || !in_array('IS_MANDATORY', $columns2hide) }>
    		<td class="form-field form-field-label column-is-mandatory">
	            		        <label class="attribute-name"><{_t('Mandatory?')}></label>
            </td>
            <td class="form-field form-field-value column-is-mandatory" colspan="3">
            	<div class="attribute-line column-is-mandatory type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IS_MANDATORY']) && $acleditablecolumns['IS_MANDATORY']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IS_MANDATORY']) || $acleditablecolumns['IS_MANDATORY'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->IS_MANDATORY}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-is-mandatory" type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="1" <{if $details->IS_MANDATORY}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>screenfield_formdata_IS_MANDATORY" value="0" <{if !$details->IS_MANDATORY}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->IS_MANDATORY}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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

    <{if $additional_view_fields}>
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
    <{/if}>

    <{plugin key="screenfield_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        screenfieldview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        screenfieldview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                screenfieldview_apply_block_visibility(key, value);
            });
        }

        screenfieldview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        screenfieldview_update_visibility_settings = function () {
            var settings = screenfieldview_get_visibility_settings();

            screenfieldview_apply_visibility_settings(settings);
        }

        $(function() {
            screenfieldview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/screenfield/fieldSave",
//                        data: td.find(':input').serialize() + "&screenfield_formdata_UUID=<{$details->UUID}>"
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