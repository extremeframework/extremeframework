<div class="view-main">
    <{plugin key="pagewidget_view_top" args=$details}>

            <!-- Standard layout columns -->
        <table class="table table-bordered table-custom-layout equal-split">
            <tbody>
                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_PAGE']) && ((isset($aclviewablecolumns['ID_PAGE']) && $aclviewablecolumns['ID_PAGE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_PAGE']) || $aclviewablecolumns['ID_PAGE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_PAGE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-page">
	                    		        	                <{if isset($smarty.session.acl.page.view)}>
    	                    <{if $details->ID_PAGE}>
                                <i class="fa fa-caret-right row-expander view-row-expander" data-module="page" data-id="<{$details->refuuid_ID_PAGE}>"></i>
                            <{/if}>
                        <{/if}>
    	                            		        <label class="attribute-name"><{_t('Page')}></label>
            </td>
            <td class="form-field form-field-value column-id-page" colspan="3">
            	<div class="attribute-line column-id-page type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_PAGE']) && $acleditablecolumns['ID_PAGE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_PAGE']) || $acleditablecolumns['ID_PAGE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('Page')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-page" class="input-id-page" name="`$prefix`pagewidget_formdata_ID_PAGE" value=$details->ID_PAGE text=$details->reftext_ID_PAGE datasource="PAGE" valuecol="ID" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/new" title="Create a New Page">+</a>
                </span>
                    <{else}>
            <input class="input-id-page input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_PAGE" value="<{$details->ID_PAGE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_PAGE}>
        <{if isset($smarty.session.acl.page.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/page/view/<{$details->refuuid_ID_PAGE}>"><{$details->reftext_ID_PAGE|escape}></a>
        <{else}>
            <{$details->reftext_ID_PAGE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_PAGE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['TITLE']) && ((isset($aclviewablecolumns['TITLE']) && $aclviewablecolumns['TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['TITLE']) || $aclviewablecolumns['TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-title">
	            		        <label class="attribute-name"><{_t('Title')}></label>
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
                                    

    <input class="input-title input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_TITLE" value="<{$details->TITLE|escape}>"  />
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
    
            
        
        
            <{if !isset($excludedcolumns['CODE']) && ((isset($aclviewablecolumns['CODE']) && $aclviewablecolumns['CODE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CODE']) || $aclviewablecolumns['CODE']))) }>
        <{if !isset($columns2hide) || !in_array('CODE', $columns2hide) }>
    		<td class="form-field form-field-label column-code">
	            		        <label class="attribute-name"><{_t('Code')}></label>
            </td>
            <td class="form-field form-field-value column-code" colspan="3">
            	<div class="attribute-line column-code type-text">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CODE']) && $acleditablecolumns['CODE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CODE']) || $acleditablecolumns['CODE'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->CODE|escape}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-code input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_CODE" value="<{$details->CODE|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->CODE|escape}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['LINK']) && ((isset($aclviewablecolumns['LINK']) && $aclviewablecolumns['LINK']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['LINK']) || $aclviewablecolumns['LINK']))) }>
        <{if !isset($columns2hide) || !in_array('LINK', $columns2hide) }>
    		<td class="form-field form-field-label column-link">
	            		        <label class="attribute-name"><{_t('Link')}></label>
            </td>
            <td class="form-field form-field-value column-link" colspan="3">
            	<div class="attribute-line column-link type-url">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['LINK']) && $acleditablecolumns['LINK']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['LINK']) || $acleditablecolumns['LINK'])) }>
                    		    <span class="value-mode">
                                    
    <{$details->LINK|shorten_link:128}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <input class="input-link input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_LINK" value="<{$details->LINK|escape}>"  />
                                </span>
                                -->
                            <{else}>
                                
    <{$details->LINK|shorten_link:128}>
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
                                    

	<input class="input-image input-type-file" type="file" name="<{$prefix}>pagewidget_formdata_IMAGE" />
    <span class="input-sizes-width-height"><input type="text" name="IMAGE[width]" size="3" style="height:20px;width:25px;margin:0"> x <input type="text" name="IMAGE[height]" size="3" style="height:20px;width:25px;margin:0" /></span>
	<{if $details->IMAGE}><div style="clear:both"></div><span id="<{$prefix}>pagewidget_IMAGE"><{media src=$details->IMAGE}> <a onclick="remove_attachment(document.pagewidgetform.<{$prefix}>pagewidget_formdata_IMAGE, '<{$details->IMAGE}>', '<{$prefix}>pagewidget_IMAGE')">Remove</a></span><{/if}>
    <input type="hidden" name="<{$prefix}>pagewidget_formdata_IMAGE" value="<{$details->IMAGE}>" />
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
    
            
        
        
            <{if !isset($excludedcolumns['ID_WIDGET_TYPE']) && ((isset($aclviewablecolumns['ID_WIDGET_TYPE']) && $aclviewablecolumns['ID_WIDGET_TYPE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_TYPE']) || $aclviewablecolumns['ID_WIDGET_TYPE']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WIDGET_TYPE', $columns2hide) }>
    		<td class="form-field form-field-label column-id-widget-type">
	                    		                    		        <label class="attribute-name"><{_t('Widget type')}></label>
            </td>
            <td class="form-field form-field-value column-id-widget-type" colspan="3">
            	<div class="attribute-line column-id-widget-type type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WIDGET_TYPE']) && $acleditablecolumns['ID_WIDGET_TYPE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WIDGET_TYPE']) || $acleditablecolumns['ID_WIDGET_TYPE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WIDGET_TYPE}>
        <{if isset($smarty.session.acl.widgettype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/view/<{$details->refuuid_ID_WIDGET_TYPE}>"><{$details->reftext_ID_WIDGET_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_WIDGET_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WIDGET_TYPE}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('WidgetType')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-widget-type" class="input-id-widget-type" name="`$prefix`pagewidget_formdata_ID_WIDGET_TYPE" value=$details->ID_WIDGET_TYPE text=$details->reftext_ID_WIDGET_TYPE datasource="WIDGET_TYPE" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/new" title="Create a New Widget Type">+</a>
                </span>
                    <{else}>
            <input class="input-id-widget-type input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_WIDGET_TYPE" value="<{$details->ID_WIDGET_TYPE|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WIDGET_TYPE}>
        <{if isset($smarty.session.acl.widgettype.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgettype/view/<{$details->refuuid_ID_WIDGET_TYPE}>"><{$details->reftext_ID_WIDGET_TYPE|escape}></a>
        <{else}>
            <{$details->reftext_ID_WIDGET_TYPE|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WIDGET_TYPE}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['ID_WIDGET_POSITION']) && ((isset($aclviewablecolumns['ID_WIDGET_POSITION']) && $aclviewablecolumns['ID_WIDGET_POSITION']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['ID_WIDGET_POSITION']) || $aclviewablecolumns['ID_WIDGET_POSITION']))) }>
        <{if !isset($columns2hide) || !in_array('ID_WIDGET_POSITION', $columns2hide) }>
    		<td class="form-field form-field-label column-id-widget-position">
	                    		                    		        <label class="attribute-name"><{_t('Widget position')}></label>
            </td>
            <td class="form-field form-field-value column-id-widget-position" colspan="3">
            	<div class="attribute-line column-id-widget-position type-reftext">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['ID_WIDGET_POSITION']) && $acleditablecolumns['ID_WIDGET_POSITION']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['ID_WIDGET_POSITION']) || $acleditablecolumns['ID_WIDGET_POSITION'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->reftext_ID_WIDGET_POSITION}>
        <{if isset($smarty.session.acl.widgetposition.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/view/<{$details->refuuid_ID_WIDGET_POSITION}>"><{$details->reftext_ID_WIDGET_POSITION|escape}></a>
        <{else}>
            <{$details->reftext_ID_WIDGET_POSITION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WIDGET_POSITION}>
    <{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
            <{if Framework::hasModule('WidgetPosition')}>
            <{html_ref_select autocomplete="1" ajax="0" method="" id="input-id-widget-position" class="input-id-widget-position" name="`$prefix`pagewidget_formdata_ID_WIDGET_POSITION" value=$details->ID_WIDGET_POSITION text=$details->reftext_ID_WIDGET_POSITION datasource="WIDGET_POSITION" valuecol="CODE" textcol="NAME" sortcol=""}>

                            <span class="onflycreation">
                    <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/new" title="Create a New Widget Position">+</a>
                </span>
                    <{else}>
            <input class="input-id-widget-position input-type-text" type="text" name="<{$prefix}>pagewidget_formdata_ID_WIDGET_POSITION" value="<{$details->ID_WIDGET_POSITION|escape}>"  />
        <{/if}>
                                    </span>
                                -->
                            <{else}>
                                
    <{if $details->reftext_ID_WIDGET_POSITION}>
        <{if isset($smarty.session.acl.widgetposition.view)}>
            <a class="scope-main cachable" href="<{$smarty.const.APPLICATION_URL}>/widgetposition/view/<{$details->refuuid_ID_WIDGET_POSITION}>"><{$details->reftext_ID_WIDGET_POSITION|escape}></a>
        <{else}>
            <{$details->reftext_ID_WIDGET_POSITION|escape}>        <{/if}>
    <{else}>
		<{$details->ID_WIDGET_POSITION}>
    <{/if}>
                            <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['CONTENT']) && ((isset($aclviewablecolumns['CONTENT']) && $aclviewablecolumns['CONTENT']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['CONTENT']) || $aclviewablecolumns['CONTENT']))) }>
        <{if !isset($columns2hide) || !in_array('CONTENT', $columns2hide) }>
    		<td class="form-field form-field-label column-content">
	            		        <label class="attribute-name"><{_t('Content')}></label>
            </td>
            <td class="form-field form-field-value column-content" colspan="3">
            	<div class="attribute-line column-content type-textarea">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['CONTENT']) && $acleditablecolumns['CONTENT']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['CONTENT']) || $acleditablecolumns['CONTENT'])) }>
                    		    <span class="value-mode">
                                        
        <{$details->CONTENT|plugin:"pagewidget_view_field_CONTENT":$details}>
                                    </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    
    <{$tmpid = uniqid()}>

    <textarea class="input-content enable-html" id="<{$prefix}>pagewidget_formdata_CONTENT_<{$tmpid}>" name="<{$prefix}>pagewidget_formdata_CONTENT" rows="5" ><{$details->CONTENT}></textarea>
                                </span>
                                -->
                            <{else}>
                                    
        <{$details->CONTENT|plugin:"pagewidget_view_field_CONTENT":$details}>
                                <{/if}>
                                    		</div>
            	</div>
            </td>
    	<{/if}>
	<{/if}>
    </tr>                                                        <tr>
    
            
        
        
            <{if !isset($excludedcolumns['HIDE_TITLE']) && ((isset($aclviewablecolumns['HIDE_TITLE']) && $aclviewablecolumns['HIDE_TITLE']) || (isset($aclviewablecolumns['*']) && (!isset($aclviewablecolumns['HIDE_TITLE']) || $aclviewablecolumns['HIDE_TITLE']))) }>
        <{if !isset($columns2hide) || !in_array('HIDE_TITLE', $columns2hide) }>
    		<td class="form-field form-field-label column-hide-title">
	            		        <label class="attribute-name"><{_t('Hide title')}></label>
            </td>
            <td class="form-field form-field-value column-hide-title" colspan="3">
            	<div class="attribute-line column-hide-title type-yesno">
            		<div class="attribute-value">
            		                		        <{if (isset($acleditablecolumns['HIDE_TITLE']) && $acleditablecolumns['HIDE_TITLE']) || (isset($acleditablecolumns['*']) && (!isset($acleditablecolumns['HIDE_TITLE']) || $acleditablecolumns['HIDE_TITLE'])) }>
                    		    <span class="value-mode">
                                    
    <{if $details->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
                                </span>
                                <!--
                    		    <span class="edit-mode" style="display:none">
                                    

    <span class="input-type-radio"><input class="input-hide-title" type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="1" <{if $details->HIDE_TITLE}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>pagewidget_formdata_HIDE_TITLE" value="0" <{if !$details->HIDE_TITLE}>checked="checked"<{/if}> /><{_t('No')}></span>
                                </span>
                                -->
                            <{else}>
                                
    <{if $details->HIDE_TITLE}><{_t('Yes')}><{else}><{_t('No')}><{/if}>
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

    <{plugin key="pagewidget_view_bottom" args=$details}>

    <script type="text/javascript">
        ///////////////////////////////////////////////////////////////////////////////
        // VISIBILITY REFLECTION
        pagewidgetview_get_visibility_settings = function (model) {
            var settings = {};

            
            return settings;
        }

        pagewidgetview_apply_visibility_settings = function (settings) {
            $.each(settings, function(key, value) {
                pagewidgetview_apply_block_visibility(key, value);
            });
        }

        pagewidgetview_apply_block_visibility = function (key, value) {
            var block = $('.column-' + key.replace(/_/g, '-').toLowerCase());

            if (value) {
                block.show('slow');
            } else {
                block.hide('slow');
            }
        }

        pagewidgetview_update_visibility_settings = function () {
            var settings = pagewidgetview_get_visibility_settings();

            pagewidgetview_apply_visibility_settings(settings);
        }

        $(function() {
            pagewidgetview_update_visibility_settings();
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
//                        url: "<{$smarty.const.APPLICATION_URL}>/pagewidget/fieldSave",
//                        data: td.find(':input').serialize() + "&pagewidget_formdata_UUID=<{$details->UUID}>"
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