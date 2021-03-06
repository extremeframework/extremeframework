<div class="view-main">
    <{plugin key="parameter_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('Parameter name')}></label>
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
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>parameter_formdata_NAME" value="<{$details->NAME|escape}>"  />
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
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>parameter_formdata_CODE" value="<{$details->CODE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_PARAMETER_GROUP']) && ((isset($aclviewablecolumns['ID_PARAMETER_GROUP']) && $aclviewablecolumns['ID_PARAMETER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_GROUP']) || $aclviewablecolumns['ID_PARAMETER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PARAMETER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-id-parameter-group">
	                    		                    		        <label class="attribute-name"><{_t('Parameter group')}></label>
            </td>
            <td class="form-field form-field-value column-id-parameter-group" colspan="3">
            	<div class="attribute-line column-id-parameter-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PARAMETER_GROUP']) && $acleditablecolumns['ID_PARAMETER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PARAMETER_GROUP']) || $acleditablecolumns['ID_PARAMETER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PARAMETER_GROUP}>
        <{if isset($smarty.session.acl.parametergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/view/<{$details->refuuid_ID_PARAMETER_GROUP}>"><{$details->reftext_ID_PARAMETER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_PARAMETER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PARAMETER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('ParameterGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-parameter-group" class="input-id-parameter-group" name="`$prefix`parameter_formdata_ID_PARAMETER_GROUP" value=$details->ID_PARAMETER_GROUP text=$details->reftext_ID_PARAMETER_GROUP datasource="PARAMETER_GROUP" datasourcename="ParameterGroup" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.parametergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/new" title="Create a New Parameter Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-parameter-group input-type-text" type="text" name="<{$prefix}>parameter_formdata_ID_PARAMETER_GROUP" value="<{$details->ID_PARAMETER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PARAMETER_GROUP}>
        <{if isset($smarty.session.acl.parametergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametergroup/view/<{$details->refuuid_ID_PARAMETER_GROUP}>"><{$details->reftext_ID_PARAMETER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_PARAMETER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PARAMETER_GROUP}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_PARAMETER_TYPE']) && ((isset($aclviewablecolumns['ID_PARAMETER_TYPE']) && $aclviewablecolumns['ID_PARAMETER_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PARAMETER_TYPE']) || $aclviewablecolumns['ID_PARAMETER_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PARAMETER_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-parameter-type">
	                    		        	                <{if isset($smarty.session.acl.parametertype.view)}>
    	                    <{if $details->ID_PARAMETER_TYPE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="parametertype" data-id="<{$details->refuuid_ID_PARAMETER_TYPE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Parameter type')}></label>
            </td>
            <td class="form-field form-field-value column-id-parameter-type" colspan="3">
            	<div class="attribute-line column-id-parameter-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PARAMETER_TYPE']) && $acleditablecolumns['ID_PARAMETER_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PARAMETER_TYPE']) || $acleditablecolumns['ID_PARAMETER_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PARAMETER_TYPE}>
        <{if isset($smarty.session.acl.parametertype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$details->refuuid_ID_PARAMETER_TYPE}>"><{$details->reftext_ID_PARAMETER_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PARAMETER_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PARAMETER_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('ParameterType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-parameter-type" class="input-id-parameter-type" name="`$prefix`parameter_formdata_ID_PARAMETER_TYPE" value=$details->ID_PARAMETER_TYPE text=$details->reftext_ID_PARAMETER_TYPE datasource="PARAMETER_TYPE" datasourcename="ParameterType" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.parametertype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/new" title="Create a New Parameter Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-parameter-type input-type-text" type="text" name="<{$prefix}>parameter_formdata_ID_PARAMETER_TYPE" value="<{$details->ID_PARAMETER_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PARAMETER_TYPE}>
        <{if isset($smarty.session.acl.parametertype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/parametertype/view/<{$details->refuuid_ID_PARAMETER_TYPE}>"><{$details->reftext_ID_PARAMETER_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PARAMETER_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PARAMETER_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VALUE']) && ((isset($aclviewablecolumns['VALUE']) && $aclviewablecolumns['VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALUE']) || $aclviewablecolumns['VALUE']))) }>
        <{if !isset($columns2hide) || !in_array('VALUE', $columns2hide) }>
    		<td class="form-field form-field-label column-value">
	            		        <label class="attribute-name"><{_t('Value')}></label>
            </td>
            <td class="form-field form-field-value column-value" colspan="3">
            	<div class="attribute-line column-value type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VALUE']) && $acleditablecolumns['VALUE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VALUE']) || $acleditablecolumns['VALUE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VALUE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-value input-type-text" type="text" name="<{$prefix}>parameter_formdata_VALUE" value="<{$details->VALUE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VALUE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DESCRIPTION']) && ((isset($aclviewablecolumns['DESCRIPTION']) && $aclviewablecolumns['DESCRIPTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DESCRIPTION']) || $aclviewablecolumns['DESCRIPTION']))) }>
        <{if !isset($columns2hide) || !in_array('DESCRIPTION', $columns2hide) }>
    		<td class="form-field form-field-label column-description">
	            		        <label class="attribute-name"><{_t('Description')}></label>
            </td>
            <td class="form-field form-field-value column-description" colspan="3">
            	<div class="attribute-line column-description type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DESCRIPTION']) && $acleditablecolumns['DESCRIPTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DESCRIPTION']) || $acleditablecolumns['DESCRIPTION'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->DESCRIPTION|plugin:"parameter_view_field_DESCRIPTION":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-description enable-html" id="<{$prefix}>parameter_formdata_DESCRIPTION_<{$tmpid}>" name="<{$prefix}>parameter_formdata_DESCRIPTION" rows="5" ><{$details->DESCRIPTION}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->DESCRIPTION|plugin:"parameter_view_field_DESCRIPTION":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                
                <!-- Custom fields -->
                <{if $customfields}>
    <{foreach from=$customfields item=item}>
        <tr class="attribute-line column-<{$item->COLUMN_CODE}> type-<{$item->TYPE}>">
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
<{/if}>

<{if $additional_view_fields}>
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
<{/if}>            </tbody>
        </table>
    	<!-- Standard layout columns end -->
    
    <{plugin key="parameter_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        parameterview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        parameterview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                parameterview_apply_block_visibility(key, value);
            });
        }

        parameterview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        parameterview_update_visibility_settings = function () {
            var settings = parameterview_get_visibility_settings();

            parameterview_apply_visibility_settings(settings);
        }

        $(function() {
            parameterview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/parameter/fieldSave",
//                        data: td.find(':input').serialize() + "&parameter_formdata_UUID=<{$details->UUID}>"
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