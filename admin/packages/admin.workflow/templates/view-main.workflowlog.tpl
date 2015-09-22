<div class="view-main">
    <{plugin key="workflowlog_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_WORKFLOW']) && ((isset($aclviewablecolumns['ID_WORKFLOW']) && $aclviewablecolumns['ID_WORKFLOW']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW']) || $aclviewablecolumns['ID_WORKFLOW']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WORKFLOW', $columns2hide) }>
    		<td class="form-field form-field-label column-id-workflow">
	                    		                    		        <label class="attribute-name"><{_t('Workflow')}></label>
            </td>
            <td class="form-field form-field-value column-id-workflow" colspan="3">
            	<div class="attribute-line column-id-workflow type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WORKFLOW']) && $acleditablecolumns['ID_WORKFLOW']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WORKFLOW']) || $acleditablecolumns['ID_WORKFLOW'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Workflow')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-workflow" class="input-id-workflow" name="`$prefix`workflowlog_formdata_ID_WORKFLOW" value=$details->ID_WORKFLOW text=$details->reftext_ID_WORKFLOW datasource="WORKFLOW" datasourcename="Workflow" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.workflow.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/new" title="Create a New Workflow">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-workflow input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_WORKFLOW" value="<{$details->ID_WORKFLOW|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WORKFLOW}>
        <{if isset($smarty.session.acl.workflow.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflow/view/<{$details->refuuid_ID_WORKFLOW}>"><{$details->reftext_ID_WORKFLOW|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_WORKFLOW_TRANSITION']) && ((isset($aclviewablecolumns['ID_WORKFLOW_TRANSITION']) && $aclviewablecolumns['ID_WORKFLOW_TRANSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WORKFLOW_TRANSITION']) || $aclviewablecolumns['ID_WORKFLOW_TRANSITION']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WORKFLOW_TRANSITION', $columns2hide) }>
    		<td class="form-field form-field-label column-id-workflow-transition">
	                    		        	                <{if isset($smarty.session.acl.workflowtransition.view)}>
    	                    <{if $details->ID_WORKFLOW_TRANSITION}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="workflowtransition" data-id="<{$details->refuuid_ID_WORKFLOW_TRANSITION}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Workflow transition')}></label>
            </td>
            <td class="form-field form-field-value column-id-workflow-transition" colspan="3">
            	<div class="attribute-line column-id-workflow-transition type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WORKFLOW_TRANSITION']) && $acleditablecolumns['ID_WORKFLOW_TRANSITION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WORKFLOW_TRANSITION']) || $acleditablecolumns['ID_WORKFLOW_TRANSITION'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WORKFLOW_TRANSITION}>
        <{if isset($smarty.session.acl.workflowtransition.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$details->refuuid_ID_WORKFLOW_TRANSITION}>"><{$details->reftext_ID_WORKFLOW_TRANSITION|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW_TRANSITION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW_TRANSITION}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('WorkflowTransition')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-workflow-transition" class="input-id-workflow-transition" name="`$prefix`workflowlog_formdata_ID_WORKFLOW_TRANSITION" value=$details->ID_WORKFLOW_TRANSITION text=$details->reftext_ID_WORKFLOW_TRANSITION datasource="WORKFLOW_TRANSITION" datasourcename="WorkflowTransition" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.workflowtransition.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/new" title="Create a New Workflow Transition">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-workflow-transition input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_WORKFLOW_TRANSITION" value="<{$details->ID_WORKFLOW_TRANSITION|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WORKFLOW_TRANSITION}>
        <{if isset($smarty.session.acl.workflowtransition.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/workflowtransition/view/<{$details->refuuid_ID_WORKFLOW_TRANSITION}>"><{$details->reftext_ID_WORKFLOW_TRANSITION|escape}></a>
        <{else}>
            <{$details->reftext_ID_WORKFLOW_TRANSITION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WORKFLOW_TRANSITION}>
    <{/if}>
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
    	                            		        <label class="attribute-name"><{_t('Module')}></label>
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
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`workflowlog_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" datasourcename="AdminModule" valuecol="MODULE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['OBJECT_ID']) && ((isset($aclviewablecolumns['OBJECT_ID']) && $aclviewablecolumns['OBJECT_ID']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['OBJECT_ID']) || $aclviewablecolumns['OBJECT_ID']))) }>
        <{if !isset($columns2hide) || !in_array('OBJECT_ID', $columns2hide) }>
    		<td class="form-field form-field-label column-object-id">
	            		        <label class="attribute-name"><{_t('Object')}></label>
            </td>
            <td class="form-field form-field-value column-object-id" colspan="3">
            	<div class="attribute-line column-object-id type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['OBJECT_ID']) && $acleditablecolumns['OBJECT_ID']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['OBJECT_ID']) || $acleditablecolumns['OBJECT_ID'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->OBJECT_ID|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-object-id input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_OBJECT_ID" value="<{$details->OBJECT_ID|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->OBJECT_ID|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DATE']) && ((isset($aclviewablecolumns['DATE']) && $aclviewablecolumns['DATE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE']) || $aclviewablecolumns['DATE']))) }>
        <{if !isset($columns2hide) || !in_array('DATE', $columns2hide) }>
    		<td class="form-field form-field-label column-date">
	            		        <label class="attribute-name"><{_t('Date')}></label>
            </td>
            <td class="form-field form-field-value column-date" colspan="3">
            	<div class="attribute-line column-date type-date">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DATE']) && $acleditablecolumns['DATE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DATE']) || $acleditablecolumns['DATE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-date input-type-date field-date" type="text" id="<{$prefix}>workflowlog_formdata_DATE" name="<{$prefix}>workflowlog_formdata_DATE" value="<{$details->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->DATE|date_format:$smarty.const.SMARTY_DATE_FORMAT}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user">
	                    		        	                <{if isset($smarty.session.acl.user.view)}>
    	                    <{if $details->ID_USER}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="user" data-id="<{$details->refuuid_ID_USER}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('User')}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
            	<div class="attribute-line column-id-user type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER']) && $acleditablecolumns['ID_USER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER']) || $acleditablecolumns['ID_USER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`workflowlog_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" datasourcename="User" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME"}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DETAILS']) && ((isset($aclviewablecolumns['DETAILS']) && $aclviewablecolumns['DETAILS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DETAILS']) || $aclviewablecolumns['DETAILS']))) }>
        <{if !isset($columns2hide) || !in_array('DETAILS', $columns2hide) }>
    		<td class="form-field form-field-label column-details">
	            		        <label class="attribute-name"><{_t('Details')}></label>
            </td>
            <td class="form-field form-field-value column-details" colspan="3">
            	<div class="attribute-line column-details type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DETAILS']) && $acleditablecolumns['DETAILS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DETAILS']) || $acleditablecolumns['DETAILS'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->DETAILS|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-details input-type-text" type="text" name="<{$prefix}>workflowlog_formdata_DETAILS" value="<{$details->DETAILS|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->DETAILS|escape}>
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
    
    <{plugin key="workflowlog_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        workflowlogview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        workflowlogview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                workflowlogview_apply_block_visibility(key, value);
            });
        }

        workflowlogview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        workflowlogview_update_visibility_settings = function () {
            var settings = workflowlogview_get_visibility_settings();

            workflowlogview_apply_visibility_settings(settings);
        }

        $(function() {
            workflowlogview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/workflowlog/fieldSave",
//                        data: td.find(':input').serialize() + "&workflowlog_formdata_UUID=<{$details->UUID}>"
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