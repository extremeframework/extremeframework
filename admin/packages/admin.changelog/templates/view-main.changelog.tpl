<div class="view-main">
    <{plugin key="changelog_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
        <{if !isset($columns2hide) || !in_array('ACTION', $columns2hide) }>
    		<td class="form-field form-field-label column-action">
	            		        <label class="attribute-name"><{_t('Action')}></label>
            </td>
            <td class="form-field form-field-value column-action" colspan="3">
            	<div class="attribute-line column-action type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ACTION']) && $acleditablecolumns['ACTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ACTION']) || $acleditablecolumns['ACTION'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ACTION|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-action input-type-text" type="text" name="<{$prefix}>changelog_formdata_ACTION" value="<{$details->ACTION|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ACTION|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ITEM']) && ((isset($aclviewablecolumns['ITEM']) && $aclviewablecolumns['ITEM']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ITEM']) || $aclviewablecolumns['ITEM']))) }>
        <{if !isset($columns2hide) || !in_array('ITEM', $columns2hide) }>
    		<td class="form-field form-field-label column-item">
	            		        <label class="attribute-name"><{_t('Item')}></label>
            </td>
            <td class="form-field form-field-value column-item" colspan="3">
            	<div class="attribute-line column-item type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ITEM']) && $acleditablecolumns['ITEM']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ITEM']) || $acleditablecolumns['ITEM'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ITEM|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-item input-type-text" type="text" name="<{$prefix}>changelog_formdata_ITEM" value="<{$details->ITEM|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ITEM|escape}>
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
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`changelog_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" datasourcename="AdminModule" valuecol="MODULE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>changelog_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['DATE_TIME']) && ((isset($aclviewablecolumns['DATE_TIME']) && $aclviewablecolumns['DATE_TIME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DATE_TIME']) || $aclviewablecolumns['DATE_TIME']))) }>
        <{if !isset($columns2hide) || !in_array('DATE_TIME', $columns2hide) }>
    		<td class="form-field form-field-label column-date-time">
	            		        <label class="attribute-name"><{_t('Date time')}></label>
            </td>
            <td class="form-field form-field-value column-date-time" colspan="3">
            	<div class="attribute-line column-date-time type-datetime">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DATE_TIME']) && $acleditablecolumns['DATE_TIME']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DATE_TIME']) || $acleditablecolumns['DATE_TIME'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->DATE_TIME|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <input class="input-date-time input-type-date field-date" type="text" id="<{$prefix}>changelog_formdata_DATE_TIME" name="<{$prefix}>changelog_formdata_DATE_TIME" value="<{$details->DATE_TIME|date_format:$smarty.const.SMARTY_DATE_FORMAT}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->DATE_TIME|escape}>
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
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`changelog_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" datasourcename="User" valuecol="ID" textcol="FIRST_NAME+LAST_NAME" sortcol="FIRST_NAME"}>

                            <{if isset($smarty.session.acl.user.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>changelog_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
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
                                    

    <input class="input-details input-type-text" type="text" name="<{$prefix}>changelog_formdata_DETAILS" value="<{$details->DETAILS|escape}>"  />
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
    
    <{plugin key="changelog_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        changelogview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        changelogview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                changelogview_apply_block_visibility(key, value);
            });
        }

        changelogview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        changelogview_update_visibility_settings = function () {
            var settings = changelogview_get_visibility_settings();

            changelogview_apply_visibility_settings(settings);
        }

        $(function() {
            changelogview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/changelog/fieldSave",
//                        data: td.find(':input').serialize() + "&changelog_formdata_UUID=<{$details->UUID}>"
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