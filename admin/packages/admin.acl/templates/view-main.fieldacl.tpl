<div class="view-main">
    <{plugin key="fieldacl_view_top" args=$details}>

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
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`fieldacl_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                </span>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ACTION']) && ((isset($aclviewablecolumns['ACTION']) && $aclviewablecolumns['ACTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ACTION']) || $aclviewablecolumns['ACTION']))) }>
        <{if !isset($columns2hide) || !in_array('ACTION', $columns2hide) }>
    		<td class="form-field form-field-label column-action">
	            		        <label class="attribute-name"><{label key="L_ACTION"}></label>
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
                                    

    <input class="input-action input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ACTION" value="<{$details->ACTION|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER_GROUP']) && ((isset($aclviewablecolumns['ID_USER_GROUP']) && $aclviewablecolumns['ID_USER_GROUP']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER_GROUP']) || $aclviewablecolumns['ID_USER_GROUP']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER_GROUP', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user-group">
	                    		                    		        <label class="attribute-name"><{label key="L_USER_GROUP"}></label>
            </td>
            <td class="form-field form-field-value column-id-user-group" colspan="3">
            	<div class="attribute-line column-id-user-group type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER_GROUP']) && $acleditablecolumns['ID_USER_GROUP']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER_GROUP']) || $acleditablecolumns['ID_USER_GROUP'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER_GROUP|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER_GROUP}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user-group" class="input-id-user-group" name="`$prefix`fieldacl_formdata_ID_USER_GROUP" value=$details->ID_USER_GROUP text=$details->reftext_ID_USER_GROUP datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                </span>
                    <{else}>
            <input class="input-id-user-group input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_USER_GROUP" value="<{$details->ID_USER_GROUP|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER_GROUP}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_ID_USER_GROUP}>"><{$details->reftext_ID_USER_GROUP|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_USER']) && ((isset($aclviewablecolumns['ID_USER']) && $aclviewablecolumns['ID_USER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_USER']) || $aclviewablecolumns['ID_USER']))) }>
        <{if !isset($columns2hide) || !in_array('ID_USER', $columns2hide) }>
    		<td class="form-field form-field-label column-id-user">
	                    		        	                <{if isset($smarty.session.acl.user.view)}>
    	                    <{if $details->ID_USER}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="user" data-id="<{$details->refuuid_ID_USER}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{label key="L_USER"}></label>
            </td>
            <td class="form-field form-field-value column-id-user" colspan="3">
            	<div class="attribute-line column-id-user type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_USER']) && $acleditablecolumns['ID_USER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_USER']) || $acleditablecolumns['ID_USER'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
        <{else}>
            <{$details->reftext_ID_USER|escape}>        <{/if}>
    <{else}>
		<{$details->ID_USER}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('User')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`fieldacl_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                </span>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_USER}>
        <{if isset($smarty.session.acl.user.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/view/<{$details->refuuid_ID_USER}>"><{$details->reftext_ID_USER|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['FIELDS']) && ((isset($aclviewablecolumns['FIELDS']) && $aclviewablecolumns['FIELDS']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['FIELDS']) || $aclviewablecolumns['FIELDS']))) }>
        <{if !isset($columns2hide) || !in_array('FIELDS', $columns2hide) }>
    		<td class="form-field form-field-label column-fields">
	            		        <label class="attribute-name"><{label key="L_FIELDS"}></label>
            </td>
            <td class="form-field form-field-value column-fields" colspan="3">
            	<div class="attribute-line column-fields type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['FIELDS']) && $acleditablecolumns['FIELDS']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['FIELDS']) || $acleditablecolumns['FIELDS'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->FIELDS|plugin:"fieldacl_view_field_FIELDS":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-fields enable-html" id="<{$prefix}>fieldacl_formdata_FIELDS_<{$tmpid}>" name="<{$prefix}>fieldacl_formdata_FIELDS" rows="5" ><{$details->FIELDS}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->FIELDS|plugin:"fieldacl_view_field_FIELDS":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ACL_TYPE']) && ((isset($aclviewablecolumns['ID_ACL_TYPE']) && $aclviewablecolumns['ID_ACL_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ACL_TYPE']) || $aclviewablecolumns['ID_ACL_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ACL_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-acl-type">
	                    		                    		        <label class="attribute-name"><{label key="L_ACL_TYPE"}></label>
            </td>
            <td class="form-field form-field-value column-id-acl-type" colspan="3">
            	<div class="attribute-line column-id-acl-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ACL_TYPE']) && $acleditablecolumns['ID_ACL_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ACL_TYPE']) || $acleditablecolumns['ID_ACL_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ACL_TYPE}>
        <{if isset($smarty.session.acl.acltype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/view/<{$details->refuuid_ID_ACL_TYPE}>"><{$details->reftext_ID_ACL_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ACL_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ACL_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AclType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-acl-type" class="input-id-acl-type" name="`$prefix`fieldacl_formdata_ID_ACL_TYPE" value=$details->ID_ACL_TYPE text=$details->reftext_ID_ACL_TYPE datasource="ACL_TYPE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/new" title="Create a New Acl Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-acl-type input-type-text" type="text" name="<{$prefix}>fieldacl_formdata_ID_ACL_TYPE" value="<{$details->ID_ACL_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ACL_TYPE}>
        <{if isset($smarty.session.acl.acltype.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/acltype/view/<{$details->refuuid_ID_ACL_TYPE}>"><{$details->reftext_ID_ACL_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_ACL_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ACL_TYPE}>
    <{/if}>
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

    <{plugin key="fieldacl_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        fieldaclview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        fieldaclview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                fieldaclview_apply_block_visibility(key, value);
            });
        }

        fieldaclview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        fieldaclview_update_visibility_settings = function () {
            var settings = fieldaclview_get_visibility_settings();

            fieldaclview_apply_visibility_settings(settings);
        }

        $(function() {
            fieldaclview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/fieldacl/fieldSave",
//                        data: td.find(':input').serialize() + "&fieldacl_formdata_UUID=<{$details->UUID}>"
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