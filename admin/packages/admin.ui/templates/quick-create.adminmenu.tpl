<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Admin Menu')|ucwords}></h3>
</div>


<div id="adminmenu-edit" class="edit_details">

    <{if !isset($prefix) }>
        <{assign var='prefix' value=''}>
    <{/if}>

    <!-- Language bar -->
    
    
    <!-- Details -->
    <div class="section">
        <div>
                            <div class="edit-main edit_details">
    <{if $messages}>
        <ul class="message">
            <{foreach from=$messages key=field item=message}>
                <li data-error-field="<{$field}>"><{$message}></li>
            <{/foreach}>
        </ul>
    <{/if}>

    <form name="adminmenuform" id="adminmenuform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/adminmenu/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adminmenu_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="adminmenu_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="adminmenu_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="adminmenu_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="adminmenu_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-row form-row-name form-row-mandatory">
                <div class="form-field form-field-label">
        		    <label><{_t('Name')}><span class="mandatory">*</span></label>
                </div>
            </td>
            <td class="form-row form-row-name form-row-mandatory" colspan="3">
                <div class="form-field form-field-value column-name">
                                            

    <input class="input-name input-type-text" type="text" name="<{$prefix}>adminmenu_formdata_NAME" value="<{$details->NAME|escape}>"  />
                        <{if $columntooltips.NAME}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['ORDERING'])}>
    
        <{if $preset == 'ORDERING'}>
            <input type="hidden" class="input-ordering" name="adminmenu_formdata_ORDERING" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['ORDERING']) && !$acleditablecolumns['ORDERING'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['ORDERING'])}>
            <input type="hidden" class="input-ordering" name="adminmenu_formdata_ORDERING" value="<{$details->ORDERING}>" />
        <{else}>
    		<td class="form-row form-row-ordering">
                <div class="form-field form-field-label">
        		    <label><{_t('Ordering')}></label>
                </div>
            </td>
            <td class="form-row form-row-ordering" colspan="3">
                <div class="form-field form-field-value column-ordering">
                                            
        <input class="input-ordering input-type-number number-format" type="text" name="<{$prefix}>adminmenu_formdata_ORDERING" value="<{if $details->ORDERING != 0}><{$details->ORDERING}><{/if}>"  />
                        <{if $columntooltips.ORDERING}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.ORDERING}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                                                                            <tr>
    
            
        
        
        
        
<{if !isset($excludedcolumns['IS_ENABLED'])}>
    
        <{if $preset == 'IS_ENABLED'}>
            <input type="hidden" class="input-is-enabled" name="adminmenu_formdata_IS_ENABLED" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['IS_ENABLED']) && !$acleditablecolumns['IS_ENABLED'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['IS_ENABLED'])}>
            <input type="hidden" class="input-is-enabled" name="adminmenu_formdata_IS_ENABLED" value="<{$details->IS_ENABLED}>" />
        <{else}>
    		<td class="form-row form-row-is-enabled">
                <div class="form-field form-field-label">
        		    <label><{_t('Enabled?')}></label>
                </div>
            </td>
            <td class="form-row form-row-is-enabled" colspan="3">
                <div class="form-field form-field-value column-is-enabled">
                                            

    <span class="input-type-radio"><input class="input-is-enabled" type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="1" <{if $details->IS_ENABLED}>checked="checked"<{/if}>><{_t('Yes')}> <input type="radio" name="<{$prefix}>adminmenu_formdata_IS_ENABLED" value="0" <{if !$details->IS_ENABLED}>checked="checked"<{/if}> /><{_t('No')}></span>
                        <{if $columntooltips.IS_ENABLED}>
                            <i class="fa fa-info-circle" title="<{$columntooltips.IS_ENABLED}>"></i>
                        <{/if}>
                                    </div>
            </td>
    	<{/if}>
    <{/if}>    </tr>                                    </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
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
                                    <tr class="form-row form-row-<{$item->COLUMN_CODE}><{if $item->IS_REQUIRED}> form-row-mandatory<{/if}>">
                                		<td>
                                            <div class="form-field form-field-label">
                                    		    <label><{_t($item->NAME)}><{if $item->IS_REQUIRED}><span class="mandatory">*</span><{/if}></label>
                                            </div>
                                        </td>
                                        <td colspan="3">
                                            <div class="form-field form-field-value column-<{$item->COLUMN_CODE}>">
                                                <{include file="item.edit.tpl" customfield=$item id=$details->UUID value=CustomFieldHelper::getCustomFieldValue($details, $item->COLUMN)}>
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

        <{plugin key="adminmenu_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#adminmenuform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#adminmenuform :input').change(function() {
        $('#adminmenuform').data('changed', true);
    });

        function saveDraft() {
        if ($('#adminmenuform').length) {
            if ($('#adminmenuform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/adminmenu/savedraft/",
                    data: $('#adminmenuform').serialize()
                });

                $('#adminmenuform').data('changed', false);
            }
        }
    }

    $(function() {
        if (window.saveDraftTimer !== 'undefined' && window.saveDraftTimer != null) {
            window.clearInterval(window.saveDraftTimer);
        }

        window.saveDraftTimer = window.setInterval(saveDraft, <{$smarty.const.SAVE_DRAFT_INTERVAL}> * 1000);
    });
    </script>

<script type="text/javascript">
    $(function() {
        $('.message li').each(function(){
            var li = $(this);
            var field = li.data('error-field');
            var target = $('.input-' + field);

            target.closest('tr').addClass('form-row-with-error');

            li.css('cursor', 'pointer').click(function(){
                target.focus();
            });
        });
    });
</script>

<script type="text/javascript">
    ///////////////////////////////////////////////////////////////////////////////
    // VISIBILITY REFLECTION
    adminmenu_get_editing_model = function () {
        var model = {};

        var formdata = $('#adminmenuform').find('[name*=adminmenu_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('adminmenu_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    adminmenu_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    adminmenu_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            adminmenu_apply_block_visibility(key, value);
        });
    }

    adminmenu_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    adminmenu_update_visibility_settings = function () {
        var model = adminmenu_get_editing_model();

        var settings = adminmenu_get_visibility_settings(model);

        adminmenu_apply_visibility_settings(settings);
    }

    $(function() {
        $('#adminmenuform :input').change(function() {
            adminmenu_update_visibility_settings();
        });

        adminmenu_update_visibility_settings();
    });
</script>                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminmenuitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.dashboard) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="adminmenutabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminmenuitem) }>
                    <li><a href="#tab-adminmenuitems"><{_t('Admin menu item')}> <span class="badge adminmenuitem-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.dashboard) }>
                    <li><a href="#tab-dashboards"><{_t('Dashboard')}> <span class="badge dashboard-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminmenuitem) }>
                    <div id="tab-adminmenuitems">
                    	<{if true || $tab == 'adminmenuitems'}>
                        	<h2 class="print"><{_t('Admin menu item')}></h2>
                                                            <{ajaxmodule class="WidgetListAdminMenuItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.adminmenuitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.dashboard) }>
                    <div id="tab-dashboards">
                    	<{if true || $tab == 'dashboards'}>
                        	<h2 class="print"><{_t('Dashboard')}></h2>
                                                            <{ajaxmodule class="WidgetListDashboard" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_ADMIN_MENU="`$details->ID`" where=""  template='widgetlist.dashboard.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#adminmenutabs" ).tabs({
        		cookie: {
        			// store cookie for a day, without, it would be a session cookie
        			expires: 1
        		}
        	});
        });
        </script>
    <{/if}>

    
            <div class="modal-footer quickCreateActions">
            <a class="btn-cancel pull-right" type="reset" data-dismiss="modal"><{_t('Cancel')}></a>
            <button class="btn btn-success" type="submit" onclick="$('#pageform').submit()">
                <strong><{_t('Save')}></strong>
            </button>
                    </div>
    </div>

<script type="text/javascript">
    $(function() {
    	bind_hotkey('#adminmenuform', 'f2', 'a.button-save');
    	bind_hotkey('#adminmenuform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#adminmenuform', 'f3', 'a.button-save-more');
    	bind_hotkey('#adminmenuform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#adminmenuform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>