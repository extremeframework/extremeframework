<div class="view-main">
    <{plugin key="userinvitation_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['INVITEE_NAME']) && ((isset($aclviewablecolumns['INVITEE_NAME']) && $aclviewablecolumns['INVITEE_NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_NAME']) || $aclviewablecolumns['INVITEE_NAME']))) }>
        <{if !isset($columns2hide) || !in_array('INVITEE_NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-invitee-name">
	            		        <label class="attribute-name"><{_t('Invitee name')}></label>
            </td>
            <td class="form-field form-field-value column-invitee-name" colspan="3">
            	<div class="attribute-line column-invitee-name type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['INVITEE_NAME']) && $acleditablecolumns['INVITEE_NAME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['INVITEE_NAME']) || $acleditablecolumns['INVITEE_NAME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->INVITEE_NAME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-invitee-name input-type-text" type="text" name="<{$prefix}>userinvitation_formdata_INVITEE_NAME" value="<{$details->INVITEE_NAME|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->INVITEE_NAME|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['INVITEE_EMAIL']) && ((isset($aclviewablecolumns['INVITEE_EMAIL']) && $aclviewablecolumns['INVITEE_EMAIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['INVITEE_EMAIL']) || $aclviewablecolumns['INVITEE_EMAIL']))) }>
        <{if !isset($columns2hide) || !in_array('INVITEE_EMAIL', $columns2hide) }>
    		<td class="form-field form-field-label column-invitee-email">
	            		        <label class="attribute-name"><{_t('Invitee email')}></label>
            </td>
            <td class="form-field form-field-value column-invitee-email" colspan="3">
            	<div class="attribute-line column-invitee-email type-email">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['INVITEE_EMAIL']) && $acleditablecolumns['INVITEE_EMAIL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['INVITEE_EMAIL']) || $acleditablecolumns['INVITEE_EMAIL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->INVITEE_EMAIL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-invitee-email input-type-text" type="text" name="<{$prefix}>userinvitation_formdata_INVITEE_EMAIL" value="<{$details->INVITEE_EMAIL|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->INVITEE_EMAIL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-group">
	                    		                    		        <label class="attribute-name"><{_t('User group')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
            	<div class="attribute-line column-id-user-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER_GROUP']) && $acleditablecolumns['ID_USER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER_GROUP']) || $acleditablecolumns['ID_USER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`userinvitation_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.usergroup.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>userinvitation_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_GROUP}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_ROLE']) && ((isset($aclviewablecolumns['ID_USER_ROLE']) && $aclviewablecolumns['ID_USER_ROLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_ROLE']) || $aclviewablecolumns['ID_USER_ROLE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_ROLE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-role">
	                    		                    		        <label class="attribute-name"><{_t('User role')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-role" colspan="3">
            	<div class="attribute-line column-id-user-role type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER_ROLE']) && $acleditablecolumns['ID_USER_ROLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER_ROLE']) || $acleditablecolumns['ID_USER_ROLE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER_ROLE}>
        <{if isset($smarty.session.acl.userrole.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->refuuid_ID_USER_ROLE}>"><{$details->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_ROLE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserRole')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user-role" class="input-id-user-role" name="`$prefix`userinvitation_formdata_ID_USER_ROLE" value=$details->ID_USER_ROLE text=$details->reftext_ID_USER_ROLE datasource="USER_ROLE" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.userrole.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/new" title="Create a New User Role">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user-role input-type-text" type="text" name="<{$prefix}>userinvitation_formdata_ID_USER_ROLE" value="<{$details->ID_USER_ROLE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER_ROLE}>
        <{if isset($smarty.session.acl.userrole.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userrole/view/<{$details->refuuid_ID_USER_ROLE}>"><{$details->reftext_ID_USER_ROLE|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_ROLE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_ROLE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VALID_FROM']) && ((isset($aclviewablecolumns['VALID_FROM']) && $aclviewablecolumns['VALID_FROM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_FROM']) || $aclviewablecolumns['VALID_FROM']))) }>
        <{if !isset($columns2hide) || !in_array('VALID_FROM', $columns2hide) }>
    		<td class="form-field form-field-label column-valid-from">
	            		        <label class="attribute-name"><{_t('Valid from')}></label>
            </td>
            <td class="form-field form-field-value column-valid-from" colspan="3">
            	<div class="attribute-line column-valid-from type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VALID_FROM']) && $acleditablecolumns['VALID_FROM']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VALID_FROM']) || $acleditablecolumns['VALID_FROM'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VALID_FROM|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-valid-from input-type-date field-date" type="text" id="<{$prefix}>userinvitation_formdata_VALID_FROM" name="<{$prefix}>userinvitation_formdata_VALID_FROM" value="<{$details->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VALID_FROM|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['VALID_UNTIL']) && ((isset($aclviewablecolumns['VALID_UNTIL']) && $aclviewablecolumns['VALID_UNTIL']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['VALID_UNTIL']) || $aclviewablecolumns['VALID_UNTIL']))) }>
        <{if !isset($columns2hide) || !in_array('VALID_UNTIL', $columns2hide) }>
    		<td class="form-field form-field-label column-valid-until">
	            		        <label class="attribute-name"><{_t('Valid until')}></label>
            </td>
            <td class="form-field form-field-value column-valid-until" colspan="3">
            	<div class="attribute-line column-valid-until type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['VALID_UNTIL']) && $acleditablecolumns['VALID_UNTIL']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['VALID_UNTIL']) || $acleditablecolumns['VALID_UNTIL'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->VALID_UNTIL|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-valid-until input-type-date field-date" type="text" id="<{$prefix}>userinvitation_formdata_VALID_UNTIL" name="<{$prefix}>userinvitation_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->VALID_UNTIL|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_INVITATION_STATUS']) && ((isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) && $aclviewablecolumns['ID_USER_INVITATION_STATUS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_INVITATION_STATUS']) || $aclviewablecolumns['ID_USER_INVITATION_STATUS']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_INVITATION_STATUS', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-invitation-status">
	                    		                    		        <label class="attribute-name"><{_t('User invitation status')}></label>
            </td>
            <td class="form-field form-field-value column-id-user-invitation-status" colspan="3">
            	<div class="attribute-line column-id-user-invitation-status type-reftext">
            		<div class="attribute-value">
            		                                
    <{if $details->reftext_ID_USER_INVITATION_STATUS}>
        <{if isset($smarty.session.acl.userinvitationstatus.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/userinvitationstatus/view/<{$details->refuuid_ID_USER_INVITATION_STATUS}>"><{$details->reftext_ID_USER_INVITATION_STATUS|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_INVITATION_STATUS|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_INVITATION_STATUS}>
    <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DATE_SENT']) && ((isset($aclviewablecolumns['DATE_SENT']) && $aclviewablecolumns['DATE_SENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_SENT']) || $aclviewablecolumns['DATE_SENT']))) }>
        <{if !isset($columns2hide) || !in_array('DATE_SENT', $columns2hide) }>
    		<td class="form-field form-field-label column-date-sent">
	            		        <label class="attribute-name"><{_t('Date sent')}></label>
            </td>
            <td class="form-field form-field-value column-date-sent" colspan="3">
            	<div class="attribute-line column-date-sent type-datetime">
            		<div class="attribute-value">
            		                                
    <{$details->DATE_SENT|escape}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['DATE_ACCEPTED']) && ((isset($aclviewablecolumns['DATE_ACCEPTED']) && $aclviewablecolumns['DATE_ACCEPTED']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_ACCEPTED']) || $aclviewablecolumns['DATE_ACCEPTED']))) }>
        <{if !isset($columns2hide) || !in_array('DATE_ACCEPTED', $columns2hide) }>
    		<td class="form-field form-field-label column-date-accepted">
	            		        <label class="attribute-name"><{_t('Date accepted')}></label>
            </td>
            <td class="form-field form-field-value column-date-accepted" colspan="3">
            	<div class="attribute-line column-date-accepted type-datetime">
            		<div class="attribute-value">
            		                                
    <{$details->DATE_ACCEPTED|escape}>
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

    <{plugin key="userinvitation_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        userinvitationview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        userinvitationview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                userinvitationview_apply_block_visibility(key, value);
            });
        }

        userinvitationview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        userinvitationview_update_visibility_settings = function () {
            var settings = userinvitationview_get_visibility_settings();

            userinvitationview_apply_visibility_settings(settings);
        }

        $(function() {
            userinvitationview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/userinvitation/fieldSave",
//                        data: td.find(':input').serialize() + "&userinvitation_formdata_UUID=<{$details->UUID}>"
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