<div class="view-main">
    <{plugin key="customaccessright_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
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
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`customaccessright_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME"}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>customaccessright_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_PERMISSION_SET']) && ((isset($aclviewablecolumns['ID_PERMISSION_SET']) && $aclviewablecolumns['ID_PERMISSION_SET']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PERMISSION_SET']) || $aclviewablecolumns['ID_PERMISSION_SET']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PERMISSION_SET', $columns2hide) }>
    		<td class="form-field form-field-label column-id-permission-set">
	                    		                    		        <label class="attribute-name"><{_t('Permission set')}></label>
            </td>
            <td class="form-field form-field-value column-id-permission-set" colspan="3">
            	<div class="attribute-line column-id-permission-set type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PERMISSION_SET']) && $acleditablecolumns['ID_PERMISSION_SET']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PERMISSION_SET']) || $acleditablecolumns['ID_PERMISSION_SET'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PERMISSION_SET}>
        <{if isset($smarty.session.acl.permissionset.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$details->refuuid_ID_PERMISSION_SET}>"><{$details->reftext_ID_PERMISSION_SET|escape}></a>
        <{else}>
            <{$details->reftext_ID_PERMISSION_SET|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PERMISSION_SET}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('PermissionSet')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-permission-set" class="input-id-permission-set" name="`$prefix`customaccessright_formdata_ID_PERMISSION_SET" value=$details->ID_PERMISSION_SET text=$details->reftext_ID_PERMISSION_SET datasource="PERMISSION_SET" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.permissionset.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/new" title="Create a New Permission Set">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-permission-set input-type-text" type="text" name="<{$prefix}>customaccessright_formdata_ID_PERMISSION_SET" value="<{$details->ID_PERMISSION_SET|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PERMISSION_SET}>
        <{if isset($smarty.session.acl.permissionset.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/permissionset/view/<{$details->refuuid_ID_PERMISSION_SET}>"><{$details->reftext_ID_PERMISSION_SET|escape}></a>
        <{else}>
            <{$details->reftext_ID_PERMISSION_SET|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PERMISSION_SET}>
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
                                    
    <input class="input-valid-from input-type-date field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_FROM" name="<{$prefix}>customaccessright_formdata_VALID_FROM" value="<{$details->VALID_FROM|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
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
                                    
    <input class="input-valid-until input-type-date field-date" type="text" id="<{$prefix}>customaccessright_formdata_VALID_UNTIL" name="<{$prefix}>customaccessright_formdata_VALID_UNTIL" value="<{$details->VALID_UNTIL|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
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

    <{plugin key="customaccessright_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        customaccessrightview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        customaccessrightview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                customaccessrightview_apply_block_visibility(key, value);
            });
        }

        customaccessrightview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        customaccessrightview_update_visibility_settings = function () {
            var settings = customaccessrightview_get_visibility_settings();

            customaccessrightview_apply_visibility_settings(settings);
        }

        $(function() {
            customaccessrightview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/customaccessright/fieldSave",
//                        data: td.find(':input').serialize() + "&customaccessright_formdata_UUID=<{$details->UUID}>"
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