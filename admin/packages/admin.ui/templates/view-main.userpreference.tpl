<div class="view-main">
    <{plugin key="userpreference_view_top" args=$details}>

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
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-user" class="input-id-user" name="`$prefix`userpreference_formdata_ID_USER" value=$details->ID_USER text=$details->reftext_ID_USER datasource="USER" valuecol="ID" textcol="FIRST_NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/user/new" title="Create a New User">+</a>
                </span>
                    <{else}>
            <input class="input-id-user input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_USER" value="<{$details->ID_USER|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_DASHBOARD']) && ((isset($aclviewablecolumns['ID_DASHBOARD']) && $aclviewablecolumns['ID_DASHBOARD']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_DASHBOARD']) || $aclviewablecolumns['ID_DASHBOARD']))) }>
        <{if !isset($columns2hide) || !in_array('ID_DASHBOARD', $columns2hide) }>
    		<td class="form-field form-field-label column-id-dashboard">
	                    		        	                <{if isset($smarty.session.acl.dashboard.view)}>
    	                    <{if $details->ID_DASHBOARD}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="dashboard" data-id="<{$details->refuuid_ID_DASHBOARD}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{label key="L_DASHBOARD"}></label>
            </td>
            <td class="form-field form-field-value column-id-dashboard" colspan="3">
            	<div class="attribute-line column-id-dashboard type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_DASHBOARD']) && $acleditablecolumns['ID_DASHBOARD']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_DASHBOARD']) || $acleditablecolumns['ID_DASHBOARD'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_ID_DASHBOARD}>"><{$details->reftext_ID_DASHBOARD|escape}></a>
        <{else}>
            <{$details->reftext_ID_DASHBOARD|escape}>        <{/if}>
    <{else}>
		<{$details->ID_DASHBOARD}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Dashboard')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-dashboard" class="input-id-dashboard" name="`$prefix`userpreference_formdata_ID_DASHBOARD" value=$details->ID_DASHBOARD text=$details->reftext_ID_DASHBOARD datasource="DASHBOARD" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/new" title="Create a New Dashboard">+</a>
                </span>
                    <{else}>
            <input class="input-id-dashboard input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_DASHBOARD" value="<{$details->ID_DASHBOARD|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_DASHBOARD}>
        <{if isset($smarty.session.acl.dashboard.view)}>
            <a class="scope-main" href="<{$smarty.const.APPLICATION_URL}>/dashboard/view/<{$details->refuuid_ID_DASHBOARD}>"><{$details->reftext_ID_DASHBOARD|escape}></a>
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_WALLPAPER']) && ((isset($aclviewablecolumns['ID_WALLPAPER']) && $aclviewablecolumns['ID_WALLPAPER']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WALLPAPER']) || $aclviewablecolumns['ID_WALLPAPER']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WALLPAPER', $columns2hide) }>
    		<td class="form-field form-field-label column-id-wallpaper">
	            		        <label class="attribute-name"><{label key="L_WALLPAPER"}></label>
            </td>
            <td class="form-field form-field-value column-id-wallpaper" colspan="3">
            	<div class="attribute-line column-id-wallpaper type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WALLPAPER']) && $acleditablecolumns['ID_WALLPAPER']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WALLPAPER']) || $acleditablecolumns['ID_WALLPAPER'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ID_WALLPAPER|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-id-wallpaper input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_WALLPAPER" value="<{$details->ID_WALLPAPER|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ID_WALLPAPER|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_ADMIN_STYLE']) && ((isset($aclviewablecolumns['ID_ADMIN_STYLE']) && $aclviewablecolumns['ID_ADMIN_STYLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_ADMIN_STYLE']) || $aclviewablecolumns['ID_ADMIN_STYLE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_ADMIN_STYLE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-admin-style">
	            		        <label class="attribute-name"><{label key="L_ADMIN_STYLE"}></label>
            </td>
            <td class="form-field form-field-value column-id-admin-style" colspan="3">
            	<div class="attribute-line column-id-admin-style type-key">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_ADMIN_STYLE']) && $acleditablecolumns['ID_ADMIN_STYLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_ADMIN_STYLE']) || $acleditablecolumns['ID_ADMIN_STYLE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->ID_ADMIN_STYLE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-id-admin-style input-type-text" type="text" name="<{$prefix}>userpreference_formdata_ID_ADMIN_STYLE" value="<{$details->ID_ADMIN_STYLE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->ID_ADMIN_STYLE|escape}>
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

    <{plugin key="userpreference_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        userpreferenceview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        userpreferenceview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                userpreferenceview_apply_block_visibility(key, value);
            });
        }

        userpreferenceview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        userpreferenceview_update_visibility_settings = function () {
            var settings = userpreferenceview_get_visibility_settings();

            userpreferenceview_apply_visibility_settings(settings);
        }

        $(function() {
            userpreferenceview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/userpreference/fieldSave",
//                        data: td.find(':input').serialize() + "&userpreference_formdata_UUID=<{$details->UUID}>"
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