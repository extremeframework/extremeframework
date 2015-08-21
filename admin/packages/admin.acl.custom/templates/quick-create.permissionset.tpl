<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="<{_t('Close', true)}>">x</button>
    <h3><{_t('Quick create')|ucwords}> <{_t('Permission Set')|ucwords}></h3>
</div>


<div id="permissionset-edit" class="edit_details">

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

    <form name="permissionsetform" id="permissionsetform" class="form-edit scope-main" action="<{$smarty.const.APPLICATION_URL}>/permissionset/save/?back=1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="permissionset_formdata_UUID" value="<{$details->UUID}>" />
        <input type="hidden" name="view-type" value="quick-create" />
        <{if isset($preset)}><input type="hidden" name="preset" value="<{$preset}>" /><{/if}>
        <{if isset($presetvalue)}><input type="hidden" name="presetvalue" value="<{$presetvalue}>" /><{/if}>
        <{if isset($presetparams)}>
            <{foreach from=$presetparams key=key item=value}>
                <input type="hidden" name="preset_<{$key}>" value="<{$value}>" />
                <input type="hidden" name="permissionset_formdata_<{$key}>" value="<{$value}>" />
            <{/foreach}>
        <{/if}>

        <{plugin key="permissionset_form_top" args=$details}>

                    <!-- Standard layout rows -->
            <table class="table table-bordered table-custom-layout equal-split">
                <tbody>
                                                                                            
<tr class="form-row form-row-name form-row-mandatory">
            
        
        
        
        <{if !isset($excludedcolumns['NAME'])}>
    
        <{if $preset == 'NAME'}>
            <input type="hidden" class="input-name" name="permissionset_formdata_NAME" value="<{$presetvalue}>" />
        <{elseif isset($acleditablecolumns['NAME']) && !$acleditablecolumns['NAME'] || !isset($acleditablecolumns['*']) && !isset($acleditablecolumns['NAME'])}>
            <input type="hidden" class="input-name" name="permissionset_formdata_NAME" value="<{$details->NAME}>" />
        <{else}>
    		<td class="form-field form-field-label">
    		    <label><{_t('Permission set name')}><span class="mandatory">*</span></label>
            </td>
            <td class="form-field form-field-value column-name" colspan="3">
                                    

    <input class="input-name input-type-text" type="text" name="<{$prefix}>permissionset_formdata_NAME" value="<{$details->NAME|escape}>"  />
                    <{if $columntooltips.NAME}>
                        <i class="fa fa-info-circle" title="<{$columntooltips.NAME}>"></i>
                    <{/if}>
                            </td>
    	<{/if}>
    <{/if}>    </tr>                    
                    <!-- Custom fields -->
                    <{if $customfields}>
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
                    <{if $item->TOOLTIP}>
                        <i class="fa fa-info-circle" title="<{$item->TOOLTIP}>"></i>
                    <{/if}>
                </div>
            </td>
		</tr>
	<{/foreach}>
<{/if}>                </tbody>
            </table>
        	<!-- Standard layout rows end -->
        
        <{plugin key="permissionset_form_bottom" args=$details}>
    </form>
</div>



<script type="text/javascript">
    $(function() {
        if (document.activeElement == document.body) {
        	$('#permissionsetform:not(.filter) :input:visible:first').focus();
        }
    });
</script>

<script type="text/javascript">
    $('#permissionsetform :input').change(function() {
        $('#permissionsetform').data('changed', true);
    });

        function saveDraft() {
        if ($('#permissionsetform').length) {
            if ($('#permissionsetform').data('changed')) {
                $.ajax({
                    type: "post",
                    url: "<{$smarty.const.APPLICATION_URL}>/permissionset/savedraft/",
                    data: $('#permissionsetform').serialize()
                });

                $('#permissionsetform').data('changed', false);
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
    permissionset_get_editing_model = function () {
        var model = {};

        var formdata = $('#permissionsetform').find('[name*=permissionset_formdata]').serializeArray();

        jQuery.map(formdata, function(x) {
            x.name = x.name.replace('permissionset_formdata_', '');

            model[x.name] = x.value;

            return x;
        });

        return model;
    }

    permissionset_get_visibility_settings = function (model) {
        var settings = {};

        // Rules based on dependency settings
        <{foreach from=$fielddependencies item=item}>
            <{foreach from=$item->DEPENDENCY_COLUMNS item=column}>
                settings['<{$column}>'] = in_array(model['<{$item->SOURCE_COLUMN}>'], ['<{implode("', '", $item->SOURCE_VALUES)}>']);
            <{/foreach}>
        <{/foreach}>

        return settings;
    }

    permissionset_apply_visibility_settings = function (settings) {
        $.each(settings, function(key, value) {
            permissionset_apply_block_visibility(key, value);
        });
    }

    permissionset_apply_block_visibility = function (key, value) {
        var block = $('.form-row-' + key.toLowerCase().replace(/_/g, '-'));

        if (value) {
            block.show();
        } else {
            block.hide();
        }
    }

    permissionset_update_visibility_settings = function () {
        var model = permissionset_get_editing_model();

        var settings = permissionset_get_visibility_settings(model);

        permissionset_apply_visibility_settings(settings);
    }

    $(function() {
        $('#permissionsetform :input').change(function() {
            permissionset_update_visibility_settings();
        });

        permissionset_update_visibility_settings();
    });
</script>                    </div>
    </div>

        <{assign var='canaccess2anytab' value='0'}>
            <{if isset($smarty.session.acl.adminpackagepermission) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.customaccessright) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
            <{if isset($smarty.session.acl.permissionsetitem) }>
            <{assign var='canaccess2anytab' value='1'}>
        <{/if}>
    
    <{if $canaccess2anytab}>
        <div id="permissionsettabs" class="section">
            <ul>
                                <{if isset($smarty.session.acl.adminpackagepermission) }>
                    <li><a href="#tab-adminpackagepermissions"><{_t('Admin package permission')}> <span class="badge adminpackagepermission-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.customaccessright) }>
                    <li><a href="#tab-customaccessrights"><{_t('Custom access right')}> <span class="badge customaccessright-badge-count"></span></a></li>
                <{/if}>
                                <{if isset($smarty.session.acl.permissionsetitem) }>
                    <li><a href="#tab-permissionsetitems"><{_t('Permission set item')}> <span class="badge permissionsetitem-badge-count"></span></a></li>
                <{/if}>
                            </ul>

                            <{if isset($smarty.session.acl.adminpackagepermission) }>
                    <div id="tab-adminpackagepermissions">
                    	<{if true || $tab == 'adminpackagepermissions'}>
                        	<h2 class="print"><{_t('Admin package permission')}></h2>
                                                            <{ajaxmodule class="WidgetListAdminPackagePermission" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.adminpackagepermission.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.customaccessright) }>
                    <div id="tab-customaccessrights">
                    	<{if true || $tab == 'customaccessrights'}>
                        	<h2 class="print"><{_t('Custom access right')}></h2>
                                                            <{ajaxmodule class="WidgetListCustomAccessRight" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.customaccessright.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                            <{if isset($smarty.session.acl.permissionsetitem) }>
                    <div id="tab-permissionsetitems">
                    	<{if true || $tab == 'permissionsetitems'}>
                        	<h2 class="print"><{_t('Permission set item')}></h2>
                                                            <{ajaxmodule class="WidgetListPermissionSetItem" method="" readonly=!WorkflowHelper::isEditable($details->WFID) ID_PERMISSION_SET="`$details->ID`" where=""  template='widgetlist.permissionsetitem.tpl'}>
                                                    <{/if}>
                    </div>
                <{/if}>
                    </div>

        <script type="text/javascript">
        $(document).ready(function(){
        	$( "#permissionsettabs" ).tabs({
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
    	bind_hotkey('#permissionsetform', 'f2', 'a.button-save');
    	bind_hotkey('#permissionsetform', 'ctrl+s', 'a.button-save');
    	bind_hotkey('#permissionsetform', 'f3', 'a.button-save-more');
    	bind_hotkey('#permissionsetform', 'ctrl+m', 'a.button-save-more');
    	bind_hotkey('#permissionsetform', 'esc', 'a.button-cancel');
    });

    $(function() {
        $('meta[name=description]').attr('content', '<{$meta_description|escape}>');
    });

    $(function() {
    	$('body').attr('data-type', 'edit');
    });
</script>