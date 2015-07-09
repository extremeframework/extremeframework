<div class="view-main">
    <{plugin key="usergroup_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['NAME']) && ((isset($aclviewablecolumns['NAME']) && $aclviewablecolumns['NAME']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['NAME']) || $aclviewablecolumns['NAME']))) }>
        <{if !isset($columns2hide) || !in_array('NAME', $columns2hide) }>
    		<td class="form-field form-field-label column-name">
	            		        <label class="attribute-name"><{_t('L_USER_GROUP_NAME')}></label>
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
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>usergroup_formdata_NAME" value="<{$details->NAME|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['DEFAULT_ID_DASHBOARD']) && ((isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) && $aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['DEFAULT_ID_DASHBOARD']) || $aclviewablecolumns['DEFAULT_ID_DASHBOARD']))) }>
        <{if !isset($columns2hide) || !in_array('DEFAULT_ID_DASHBOARD', $columns2hide) }>
    		<td class="form-field form-field-label column-default-id-dashboard">
	                    		        	                <{if isset($smarty.session.acl.dashboard.view)}>
    	                    <{if $details->DEFAULT_ID_DASHBOARD}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="dashboard" data-id="<{$details->refuuid_DEFAULT_ID_DASHBOARD}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('L_DEFAULT_DASHBOARD')}></label>
            </td>
            <td class="form-field form-field-value column-default-id-dashboard" colspan="3">
            	<div class="attribute-line column-default-id-dashboard type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['DEFAULT_ID_DASHBOARD']) && $acleditablecolumns['DEFAULT_ID_DASHBOARD']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['DEFAULT_ID_DASHBOARD']) || $acleditablecolumns['DEFAULT_ID_DASHBOARD'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_DEFAULT_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_DEFAULT_ID_DASHBOARD}>"><{$details->reftext_DEFAULT_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$details->reftext_DEFAULT_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
		<{$details->DEFAULT_ID_DASHBOARD}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-default-id-dashboard" class="input-default-id-dashboard" name="`$prefix`usergroup_formdata_DEFAULT_ID_DASHBOARD" value=$details->DEFAULT_ID_DASHBOARD text=$details->reftext_DEFAULT_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                </span>
                    <{else}>
            <input class="input-default-id-dashboard input-type-text" type="text" name="<{$prefix}>usergroup_formdata_DEFAULT_ID_DASHBOARD" value="<{$details->DEFAULT_ID_DASHBOARD|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_DEFAULT_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_DEFAULT_ID_DASHBOARD}>"><{$details->reftext_DEFAULT_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$details->reftext_DEFAULT_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
		<{$details->DEFAULT_ID_DASHBOARD}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['PARENT']) && ((isset($aclviewablecolumns['PARENT']) && $aclviewablecolumns['PARENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['PARENT']) || $aclviewablecolumns['PARENT']))) }>
        <{if !isset($columns2hide) || !in_array('PARENT', $columns2hide) }>
    		<td class="form-field form-field-label column-parent">
	                    		                    		        <label class="attribute-name"><{_t('L_PARENT')}></label>
            </td>
            <td class="form-field form-field-value column-parent" colspan="3">
            	<div class="attribute-line column-parent type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['PARENT']) && $acleditablecolumns['PARENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['PARENT']) || $acleditablecolumns['PARENT'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('UserGroup')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-parent" class="input-parent" name="`$prefix`usergroup_formdata_PARENT" value=$details->PARENT text=$details->reftext_PARENT datasource="USER_GROUP" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/new" title="Create a New User Group">+</a>
                </span>
                    <{else}>
            <input class="input-parent input-type-text" type="text" name="<{$prefix}>usergroup_formdata_PARENT" value="<{$details->PARENT|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_PARENT}>
        <{if isset($smarty.session.acl.usergroup.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/usergroup/view/<{$details->refuuid_PARENT}>"><{$details->reftext_PARENT|escape}></a>
        <{else}>
            <{$details->reftext_PARENT|escape}>        <{/if}>
    <{else}>
		<{$details->PARENT}>
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
                    <span><{_t('L_ADDITIONAL_INFORMATION')}></span>
                    <div class="header-arrow"></div>
                    <div class="clearer"></div>
                </div>
                <div class="layout-section-content">
                    <table class="table table-bordered table-custom-layout equal-split">
                        <tbody>
                            <{foreach from=$customfields item=item}>
                                <tr>
                            		<td class="form-field form-field-label column-<{$item->COLUMN_CODE}>">
                        		        <label class="attribute-name"><{_t($item->NAME)}></label>
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

    <{plugin key="usergroup_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        usergroupview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        usergroupview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                usergroupview_apply_block_visibility(key, value);
            });
        }

        usergroupview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        usergroupview_update_visibility_settings = function () {
            var settings = usergroupview_get_visibility_settings();

            usergroupview_apply_visibility_settings(settings);
        }

        $(function() {
            usergroupview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/usergroup/fieldSave",
//                        data: td.find(':input').serialize() + "&usergroup_formdata_UUID=<{$details->UUID}>"
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