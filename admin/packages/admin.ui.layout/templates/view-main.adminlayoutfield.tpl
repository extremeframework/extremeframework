<div class="view-main">
    <{plugin key="adminlayoutfield_view_top" args=$details}>

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
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-module" class="input-module" name="`$prefix`adminlayoutfield_formdata_MODULE" value=$details->MODULE text=$details->reftext_MODULE datasource="ADMIN_MODULE" valuecol="MODULE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminmodule.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminmodule/new" title="Create a New Admin Module">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-module input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_MODULE" value="<{$details->MODULE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_LAYOUT_SECTION']) && ((isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) && $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']) || $aclviewablecolumns['ID_ADMIN_LAYOUT_SECTION']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_LAYOUT_SECTION', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-layout-section">
	                    		        	                <{if isset($smarty.session.acl.adminlayoutsection.view)}>
    	                    <{if $details->ID_ADMIN_LAYOUT_SECTION}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="adminlayoutsection" data-id="<{$details->refuuid_ID_ADMIN_LAYOUT_SECTION}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Admin layout section')}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-layout-section" colspan="3">
            	<div class="attribute-line column-id-admin-layout-section type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_LAYOUT_SECTION']) && $acleditablecolumns['ID_ADMIN_LAYOUT_SECTION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_LAYOUT_SECTION']) || $acleditablecolumns['ID_ADMIN_LAYOUT_SECTION'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_ADMIN_LAYOUT_SECTION}>
        <{if isset($smarty.session.acl.adminlayoutsection.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$details->refuuid_ID_ADMIN_LAYOUT_SECTION}>"><{$details->reftext_ID_ADMIN_LAYOUT_SECTION|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LAYOUT_SECTION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LAYOUT_SECTION}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('AdminLayoutSection')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-admin-layout-section" class="input-id-admin-layout-section" name="`$prefix`adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value=$details->ID_ADMIN_LAYOUT_SECTION text=$details->reftext_ID_ADMIN_LAYOUT_SECTION datasource="ADMIN_LAYOUT_SECTION" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.adminlayoutsection.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/new" title="Create a New Admin Layout Section">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-admin-layout-section input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_ID_ADMIN_LAYOUT_SECTION" value="<{$details->ID_ADMIN_LAYOUT_SECTION|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_ADMIN_LAYOUT_SECTION}>
        <{if isset($smarty.session.acl.adminlayoutsection.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/adminlayoutsection/view/<{$details->refuuid_ID_ADMIN_LAYOUT_SECTION}>"><{$details->reftext_ID_ADMIN_LAYOUT_SECTION|escape}></a>
        <{else}>
            <{$details->reftext_ID_ADMIN_LAYOUT_SECTION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_ADMIN_LAYOUT_SECTION}>
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
	            		        <label class="attribute-name"><{_t('Column')}></label>
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
                                    

    <input class="input-column input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_COLUMN" value="<{$details->COLUMN|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['POSITION']) && ((isset($aclviewablecolumns['POSITION']) && $aclviewablecolumns['POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['POSITION']) || $aclviewablecolumns['POSITION']))) }>
        <{if !isset($columns2hide) || !in_array('POSITION', $columns2hide) }>
    		<td class="form-field form-field-label column-position">
	            		        <label class="attribute-name"><{_t('Position')}></label>
            </td>
            <td class="form-field form-field-value column-position" colspan="3">
            	<div class="attribute-line column-position type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['POSITION']) && $acleditablecolumns['POSITION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['POSITION']) || $acleditablecolumns['POSITION'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->POSITION|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-position input-type-text" type="text" name="<{$prefix}>adminlayoutfield_formdata_POSITION" value="<{$details->POSITION|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->POSITION|escape}>
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
    
    <{plugin key="adminlayoutfield_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        adminlayoutfieldview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        adminlayoutfieldview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                adminlayoutfieldview_apply_block_visibility(key, value);
            });
        }

        adminlayoutfieldview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        adminlayoutfieldview_update_visibility_settings = function () {
            var settings = adminlayoutfieldview_get_visibility_settings();

            adminlayoutfieldview_apply_visibility_settings(settings);
        }

        $(function() {
            adminlayoutfieldview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/adminlayoutfield/fieldSave",
//                        data: td.find(':input').serialize() + "&adminlayoutfield_formdata_UUID=<{$details->UUID}>"
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