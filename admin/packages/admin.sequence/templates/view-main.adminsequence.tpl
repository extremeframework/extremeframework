<div class="view-main">
    <{plugin key="adminsequence_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['MODULE']) && ((isset($aclviewablecolumns['MODULE']) && $aclviewablecolumns['MODULE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['MODULE']) || $aclviewablecolumns['MODULE']))) }>
        <{if !isset($columns2hide) || !in_array('MODULE', $columns2hide) }>
    		<td class="form-field form-field-label column-module">
	                    		        	                <{if isset($smarty.session.acl.adminmodule.view)}>
    	                    <{if $details->MODULE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminmodule" data-id="<{$details->refuuid_MODULE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_MODULE')}></label>
            </td>
            <td class="form-field form-field-value column-module" colspan="3">
            	<div class="attribute-line column-module type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['MODULE']) && $acleditablecolumns['MODULE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['MODULE']) || $acleditablecolumns['MODULE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
        <{else}>
            <{$details->reftext_MODULE|escape}>        <{/if}>
    <{else}>
		<{$details->MODULE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminModule')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminsequence_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_MODULE}>
        <{if isset($smarty.session.acl.adminmodule.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/view/<{$details->refuuid_MODULE}>"><{$details->reftext_MODULE|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['SEQUENCE_FORMAT']) && ((isset($aclviewablecolumns['SEQUENCE_FORMAT']) && $aclviewablecolumns['SEQUENCE_FORMAT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_FORMAT']) || $aclviewablecolumns['SEQUENCE_FORMAT']))) }>
        <{if !isset($columns2hide) || !in_array('SEQUENCE_FORMAT', $columns2hide) }>
    		<td class="form-field form-field-label column-sequence-format">
	            		        <label class="attribute-name"><{_t('L_SEQUENCE_FORMAT')}></label>
            </td>
            <td class="form-field form-field-value column-sequence-format" colspan="3">
            	<div class="attribute-line column-sequence-format type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['SEQUENCE_FORMAT']) && $acleditablecolumns['SEQUENCE_FORMAT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['SEQUENCE_FORMAT']) || $acleditablecolumns['SEQUENCE_FORMAT'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->SEQUENCE_FORMAT|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-sequence-format input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_FORMAT" value="<{$details->SEQUENCE_FORMAT|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->SEQUENCE_FORMAT|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CURRENT_VALUE']) && ((isset($aclviewablecolumns['CURRENT_VALUE']) && $aclviewablecolumns['CURRENT_VALUE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CURRENT_VALUE']) || $aclviewablecolumns['CURRENT_VALUE']))) }>
        <{if !isset($columns2hide) || !in_array('CURRENT_VALUE', $columns2hide) }>
    		<td class="form-field form-field-label column-current-value">
	            		        <label class="attribute-name"><{_t('L_CURRENT_VALUE')}></label>
            </td>
            <td class="form-field form-field-value column-current-value" colspan="3">
            	<div class="attribute-line column-current-value type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CURRENT_VALUE']) && $acleditablecolumns['CURRENT_VALUE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CURRENT_VALUE']) || $acleditablecolumns['CURRENT_VALUE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CURRENT_VALUE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-current-value input-type-text" type="text" name="<{$prefix}>adminsequence_formdata_CURRENT_VALUE" value="<{$details->CURRENT_VALUE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CURRENT_VALUE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['SEQUENCE_STEP']) && ((isset($aclviewablecolumns['SEQUENCE_STEP']) && $aclviewablecolumns['SEQUENCE_STEP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['SEQUENCE_STEP']) || $aclviewablecolumns['SEQUENCE_STEP']))) }>
        <{if !isset($columns2hide) || !in_array('SEQUENCE_STEP', $columns2hide) }>
    		<td class="form-field form-field-label column-sequence-step">
	            		        <label class="attribute-name"><{_t('L_SEQUENCE_STEP')}></label>
            </td>
            <td class="form-field form-field-value column-sequence-step" colspan="3">
            	<div class="attribute-line column-sequence-step type-number">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['SEQUENCE_STEP']) && $acleditablecolumns['SEQUENCE_STEP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['SEQUENCE_STEP']) || $acleditablecolumns['SEQUENCE_STEP'])) }>
                    		    <span class="value-mode">
                                    
        <span class="number number-format"><{if $details->SEQUENCE_STEP != 0}><{$details->SEQUENCE_STEP}><{/if}></span>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
        <input class="input-sequence-step input-type-number number-format" type="text" name="<{$prefix}>adminsequence_formdata_SEQUENCE_STEP" value="<{if $details->SEQUENCE_STEP != 0}><{$details->SEQUENCE_STEP}><{/if}>"  />
                                </span>
                                -->
                            <{else}>
                                
        <span class="number number-format"><{if $details->SEQUENCE_STEP != 0}><{$details->SEQUENCE_STEP}><{/if}></span>
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

    <{plugin key="adminsequence_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminsequenceview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminsequenceview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminsequenceview_apply_block_visibility(key, value);
            });
        }

        adminsequenceview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminsequenceview_update_visibility_settings = function () {
            var settings = adminsequenceview_get_visibility_settings();

            adminsequenceview_apply_visibility_settings(settings);
        }

        $(function() {
            adminsequenceview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminsequence/fieldSave",
//                        data: td.find(':input').serialize() + "&adminsequence_formdata_UUID=<{$details->UUID}>"
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