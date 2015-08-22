<div class="view-main">
    <{plugin key="dashboarditem_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Dashboard item title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
        <{if !isset($columns2hide) || !in_array('ID_DASHBOARD', $columns2hide) }>
    		<td class="form-field form-field-label column-id-dashboard">
	                    		        	                <{if isset($smarty.session.acl.dashboard.view)}>
    	                    <{if $details->ID_DASHBOARD}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="dashboard" data-id="<{$details->refuuid_ID_DASHBOARD}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Dashboard')}></label>
            </td>
            <td class="form-field form-field-value column-id-dashboard" colspan="3">
            	<div class="attribute-line column-id-dashboard type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_DASHBOARD']) && $acleditablecolumns['ID_DASHBOARD']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_DASHBOARD']) || $acleditablecolumns['ID_DASHBOARD'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_ID_DASHBOARD}>"><{$details->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$details->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
		<{$details->ID_DASHBOARD}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select multilingual="0" autocomplete="1" ajax="0" method="" id="input-id-dashboard" class="input-id-dashboard" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD" value=$details->ID_DASHBOARD text=$details->reftext_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.dashboard.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-dashboard input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_ID_DASHBOARD}>"><{$details->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$details->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
		<{$details->ID_DASHBOARD}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['IMAGE']) && ((isset($aclviewablecolumns['IMAGE']) && $aclviewablecolumns['IMAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['IMAGE']) || $aclviewablecolumns['IMAGE']))) }>
        <{if !isset($columns2hide) || !in_array('IMAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-image">
	            		        <label class="attribute-name"><{_t('Image')}></label>
            </td>
            <td class="form-field form-field-value column-image" colspan="3">
            	<div class="attribute-line column-image type-image">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['IMAGE']) && $acleditablecolumns['IMAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['IMAGE']) || $acleditablecolumns['IMAGE'])) }>
                    		    <span class="value-mode">
                                    
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>dashboarditem_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>dashboarditem_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.dashboarditemform.<{$prefix}>dashboarditem_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>dashboarditem_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>dashboarditem_formdata_IMAGE" value="<{$details->IMAGE}>" />
                                </span>
                                -->
                            <{else}>
                                
	<{media src=$details->IMAGE thumbnail=1 width=200 height=200}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PATH']) && ((isset($aclviewablecolumns['PATH']) && $aclviewablecolumns['PATH']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PATH']) || $aclviewablecolumns['PATH']))) }>
        <{if !isset($columns2hide) || !in_array('PATH', $columns2hide) }>
    		<td class="form-field form-field-label column-path">
	            		        <label class="attribute-name"><{_t('Path')}></label>
            </td>
            <td class="form-field form-field-value column-path" colspan="3">
            	<div class="attribute-line column-path type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PATH']) && $acleditablecolumns['PATH']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PATH']) || $acleditablecolumns['PATH'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->PATH|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-path input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_PATH" value="<{$details->PATH|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->PATH|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_DASHBOARD_ITEM_TYPE']) && ((isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) && $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']) || $aclviewablecolumns['ID_DASHBOARD_ITEM_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_DASHBOARD_ITEM_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-dashboard-item-type">
	                    		                    		        <label class="attribute-name"><{_t('Dashboard item type')}></label>
            </td>
            <td class="form-field form-field-value column-id-dashboard-item-type" colspan="3">
            	<div class="attribute-line column-id-dashboard-item-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_DASHBOARD_ITEM_TYPE']) && $acleditablecolumns['ID_DASHBOARD_ITEM_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_DASHBOARD_ITEM_TYPE']) || $acleditablecolumns['ID_DASHBOARD_ITEM_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_DASHBOARD_ITEM_TYPE}>
        <{if isset($smarty.session.acl.dashboarditemtype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$details->refuuid_ID_DASHBOARD_ITEM_TYPE}>"><{$details->reftext_ID_DASHBOARD_ITEM_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_DASHBOARD_ITEM_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_DASHBOARD_ITEM_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('DashboardItemType')}>
            <{html_ref_select multilingual="1" autocomplete="1" ajax="0" method="" id="input-id-dashboard-item-type" class="input-id-dashboard-item-type" name="`$prefix`dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value=$details->ID_DASHBOARD_ITEM_TYPE text=$details->reftext_ID_DASHBOARD_ITEM_TYPE datasource="DASHBOARD_ITEM_TYPE" valuecol="CODE" textcol="NAME" sortcol="NAME"}>

                            <{if isset($smarty.session.acl.dashboarditemtype.new)}>
                    <span class="onflycreation">
                        <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/new" title="Create a New Dashboard Item Type">+</a>
                    </span>
                <{/if}>
                    <{else}>
            <input class="input-id-dashboard-item-type input-type-text" type="text" name="<{$prefix}>dashboarditem_formdata_ID_DASHBOARD_ITEM_TYPE" value="<{$details->ID_DASHBOARD_ITEM_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_DASHBOARD_ITEM_TYPE}>
        <{if isset($smarty.session.acl.dashboarditemtype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/dashboarditemtype/view/<{$details->refuuid_ID_DASHBOARD_ITEM_TYPE}>"><{$details->reftext_ID_DASHBOARD_ITEM_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_DASHBOARD_ITEM_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_DASHBOARD_ITEM_TYPE}>
    <{/if}>
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
    
    <{plugin key="dashboarditem_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        dashboarditemview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        dashboarditemview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                dashboarditemview_apply_block_visibility(key, value);
            });
        }

        dashboarditemview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        dashboarditemview_update_visibility_settings = function () {
            var settings = dashboarditemview_get_visibility_settings();

            dashboarditemview_apply_visibility_settings(settings);
        }

        $(function() {
            dashboarditemview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/dashboarditem/fieldSave",
//                        data: td.find(':input').serialize() + "&dashboarditem_formdata_UUID=<{$details->UUID}>"
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